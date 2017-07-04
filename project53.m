clc;
clear all;
P=65;
K=60;
alpha=P/K-1;
div=0;
r=.06;
b=r-div;
sig=.2;
T=1;
t=.2;
CallPut=1;

ouput=putEurofs(CallPut,alpha,b,sig,T,t,r,P);