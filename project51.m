clc;
clear all;

T=[.5 1 2]';
S0=[36 40 42]';
k=[2 3 4];

lagprice=zeros(length(T),length(S0),length(k));

for i=1:length(T)
    for j=1:length(S0)
        for p=1:length(k)
            lagprice(i,j,p)=Laguerre(T(i),S0(j),k(p));
        end;
    end;
end;

hermprice=zeros(length(T),length(S0),length(k));

for i=1:length(T)
    for j=1:length(S0)
        for p=1:length(k)
            hermprice(i,j,p)=Hermite(T(i),S0(j),k(p));
        end;
    end;
end;

monprice=zeros(length(T),length(S0),length(k));

for i=1:length(T)
    for j=1:length(S0)
        for p=1:length(k)
            monprice(i,j,p)=monomial(T(i),S0(j),k(p));
        end;
    end;
end;
