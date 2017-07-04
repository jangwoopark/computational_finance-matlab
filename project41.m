clc;
clear all;

T=.5;
r=.05;
sig=.18;
P=50;
K=50;
n=[10 15 20 40 70 80 100 200 500]';
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

%BinomialEuro(1,P,K,r,0,T,sig,500);