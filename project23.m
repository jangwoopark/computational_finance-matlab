clc;
howmany=1000;
norm=randn(howmany,1);
w5=sqrt(5)*norm;
expectw5=mean(w5.^2+sin(w5));

t5=.5;
t4=4;
t8=8;

wt5=sqrt(t5)*norm;
expectwt5=mean(exp(t5/2)*cos(wt5));

wt4=sqrt(t4)*norm;
expectwt4=mean(exp(t4/2)*cos(wt4));

wt8=sqrt(t8)*norm;
expectwt8=mean(exp(t8/2)*cos(wt8));
%variance reduction
mu=[0;0];
sigma=[1 -.7;-.7 1];
bivariate=MultiNormrnd(mu,sigma,howmany);

varred=(bivariate(:,1)+bivariate(:,2))/2;

rwt5=sqrt(t5)*varred;
rexpectwt5=mean(exp(t5/2)*cos(rwt5));

rwt4=sqrt(t4)*varred;
rexpectwt4=mean(exp(t4/2)*cos(rwt4));

rwt8=sqrt(t8)*varred;
rexpectwt8=mean(exp(t8/2)*cos(rwt8));
