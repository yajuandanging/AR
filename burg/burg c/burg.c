#include"stdlib.h"
void burg(double x[],int n,int p,double a[],double *v)
{	int i,k;
	double r0,sumd,sumn,*b,*ef,*eb;
	b=(double *)malloc((p+1)*sizeof(double));
	ef=(double *)malloc(n*sizeof(double));
	eb=(double *)malloc(n*sizeof(double));
	a[0]=1.0;
	r0=0.0;
	for(i=0;i<n;i++)
	{r0+=x[i]*x[i]/n;}
	v[0]=r0;
	for(i=1;i<n;i++)
	{
		ef[i]=x[i];
		eb[i-1]=x[i-1];
	}
	for(k=1;k<=p;k++)
	{
		sumn=0.0;
		sumd=0.0;
		for(i=k;i<n;i++)
		{
			sumn+=ef[i]*eb[i-1];
			sumd+=ef[i]*ef[i]+eb[i-1]*eb[i-1];
		}
		a[k]=-2*sumn/sumd;
		for(i=1;i<k;i++)
		{b[i]=a[i]+a[k]*a[k-i];}
		for(i=1;i<k;i++)
		{a[i]=b[i];}
		v[0]=(1.0-a[k]*a[k])*v[0];
		for(i=(n-1);i>=(k+1);i--)
		{
			ef[i]=ef[i]+a[k]*eb[i-1];
			eb[i-1]=eb[i-2]+a[k]*ef[i-1];
		}
	}
	free(b);
	free(ef);
	free(eb);
}
