// Usefile functions for the geese data set

#include"use.h"
#include<Rmath.h>
#include<math.h>
#include<R.h>
#define eps 1.0e-32

double GetLik(double *X,double mean,double sd,int datasize)
{
// This function gets the normal density for two objects with differing means and sds
    
double Ans=0.0;
int k;

for(k=0;k<datasize;k++)  {
    Ans += dnorm(X[k],mean,sd,1.0);
    //Rprintf("X[k] = %lf, mean=%lf, sd = %lf, Ans = %lf \n",X[k],mean,sd,Ans);
}

return(Ans);

}

//maximum function:

double maximum (double e, double f)
{
    if (e > f)
        return e;
    else
        return f;
}

// RW proposal functions
//rtruncn function:
double rtruncn (double a, double b)
{
    double A, B;
    double maxA, maxB, maxR, r2, r, th, u, x;
    int accept=0;
    
    A = atan(a);
    B = atan(b);
    
    maxA = exp(-pow(a,2)/4)/cos(A);
    maxB = exp(-pow(b,2)/4)/cos(B);
    maxR = maximum(maxA, maxB);
    if((a<1) && (b>-1))
        maxR = exp(-0.25)*sqrt(2.0);
    while (accept==0)
    {
        r2 = runif(0.0,1.0);
        r = sqrt(r2)*maxR;
        th = runif(A,B);
        u = r*cos(th);
        x = tan(th);
        if((pow(x,2)) < (log(u)*-4)) accept = 1;
    }
    return x;
}        


////////////////////////////////////////////////////////////////////////////////

//truncated normal function:
double truncatedwalk (double old, double sd, double low, double high)
{
    double lowlimold, upplimold, y, newvalue;
    lowlimold = (low - old)/sd;
    upplimold = (high - old)/sd;
    y = rtruncn(lowlimold, upplimold);
    newvalue = old + sd*y;
           
    return newvalue;
}

////////////////////////////////////////////////////////////////////////////////

//truncated normal ratio function:
double truncatedrat (double old, double sd, double low, double high, double newvalue)
{
    double lowlimold, upplimold, lowlimnew, upplimnew, plowold, puppold, plownew, puppnew, ratio;
    
    lowlimold = (low - old)/sd;
    upplimold = (high - old)/sd;
    lowlimnew = (low - newvalue)/sd;
    upplimnew = (high - newvalue)/sd;
    //plowold = normal_cdf(lowlimold);
    //puppold = normal_cdf(upplimold);
    //plownew = normal_cdf(lowlimnew);
    //puppnew = normal_cdf(upplimnew);
    plowold = pnorm(lowlimold,0,1,0,0);
    puppold = pnorm(upplimold,0,1,0,0);
    plownew = pnorm(lowlimnew,0,1,0,0);
    puppnew = pnorm(upplimnew,0,1,0,0);
    ratio = (puppold - plowold)/(puppnew - plownew);
    return ratio;        
}


double UpdateMCMC(double newloglik,double oldloglik,double newval,double oldval,double rat)
{
// Function to update MCMC when given log likelihoods

double u,mh;
u = runif(0.0,1.0);
mh = exp(newloglik - oldloglik)*rat;
if (u <= mh)
{
	return(newval);
} else 
{
	return(oldval);
}

}

float gammln(float xx)
// Returns the value log(Gamma(xx)) for xx>0
{
    double x,y,tmp,ser;
    static double cof[6] = {76.18009172947146,-86.50532032941677,
        24.01409824083091,-1.231739572450155,
        0.1208650973866179e-2,-0.5395239384953e-5};
    int j;

    y=x=xx;
    tmp=x+5.5;
    tmp -= (x+0.5)*log(tmp);
    ser=1.000000000190015;
    for(j=0;j<=5;j++) ser+=cof[j]/++y;
    return -tmp+log(2.5066282746310005*ser/x);
}

double logddirichlet(double *x,double *alpha,int len)
{

//logD <- sum(lgamma(alpha)) - lgamma(sum(alpha))
//s <- sum((alpha - 1) * log(x))
//sum(s) - logD)

// This function calculates the log dirichlet density
double logD=0.0,logdens,sumalpha=0.0,s=0.0;
int k;

for(k=0;k<len;k++) {
    s += (alpha[k]-1)*log(x[k]);
    sumalpha += alpha[k];
    logD += gammln(alpha[k]);
}
logD -= gammln(sumalpha);

logdens = s-logD;

return(logdens);

}

