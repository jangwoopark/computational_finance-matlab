clc;
clear all;
n=180;
N=1000;
r0=.03;
sigma=.15;
kapa=.2;
rbar=.05;
%a)
P5=ppdb(n,N,r0,sigma,kapa,rbar,.5);
P5AB=A(0,.5)*exp(-B(0,.5)*r0);
%b)
Tn=.5:.5:4;
C=[30 30 30 30 30 30 30 1030]';
P=zeros(length(C),1);
rt=zeros(n,1);
x=zeros(N,1);

for q=1:length(C);
for i=1:N;
for j=1:n;
    r=r0;
    for k=1:j;
        r=r+kapa*(rbar-r)*Tn(q)/n+sigma*sqrt(Tn(q)/n)*randn;
    end;
    rt(j)=r;
end;
x(i)=-Tn(q)/n*sum(rt);
end;
P(q)=C(q)*mean(exp(x));
end;
eP=sum(P);

%c)
K=950;
P3=ppdb(n,N,r0,sigma,kapa,rbar,.25);
P3AB=A(0,.25)*exp(-B(0,.25)*r0);

sigmap=sqrt((1-exp(-2*kapa*(.25-0)))/(2*kapa))*((1-exp(-kapa*(.5-.25)))/kapa)*sigma;
d1=(P5/(K*P3))/sigmap+sigmap/2;
d2=d1-sigmap;

c53=P5*normcdf(d1)-K*P3*normcdf(d2);

%d)
PAB=zeros(length(C),1);
for i=1:length(C)
PAB(i)=A(0,Tn(i))*exp(-B(0,Tn(i))*r0);
end

aeq=zeros(length(C),1);
beq=zeros(length(C),1);
for i=1:length(C)
    aeq(i)=A(.25,Tn(i));
    beq(i)=B(.25,Tn(i));
end;
display(aeq);
display(beq);
display(C);
clear rs;
rs=solve('30*0.9997*exp(-0.2439*rstar)+30*0.9987*exp(-0.6965*rstar)+30*0.9989*exp(-1.1060*rstar)+30*1.0019*exp(-1.4766*rstar)+30*1.0090*exp(-1.8119*rstar)+30*1.0212*exp(-2.1153*rstar)+30*1.0390*exp(-2.3898*rstar)+1030*1.0633*exp(-2.6382*rstar)-950','rstar');
%rstar=0.131944

Ki=zeros(length(C),1);

for i=1:length(C)
    Ki(i)=A(.25,Tn(i))*exp(-B(.25,Tn(i))*rs);
end

sigmai=zeros(length(C),1);
for i=1:length(C)
    sigmai(i)=(sigma/kapa)*(1-exp(-kapa*(Tn(i)-.25)))*sqrt((1/(2*kapa))*1-exp(-2*kapa*(.25-0)));
end

diplus=zeros(length(C),1);
diminus=zeros(length(C),1);
for i=1:length(C)
    diplus=(1/sigmai(i))*log(PAB(i)/(Ki(i)*P3AB))+sigmai(i)/2;
    diminus=(1/sigmai(i))*log(PAB(i)/(Ki(i)*P3AB))-sigmai(i)/2;
end

coupon=zeros(length(C),1);
for i=1:length(C)
    coupon(i)=C(i)*(PAB(i)*normcdf(diplus)-Ki(i)*normcdf(diminus));
end
callcoupon=sum(coupon);