clc;
random=zeros(5000,1);
u=zeros(5000,1);
random(1,1)=1;
m=2^31-1;

for i=1:5000-1
random(i+1,1)=mod((7^5)*random(i,1),m);
u(i+1,1)=random(i+1,1)/m;
end;

% Box Muller
z1=zeros(5000,1);
z2=zeros(5000,1);

tic;
for j=1:5000
    z1(j,1)=sqrt((-2)*log(u(j,1)))*cos(2*pi*u(5001-j,1)); 
    z2(j,1)=sqrt((-2)*log(u(j,1)))*cos(2*pi*u(5001-j,1));
end;
toc;

z2=z2(z2~=Inf);

bins=-4:.01:4;
subplot(2,2,1);
hist(z1,bins), title('z1 Box Muller');
subplot(2,2,2);
hist(z1,bins), title('z2 Box Muller');

% Polar Marsaglia
v1=zeros(5000,1);
v2=zeros(5000,1);
for k=1:5000
    v1(k,1)=2*u(k,1)-1;
    v2(k,1)=2*u(5001-k,1)-1;
end;

w=v1.^2+v2.^2;

b1=zeros(5000,1);
b2=zeros(5000,1);

tic;
for n=1:5000
    if (w(n,1)<=1)
    b1(n,1)=v1(n,1)*sqrt(-2*log(w(n,1))/w(n,1));
    b2(n,1)=v2(n,1)*sqrt(-2*log(w(n,1))/w(n,1));
    end;
end;
toc;
b1=b1(b1~=0);
b2=b2(b2~=0);

subplot(2,2,3);
hist(b1,bins), title('b1 Polar Marsaglia');
subplot(2,2,4);
hist(b2,bins), title('b2 Polar Marsaglia');

% the Polar-Marsaglia method is more efficient.
z1=z1(z1~=-Inf);
z2=z2(z2~=-Inf);
% 1.8
mz1=mean(z1);
mz2=mean(z2);
mb1=mean(b1);
mb2=mean(b2);
[hbm1,pbm1,cibm1]=ttest(z1,0);
[hbm2,pbm2,cibm2]=ttest(z2,0);
[hpm1,ppm1,cipm1]=ttest(b1,0);
[hpm2,ppm2,cipm2]=ttest(b2,0);