void GaussJordan(int N, double **b, double **y)
{



//use generate_identity function to make y the indentity. Then call GaussJordan
//with a the matrix to invert. a gets turned into the identity, so make a copy
//if you need to keep it. N is the dimension of the matrix. 
	int             c, r, r_max, i, j;
	double          temp, v_v, v_max, factor = 0.0;

// Make it non-destructive
double a[N][N];

for(i=0;i<N;i++) {
  for(j=0;j<N;j++) {
    a[i][j] = b[i][j];
  }
}

	/* Loop over all columns of A */
	for (c = 0; c < N; c++)
	{			/* Find row with the maximum value absolute
				 * value. */
		r_max = c;
		v_max = fabs(a[c][c]);
		for (r = c + 1; r < N; r++)
		{
			v_v = fabs(a[r][c]);
			if (v_v > v_max)
			{
				r_max = r;
				v_max = v_v;
			}
		} /* Switch rows if necessary */ if (r_max != c)
		{
			for (j = c; j < N; j++)
			{
				temp = a[c][j];
				a[c][j] = a[r_max][j];
				a[r_max][j] = temp;
			} for (j = 0; j < N; j++)
			{
				temp = y[c][j];
				y[c][j] = y[r_max][j];
				y[r_max][j] = temp;
			}
		}		/* Rescale current row so that diagonal
		    element is 1 */ factor = a[c][c];
		if (fabs(factor) <= eps)
		{
			error("singular matrix\n");
		} for (j = c; j < N; j++)
		{
			a[c][j] /= factor;
		} for (j = 0; j < N; j++)
		{
			y[c][j] /= factor;
		} /* Subtract current row from all rows below. */
		for (r = c + 1; r < N; r++)
		{
			factor = a[r][c];
			for (j = c; j < N; j++)
				a[r][j] -= factor * a[c][j];
			for (j = 0; j < N; j++)
				y[r][j] -= factor * y[c][j];
		}
	
	}
	/*loop over all rows from 1 to end*/
	for (c = 1; c < N; c++)
		{
		/*Subtract current row from all rows above.*/
		for (j = 0; j < N-c; j++)
			{
			factor = a[j][N-c];
			for (r = 0; r < N; r++)
				{
				a[j][r] =a[j][r] - factor * a[N-c][r];
				y[j][r] =y[j][r] - factor * y[N-c][r];
				}
			}
		}
	return;
}

double **generate_identity (int N)
{
double **matrix;
matrix = (double **)calloc(N, sizeof(double *));
int i;
for (i = 0; i < N; i ++)
        {
        matrix[i] = (double *)calloc(N, sizeof(double));
        }
for (i = 0; i < N; i ++)
        {
        /*put ones on the diagonal. Calloc puts zeros off it*/
        matrix[i][i] = 1.0;
        }
return matrix;
}

float deter(double **a,int forder)
{
  double b[forder][forder];
  int i,j,k;
  float mult;
  float deter=1;
  
  for(i=0;i<forder;i++) {
  	for(j=0;j<forder;j++) {
      b[i][j] = a[i][j];
	  }
	}
	
  for(i=0;i<forder;i++) {
  	for(j=0;j<forder;j++) {
  	  mult=b[j][i]/b[i][i];
	  for(k=0;k<forder;k++)
	  {
		if(i==j) break;
		b[j][k]=b[j][k]-b[i][k]*mult;
	  }
	}
  }
  for(i=0;i<forder;i++)
  {
	deter=deter*b[i][i];
  }
  return(deter);
}


double dlognormal(double *x, double *mean, double **var,int len)
{

// The log density of the multivariate normal distribution
// (-nrow(y)/2)*log(2*pi)-0.5*log(det(cov))-0.5*t(y-mean)%*%solve(cov)%*%(y-mean)
double dens,determinant,**invvar,**vartemp,bigsum=0;
int i,j;

vartemp = (double **)calloc(len, sizeof(double *));
for (i=0;i<len;i++) {
    vartemp[i] = (double *)calloc(len, sizeof(double));
}

for(i=0;i<len;i++) {
  for(j=0;j<len;j++) {
    vartemp[i][j]=var[i][j];
  }
}

determinant = deter(vartemp,len);
invvar = generate_identity(len);
GaussJordan(len,var,invvar);

for(i=0;i<len;i++) {
  for(j=0;j<len;j++) {
    bigsum += (x[j]-mean[j])*(x[i]-mean[i])*invvar[i][j];
  }
}

dens = -(double)len/2 * log(2*PI) - 0.5*log(determinant)-0.5*bigsum;

return(dens);

}

double daddlogdens(double *prop, int len, double *mu, double **sigma) {

// This function calculates the log density of a additive logistic transformed
// set of proportions

double y[len-1],dens;
int i;

for(i=0;i<len-1;i++) y[i] = log(prop[i]/(prop[i]+1));

dens = dlognormal(y, mu, sigma, len-1);

return(dens);

}
