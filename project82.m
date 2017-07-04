clc;
clear all;
n=180;
N=1000;
r0=.03;
sigma=.12;
kapa=.2;
rbar=.05;

%a)
K=950;
T=.5;
S=1;

dt=T/n;
x=zeros(N,1);
rt=zeros(n,1);
for i=1:N;
for j=1:n;
    r=r0;
    for k=1:j;
        r=r+kapa*(rbar-r)*dt+sigma*sqrt(r*dt)*randn;
    end;
    rt(j)=r;
end;
x(i)=-T/n*sum(rt);
end;

PTS=Atilda(T,S)*exp(-Btilda(T,S)*rt(n));
ctTS=mean(exp(x)*max(PTS-K,0));

%b)
cTTS=max(ppdbcir(n,N,r0,sigma,kapa,rbar,T)-K,0);

%c)
theta=sqrt(kapa^2+2*sigma^2);
phi=(2*theta)/(sigma^2*(exp(theta*(T-0))-1));
psy=(kapa+theta)/sigma^2;
rstar=(Atilda(T,S)/K)/Btilda(T,S);

PS=Atilda(0,S)*exp(-Btilda(0,S)*r0);
PT=Atilda(0,T)*exp(-Btilda(0,T)*r0);

s1=2*rstar*(phi+psy+Btilda(0,S));
s2=4*kapa*rbar/sigma^2;
s3=(2*phi^2*r0*exp(theta*(T-0)))/(phi+psy+Btilda(0,S));
t1=2*rstar*(phi+psy);
t2=4*kapa*rbar/sigma^2;
t3=(2*phi^2*r0*exp(theta*(T-0)))/(phi+psy);

callcir=PS*ncx2cdf(s1,s2,s3)-K*PT*ncx2cdf(t1,t2,t3);
