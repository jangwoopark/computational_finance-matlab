clc;
s0=20; 
k=20; 
T=.5; 
sigma=0.25; 
r=0.04; 
nsteps=2;
dt=T/(nsteps-1);
n=10000;
mu=[0;0];
sigman=[1 .5;.5 1];
howmany=n;
bivariate=MultiNormrnd(mu,sigman,howmany);
st1=zeros(n,1);
st2=zeros(n,1);
s=zeros(n,1);
for i=1:n;
    st1=s0;
    st2=s0;
    for p=2:nsteps;
    st1=st1*exp((r-sigma^2/2)*dt+sigma*sqrt(dt)*bivariate(i,1));
    st2=st2*exp((r-sigma^2/2)*dt+sigma*sqrt(dt)*bivariate(i,2));
    end;
    s(i)=(st1+st2)/2;
end;
pays=max(s-k,0);
ecall=exp(-r*T)*mean(pays);

itm=zeros(n,1);
for m=1:n
if s(m)>=k
    itm(m)=1;
end;
end;
pitm=sum(itm)/n;