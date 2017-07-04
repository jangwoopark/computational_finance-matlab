clc;
clear all;

T=[.5 1. 2]';
S0=[36 40 44]';
CallPut=0;
Strike=40;
RiskFree=.06;
Volatility=.2;


BSE=zeros(length(T),length(S0));

for i=1:length(T)
    for j=1:length(S0)
        BSE(i,j)=BlackScholesEuro(CallPut,S0(j),Strike,RiskFree,T(i),Volatility);
    end;
end;