// New version of SIAR which incorporates concentration dependence

#include<time.h>
#include"use.h"
#include<R.h>
#include<Rmath.h>

void siarmcmcv4(int *numdata,int *numplants,int *numiso,int *numgroups,int *startat, int *endat, int *iterations,int *burnin,int *howmany,int *thinby, double *prior, double *data, double *concdep, double *plants, double *corrections,double *pars) 
{

//////////////////////////// INPUTS ///////////////////////////////
Rprintf("Stable Isotope Analysis in R \n");
Rprintf("An MCMC for Normally distributed data with a dirichlet mixture mean \n");
Rprintf("-------------------------------------------------------------------------\n \n");
if(*numgroups == 1) {
    Rprintf("This is the single group version with the following parameters: \n");
} else {
    Rprintf("This is the multi-group version with the following parameters: \n");
    Rprintf("Number of goups: %i \n",*numgroups);
}
Rprintf("Number of iterations: %i \n",*iterations);
Rprintf("Burn in: %i \n",*burnin);
Rprintf("Thinning by: %i \n",*thinby);
Rprintf("Number of isotopes: %i \n",*numiso);
Rprintf("Number of sources: %i \n",*numplants);

// Declare some variables and read in everything
float theparameters[(*iterations-*burnin)/(*thinby)][(*numiso+*numplants)*(*numgroups)];
double thedatabig[*numdata][*numiso],theplants[*numplants][*numiso*2],thecorrections[*numplants][2*(*numiso)],q[*numplants][*numiso*2];
int groupsize;

// Read in each in turn from the data
// No idea why this has to start at i+3!
int i,j,k=-20;
for(i=0;i<*numdata;i++) for(j=0;j<*numiso;j++) thedatabig[i][j] = data[j*(*numdata)+i];
for(i=0;i<*numplants;i++) for(j=0;j<*numiso*2;j++) q[i][j] = concdep[j*(*numplants)+i];
for(i=0;i<*numplants;i++) for(j=0;j<*numiso*2;j++) theplants[i][j] = plants[j*(*numplants)+i];
for(i=0;i<*numplants;i++) for(j=0;j<2*(*numiso);j++) thecorrections[i][j] = corrections[j*(*numplants)+i];
for(i=0;i<(*iterations-*burnin)/(*thinby);i++) for(j=0;j<(*numgroups)*(*numiso+*numplants);j++) theparameters[i][j] = 0.0;

// Loop through groups here
int m;
for(m=0;m<*numgroups;m++) {

// print out the group number
if(*numgroups>1) Rprintf("Running group number %i of %i... \n",m+1,*numgroups);

// Now get the bits relevant to this particular group
double thedata[endat[m]-startat[m]+1][*numiso];
groupsize = endat[m]-startat[m]+1;
for(i=0;i<groupsize;i++) {
    for(j=0;j<*numiso;j++) {
        thedata[i][j] = thedatabig[i+startat[m]-1][j];
        }
}

// Get starting values and stuff like that
double p[*numplants],pnew[*numplants],sump,sumpnew,Xsd[*numiso],Xsdnew[*numiso],Animsdratios[*numiso];
double meanold[*numiso],meannew[*numiso],piyp,pixp,piyXsd[*numiso],pixXsd[*numiso],Animsd[*numiso],Animsdnew[*numiso];
double theprior[*numplants],sumpq;

for(i=0;i<*numplants;i++) theprior[i] = prior[i];

// Start with the RNG
GetRNGstate();

// Get initial values for everything
sump = 0.0;
for(k=0;k<*numplants;k++) p[k] = runif(0.0,1.0);
for(k=0;k<*numplants;k++) sump += p[k];
for(k=0;k<*numplants;k++) p[k] = p[k]/sump;
sump = 0.0;
for(k=0;k<*numplants;k++) sump += p[k];

for(k=0;k<*numiso;k++) {
    Animsd[k] = 10.0;
    Xsd[k] = 0.0;
	sumpq = 0.0;
    for(j=0;j<*numplants;j++) {
		  Xsd[k] += (pow(p[j],2)*pow(q[j][2*k],2))*(pow(theplants[j][2*k+1],2)+pow(thecorrections[j][2*k+1],2));
		  sumpq += p[j]*q[j][2*k];
	}  
	Xsd[k] = Xsd[k]/pow(sumpq,2);
    Xsd[k] += pow(Animsd[k],2);
    Xsd[k] = sqrt(Xsd[k]);
}       

// Now get a first guess at the mean
for(k=0;k<*numiso;k++) {
    meanold[k] = 0.0;
	sumpq = 0.0;
    for(j=0;j<*numplants;j++) {
		meanold[k] += p[j]*q[j][2*k]*(theplants[j][2*k]+thecorrections[j][2*k]);
		sumpq += p[j]*q[j][2*k];
	}
	meanold[k] = meanold[k]/sumpq;	
}

// And get a first guess at the likelihood
pixp = 0.0;
double tempdata[groupsize];
for(k=0;k<*numiso;k++) {
    for(j=0;j<groupsize;j++) tempdata[j] = thedata[j][k];
    pixp += GetLik(tempdata,meanold[k],Xsd[k],groupsize);
    pixXsd[k] = GetLik(tempdata,meanold[k],Xsd[k],groupsize)+dunif(Animsd[k],0.0,1000.0,1);
}
pixp += logddirichlet(p,theprior,*numplants);

// Get some useful markers
int accept;

// Put in some timing
clock_t cstart, cend;
cstart = clock();

// Start iterations
for(i=0;i<*iterations+1;i++) {
    if(i%*howmany==0) Rprintf("%i \n",*iterations-i);

    // Update the p's
    sumpnew = 0.0;
    double u = runif(0,1);
    if(u<0.5) {
        for(k=0;k<*numplants;k++) pnew[k] = runif(0,1);
    } else {
        for(k=0;k<*numplants;k++) {
            pnew[k] = p[k] + runif(-0.05,0.05);
            while(pnew[k]< 0.0) pnew[k] = p[k] + runif(-0.01,0.01);
        }
    }
    
    for(k=0;k<*numplants;k++) sumpnew += pnew[k];
    for(k=0;k<*numplants;k++) pnew[k] = pnew[k]/sumpnew;
    
    // Now update the parameters
    for(k=0;k<*numiso;k++) {
        meannew[k] = 0.0;
        Xsdnew[k] = 0.0;
		sumpq = 0.0;
		for(j=0;j<*numplants;j++) {
            meannew[k] += pnew[j]*q[j][2*k]*(theplants[j][2*k]+thecorrections[j][2*k]);
            Xsdnew[k] += (pow(pnew[j],2)*pow(q[j][2*k],2))*(pow(theplants[j][2*k+1],2)+pow(thecorrections[j][2*k+1],2));
			sumpq += pnew[j]*q[j][2*k];
		}
		Xsdnew[k] = Xsdnew[k]/pow(sumpq,2);
        Xsdnew[k] += pow(Animsd[k],2);
        Xsdnew[k] = sqrt(Xsdnew[k]);
		meannew[k] = meannew[k]/sumpq;	
    }
    
    piyp = 0.0;
    for(k=0;k<*numiso;k++) {
        for(j=0;j<groupsize;j++) tempdata[j] = thedata[j][k];
        piyp += GetLik(tempdata,meannew[k],Xsdnew[k],groupsize);
    }
    piyp += logddirichlet(pnew,theprior,*numplants);

    accept = (int)UpdateMCMC(piyp,pixp,1,0,1.0);
    if(accept==1) {
        for(k=0;k<*numiso;k++) {
            meanold[k] = meannew[k];
            Xsd[k] = Xsdnew[k];
        }
        pixp = piyp;
        for(j=0;j<*numplants;j++) p[j] = pnew[j];
    }    
 
    // Update the standard deviations
    for(k=0;k<*numiso;k++) {
        Animsdnew[k] = truncatedwalk(Animsd[k],2.0,0.0,10000.0);
        Animsdratios[k] = truncatedrat(Animsd[k],2.0,0.0,10000.0,Animsdnew[k]);

        Xsdnew[k] = 0.0;
		sumpq = 0.0;
        for(j=0;j<*numplants;j++) {
			Xsdnew[k] += (pow(p[j],2)*pow(q[j][2*k],2))*(pow(theplants[j][2*k+1],2)+pow(thecorrections[j][2*k+1],2));
			sumpq += p[j]*q[j][2*k];
		}
		Xsdnew[k] = Xsdnew[k]/pow(sumpq,2);
        Xsdnew[k] += pow(Animsdnew[k],2);
        Xsdnew[k] = sqrt(Xsdnew[k]);     

        for(j=0;j<groupsize;j++) tempdata[j] = thedata[j][k];

		piyXsd[k] = GetLik(tempdata,meanold[k],Xsdnew[k],groupsize)+dunif(Animsdnew[k],0.0,1000.0,1);
        pixXsd[k] = GetLik(tempdata,meanold[k],Xsd[k],groupsize)+dunif(Animsd[k],0.0,1000.0,1);
        
        accept = (int)UpdateMCMC(piyXsd[k],pixXsd[k],1,0,Animsdratios[k]);
        if(accept==1) {
            //pixXsd[k] = piyXsd[k];
            Animsd[k] = Animsdnew[k];
            Xsd[k] = Xsdnew[k];        
        } 

    }

    // Update into parameters matrix - again with the bizarre + 3 thing
    if((i%*thinby==0) & (i>=*burnin)) {
        for(j=0;j<*numplants;j++) {
            theparameters[(i-*burnin)/(*thinby)][j+(*numplants+*numiso)*m] = p[j];
        }
        for(j=0;j<*numiso;j++) {
            theparameters[(i-*burnin)/(*thinby)][j+*numplants+(*numplants+*numiso)*m] = Animsd[j];
        }
    }

    // Update the RNG
    PutRNGstate();

// End of iterations
}

// Sort out the iterations
for(i=0;i<(*iterations-*burnin)/(*thinby);i++) {
    for(j=0;j<(*numgroups)*(*numiso+*numplants);j++)
        pars[j*((*iterations-*burnin)/(*thinby))+i] = theparameters[i][j];
}

// Report the timings
cend = clock();
Rprintf("Job completed successfully. \n");
Rprintf("Duration: %5.1f seconds. \n",(float) (cend-cstart)/CLOCKS_PER_SEC);

// End of group
}

// End of function
}


