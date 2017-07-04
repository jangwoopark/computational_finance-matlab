clc;
r=.04;
sigma=.2;
Snod=88;
T=10;
X=100;
howmany=1000;
norm=randn(howmany,1);
wT=sqrt(T)*norm;

c=exp(-r*T)*(max(0,(Snod*exp((r-sigma^2/2)*T+sigma*wT)-X)));

cmean=mean(c);

%variance reduction
rwT=sqrt(T)*randn(howmany,1);
rcplus=exp(-r*T)*(max(0,(Snod*exp((r-sigma^2/2)*T+sigma*rwT)-X)));
rcminus=exp(-r*T)*(max(0,(Snod*exp((r-sigma^2/2)*T+sigma*(-rwT))-X)));

rc=zeros(howmany,1);

for j=1:howmany
    rc(j,1)=(rcplus(j,1)+rcminus(j,1))/2;
end
rcmean=mean(rc);