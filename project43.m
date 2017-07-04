clc;
clear all;

S0=49;
K=50;
r=.03;
sig=.2;
T=.3846;
mu=.14;

s0=10:2:80;
t=0:.01:.3846;

deltas=zeros(36,1);
deltat=zeros(36,1);
gamma=zeros(36,1);
theta=zeros(36,1);
vega=zeros(36,1);
rho=zeros(36,1);
for i=1:length(t);
    deltat(i)=D(S0,K,r,mu,t(i),sig);
end;
for i=1:length(s0);
    deltas(i)=D(s0(i),K,r,mu,T,sig);
    gamma(i)=G(s0(i),K,r,mu,T,sig);
    theta(i)=Th(s0(i),K,r,mu,T,sig);
    vega(i)=V(s0(i),K,r,mu,T,sig);
    rho(i)=R(s0(i),K,r,mu,T,sig);
end;

greek=[deltas theta gamma vega rho];
subplot(2,1,1);
plot(s0, greek);
h = legend('delta','theta','gamma','vega','rho',3);
set(h,'Interpreter','none');
subplot(2,1,2);
plot(t, deltat);
u = legend('delta',4);
set(u,'Interpreter','none');
