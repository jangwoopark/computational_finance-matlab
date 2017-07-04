clc;
random=zeros(1000,55);
u=zeros(1000,55);

for e=1:55
random(1,e)=rand(1,1);
end;
m=2^31-1;

for j=1:55
    for i=1:1000-1
    random(i+1,j)=mod((7^5)*random(i,j),m);
    u(i+1,j)=random(i+1,j)/m;
    end;
end;

y=zeros(1000,55);

for t=1:55
for k=1:1000-1
    if (u(k,t)<=0.64) 
        y(k,t)=1;
    else y(k,t)=0;
    end;
end;
end;

x=y';
r=sum(x);

bins=0:1:55;
hist(r,bins);

h=zeros(1000,1);

for w=1:1000
    if (r(1,w)>=40)
        h(w,1)=1;
    else h(w,1)=0;
    end;
end;

prob=sum(h)/1000;

% p(40)+p(41)+p(42)+p(43)+p(44)=0.00005 from an online binomial calculator
% while prob=.003