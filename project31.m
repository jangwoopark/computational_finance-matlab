clc;
n=1000;
xs0=1;
T=2;
x2=zeros(n,1);
for i=1:n;
    x=xs0;
    for k=1:i;
    x=x+(1/5-1/2*x)*(T/n)+2/3*sqrt(T/n)*randn;
    end;
    x2(i)=x;
end;

x213=nthroot(x2,3);
Ex213=mean(x213);

ys0=3/4;
yT=3;
y3=zeros(n,1);
for j=1:n;
    y=ys0;
    for p=1:j;
    y=y+(2/(1+yT)*y+(1+yT^3)/3)*yT/n+(1+yT^3)/3*sqrt(yT/n)*randn;
    end;
    y3(j)=y;
end;

Ey3=mean(y3);

yT2=2;
y2=zeros(n,1);
for j=1:n;
    y=ys0;
    for p=1:j;
    y=y+(2/(1+yT2)*y+(1+yT2^3)/3)*yT2/n+(1+yT2^3)/3*sqrt(yT2/n)*randn;
    end;
    y2(j)=y;
end;

one=zeros(n,1);
for l=1:n;
    if x2(l)>1
       one(l)=1;
    end;
end;

x2y2one=x2.*y2.*one;
Ex2y2one=mean(x2y2one);

five=zeros(n,1);
for r=1:n;
    if y2(r)>5
        five(r)=1;
    end;
end;

Py2=sum(five)/n;