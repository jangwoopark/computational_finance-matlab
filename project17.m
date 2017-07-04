clc;
n=zeros(5000,1);
for i=1:5000
    n(i,1)=normrnd(0,1);
end;

bin=-4:.1:4;
hist(n,bin);

% 1.8
mn=mean(n);
[h,p,ci]=ttest(n,0);
