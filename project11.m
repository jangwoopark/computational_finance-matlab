clc;
random=zeros(10000,1);
u=zeros(10000,1);
random(1,1)=1;
m=2^31-1;

for i=1:10000-1
random(i+1,1)=mod((7^5)*random(i,1),m);
u(i+1,1)=random(i+1,1)/m;
end;

bins=0:.1:1;
subplot(2,1,1); 
hist(u,bins), title('Manually constructed');
subplot(2,1,2); 
r=rand(10000,1);
hist(r,bins), title('Matlab rand()');

[h,p,ci]=ttest(u,r)