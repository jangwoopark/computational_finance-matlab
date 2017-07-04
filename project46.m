clc;
clear all;

T=.5;
r=.05;
sig=.24;
P=32;
K=30;
n=[10 15 20 40 70 80 100 200 500];

callprices=zeros(length(n),1);
callpriceslog=zeros(length(n),1);

for i=1:length(n);
    callprices(i)=TrinomEuro(P,K,r,T,sig,n(i));
    callpriceslog(i)=TrinomEuroLog(P,K,r,T,sig,n(i));
end;

plot(n, [callprices callpriceslog]);
h = legend('St','Xt',1);
set(h,'Interpreter','none')
