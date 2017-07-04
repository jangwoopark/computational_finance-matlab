1;

%Calculates price for Put Options using
%implicit finite difference method as described in 
%Hull's book "Options,Futures and other Derivatives"
%in section 18.8 
clc;
clear all;

%------ Enter parameters
S=10; %spot price
K=10; %strike
r=0.04; %risk free rate
v=0.2; %volatility
T=6/12; %Time to maturity
M=20; %no. of steps in stock price
N=10; %no of time steps
ExerciseType='e'; %set 'a' for American / 'e' for European 
%----------------


dt=T/N; %time step size
smax=S*2;
ds=smax/M; %stock price step size

f=zeros(M+1,1); %vector to store option price grid

for j=0:M,
	f(j+1)=max(K-j*ds,0);
end

fold=f;

a=zeros(M-1,1);
b=zeros(M-1,1);
c=zeros(M-1,1);

payvec=zeros(M-1,1);
%use eqn 18.25 to load values aj,bj,cj
for j=1:M-1,
	a(j)=0.5*r*j*dt-0.5*v*v*j*j*dt;
	b(j)=1+v*v*j*j*dt+r*dt;
	c(j)=-0.5*r*j*dt-0.5*v*v*j*j*dt;
	payvec(j)=K-j*ds;
end

f=zeros(M+1,1);

%Apply boundary conditions for Put
f(1)=K;
f(M+1)=0;

%matrix of coffecients for set of equations in 18.29
Cmat=zeros(M-1,M-1); 
Cmat(1,1)=b(1);
Cmat(1,2)=c(1);

Cmat(M-1,M-2)=a(M-1);
Cmat(M-1,M-1)=b(M-1);

for j=2:M-2,
	Cmat(j,j-1)=a(j);
	Cmat(j,j)=b(j);
	Cmat(j,j+1)=c(j);
end

invCmat=inv(Cmat); %cache value as it does not change in loop below

%Start rollback of time steps
for i=1:N,
	%Load RHS vector 
	Fvec=zeros(M-1,1);
	Fvec(1)=fold(2)-a(1)*f(1);
	Fvec(M-1)=fold(M)-c(M-1)*f(M+1);
	Fvec(2:M-2)=fold(3:M-1);
	%solve eqn Cmat*f(n-1)=f(n) as given in 18.29
	tmp=invCmat*Fvec;
	if ExerciseType=='a',
		fold(2:M)=max(tmp,payvec);
	else
		fold(2:M)=tmp;
	end;
	fold(1)=f(1);
	fold(M+1)=f(M+1);
end

svec=0:ds:smax;
option_price=interp1(svec',fold,S)