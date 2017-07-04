clc;
random=zeros(10000,1);
u=zeros(10000,1);
random(1,1)=1;
m=2^31-1;

for i=1:10000-1
random(i+1,1)=mod((7^5)*random(i,1),m);
u(i+1,1)=random(i+1,1)/m;
end;

x=zeros(10000,1);
for j=1:10000
x(j,1)=log(1-u(j,1))/(-1.5);
end;

bins=0:1:11;
hist(x,bins);