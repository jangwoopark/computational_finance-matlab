clc;
clear all;

%%%%%%%%% parameters setting  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S0=100; %underlying price 1
K=98; %strike
T=1; %maturity
sigma=0.125; %volatility
r=0.08; %risk free rate
nsteps=2;
nsimulations=10000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dt=T/(nsteps-1);
vsqrdt=sigma*dt^0.5;
drift=(r-sigma^2/2)*dt;
svec=zeros(nsimulations,1);
for i=1:nsimulations,
 st=S0;
 curtime=0;
 for k=2:nsteps,
  curtime=curtime+dt;
  randvar=randn;
  st=st*exp(drift+vsqrdt*randvar);
 end
 svec(i)=st;
end

payoffvec=max(svec-K,0);
MC_callprice=exp(-r*T)*mean(payoffvec);
