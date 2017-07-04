clc;
r=.04;
sigma=.2;
T=10;
dt=10/1000;
howmany=1000;

s1=zeros(11,1); 
s2=zeros(11,1); 
s3=zeros(11,1); 
s4=zeros(11,1); 

r1=randn(howmany,1);
r2=randn(howmany,1);
r3=randn(howmany,1);
r4=randn(howmany,1);

for i=1:howmany;
    Snod=88;
for p=1:i;
s1T=Snod*exp(sigma*sqrt(dt)*r1(p)+(r-sigma^2/2)*dt);
s2T=Snod*exp(sigma*sqrt(dt)*r2(p)+(r-sigma^2/2)*dt);
s3T=Snod*exp(sigma*sqrt(dt)*r3(p)+(r-sigma^2/2)*dt);
s4T=Snod*exp(sigma*sqrt(dt)*r4(p)+(r-sigma^2/2)*dt);
end;
    s1(i)=s1T;
    s2(i)=s2T;
    s3(i)=s3T;
    s4(i)=s4T;
end;
s1e=zeros(10,1);
s2e=zeros(10,1);
s3e=zeros(10,1);
s4e=zeros(10,1);

for i=100:100:1000
    s1e(i/100)=exp(-r*i/100)*s1(i);
    s2e(i/100)=exp(-r*i/100)*s2(i);
    s3e(i/100)=exp(-r*i/100)*s3(i);
    s4e(i/100)=exp(-r*i/100)*s4(i);
end;

subplot(2,1,1);
plot([s1 s2 s3 s4]);
subplot(2,1,2);
plot([s1e s2e s3e s4e]);