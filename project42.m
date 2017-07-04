clc;
clear all;

T=.75;
r=.02;
P=529.06;
K=P*1.2-mod(P*1.2,10);
n=[10 15 20 40 70 80 100 200 500]';

[data,txt]=xlsread('google.xls');
logdata=zeros(length(data)-1,1);
for i=2:length(data);
    logdata(i-1)=log(data(i,7)/data(i-1,7));
end;
sig=std(logdata)*sqrt(256);

callpricesa=zeros(length(n),1);
callpricesb=zeros(length(n),1);
callpricesc=zeros(length(n),1);
callpricesd=zeros(length(n),1);

for i=1:length(n);
    callpricesa(i)=BinomEuroa(P,K,r,T,sig,n(i));
    callpricesb(i)=BinomEurob(P,K,r,T,sig,n(i));
    callpricesc(i)=BinomEuroc(P,K,r,T,sig,n(i));
    callpricesd(i)=BinomEurod(P,K,r,T,sig,n(i));
end;

callprices=[callpricesa callpricesb callpricesc callpricesd];
plot(n, callprices);
h = legend('a','b','c','d');
set(h,'Interpreter','none')
