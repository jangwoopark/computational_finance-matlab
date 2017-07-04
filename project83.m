clc;
clear all;
n=180;
N=1000;
x0=0;
y0=0;
phi0=.03;
r0=.03;
rho=.7;
a=.1;
b=.3;
sigma=.03;
eta=.08;
K=900;
T=.5;
S=1;

% Simulation prices

for l=1:N
for i=1:n
    x=x0;
    y=y0;
    for j=1:i
        h1=randn;
        h2=randn;
        z1=h1;
        z2=rho*h1+sqrt(1-rho^2)*h2;

        x=x-a*x*(T/n)+sigma*sqrt(T/n)*z1;
        y=y-b*y*(T/n)+eta*sqrt(T/n)*z2;
    end
    xT(i)=x;
    yT(i)=y;
end
rT(l)=-T/n*(sum(xT)+sum(yT)+n*phi0);
end
eT=mean(exp(rT));
for l=1:N
for i=1:n
    x=x0;
    y=y0;
    for j=1:i
        h1=randn;
        h2=randn;
        z1=h1;
        z2=rho*h1+sqrt(1-rho^2)*h2;

        x=x-a*x*(S/n)+sigma*sqrt(S/n)*z1;
        y=y-b*y*(S/n)+eta*sqrt(S/n)*z2;
    end
    xS(i)=x;
    yS(i)=y;
end
rS(l)=-S/n*(sum(xS)+sum(yS)+n*phi0);
end
eS=mean(exp(rS));
% Simulation put
SIGMA2=sigma^2*(2*a^3)*(1-exp(-a*(S-T)))^2*(1-exp(-2*a*(T-0)))+eta^2/(2*b^3)*(1-exp(-b*(S-T)))^2*(1-exp(-2*b*(T-0)))+2*rho*sigma*eta/(a*b*(a+b))*(1-exp(-a*(S-T)))*(1-exp(-b*(S-T)))*(1-exp(-(a+b)*(T-0)));

PUTSIM=-eS*normcdf(log(K*eT/eS)/sqrt(SIGMA2)-sqrt(SIGMA2)/2)+eT*K*normcdf(log(K*eT/eS)/sqrt(SIGMA2)+sqrt(SIGMA2)/2);

% Explicit prices

pT=PG2(0,T);
pS=PG2(0,S);

% Explicit put

PUTEXP=-pS*normcdf(log(K*pT/pS)/sqrt(SIGMA2)-sqrt(SIGMA2)/2)+pT*K*normcdf(log(K*pT/pS)/sqrt(SIGMA2)+sqrt(SIGMA2)/2);