// header file for geese MCMC

//void user_wait();
//void anerror(char *error_text);
double GetLik(double *X,double mean,double sd,int datasize);
double maximum (double e, double f);
double rtruncn (double a, double b);
double truncatedwalk (double old, double sd, double low, double high);
double truncatedrat (double old, double sd, double low, double high, double newvalue);
double UpdateMCMC(double newloglik,double oldloglik,double newval,double oldval,double rat);
float gammln(float xx);
double logddirichlet(double *x,double *alpha,int len);
double dlognormal(double *x, double *mean, double **var,int len);
void GaussJordan(int N, double **a, double **y);
float deter(double **a,int forder);
double **generate_identity (int N);
double daddlogdens(double *prop, int len, double *mu, double **sigma);
