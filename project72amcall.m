clc;
clear all;

%call
%------ Enter parameters
S=10; %spot price
K=10; %strike
r=0.04; %risk free rate
v=0.2; %volatility
T=6/12; %Time to maturity
M=40; %no. of steps in stock price
N=250; %no of time steps
ExerciseType='a'; %set 'a' for American / 'e' for European 
%----------------


dt=T/N; %time step size
smax=S*2;
ds=smax/M; %stock price step size

f=zeros(M+1,1); %vector to store option price grid

for j=0:M,
	f(j+1)=max(j*ds-K,0);
end

payoffvec=f;
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
	payvec(j)=j*ds-K;
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

test=zeros(M-1,2);

%Start rollback of time steps
for i=1:N,
	%Load RHS vector 
	Fvec=zeros(M-1,1);
	Fvec(1)=fold(2)-a(1)*f(1);
	Fvec(M-1)=fold(M)-c(M-1)*f(M+1);
	Fvec(2:M-2)=fold(3:M-1);
	%solve eqn Cmat*f(n-1)=f(n) as given in 18.29
	tmp=invCmat*Fvec;
	test(:,1)=tmp;
	if ExerciseType=='a',
		fold(2:M)=max(tmp,payvec);
	else
		fold(2:M)=tmp;
	end;
	fold(1)=f(1);
	fold(M+1)=f(M+1);
end

svec=0:ds:smax;
option_price_full_implicit=interp1(svec',fold,S)

%**************  Crank Nicholson scheme ****************


Amat=(Cmat-eye(M-1))/dt;

lhsmat=(eye(M-1)+0.5*dt*Amat);
lhsmatinv=inv(lhsmat);
rhsmat=eye(M-1)-0.5*dt*Amat;

fold=payoffvec;
%Start rollback of time steps
for i=1:N,
	%Load RHS vector 
	Fvec=zeros(M-1,1);
	Fvec(1)=fold(2)-a(1)*f(1);
	Fvec(M-1)=fold(M)-c(M-1)*f(M+1);
	Fvec(2:M-2)=fold(3:M-1);
	%solve eqn Cmat*f(n-1)=f(n) as given in 18.29
	%tmp=invCmat*Fvec;
	tmp=lhsmatinv*rhsmat*Fvec;
	test(:,2)=tmp;
	if ExerciseType=='a',
		fold(2:M)=max(tmp,payvec);
	else
		fold(2:M)=tmp;
	end;
	fold(1)=f(1);
	fold(M+1)=f(M+1);
end
test;
svec=0:ds:smax;
option_price_crank_nicholson=interp1(svec',fold,S)


%****** explicit scheme ******************

Amat=(Cmat-eye(M-1))/dt;
rhsmat=eye(M-1)-dt*Amat;

fold=payoffvec;
%Start rollback of time steps
for i=1:N,
	%Load RHS vector 
	Fvec=zeros(M-1,1);
	Fvec(1)=fold(2)-a(1)*f(1);
	Fvec(M-1)=fold(M)-c(M-1)*f(M+1);
	Fvec(2:M-2)=fold(3:M-1);
	%solve eqn Cmat*f(n-1)=f(n) as given in 18.29
	%tmp=invCmat*Fvec;
	tmp=rhsmat*Fvec;
	test(:,2)=tmp;
	if ExerciseType=='a',
		fold(2:M)=max(tmp,payvec);
	else
		fold(2:M)=tmp;
	end;
	fold(1)=f(1);
	fold(M+1)=f(M+1);
end
test;
svec=0:ds:smax;
option_price_explicit_scheme=interp1(svec',fold,S)


%************************************** explicit scheme with new timesteps 
% corrected for stability condition


dt=1/(v*M)^2;
N=ceil(T/dt)+1;
sprintf('using corrected time steps : %d',N);

dt=T/N; %time step size
smax=S*2;
ds=smax/M; %stock price step size

f=zeros(M+1,1); %vector to store option price grid

for j=0:M,
	f(j+1)=max(j*ds-K,0);
end

payoffvec=f;
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
	payvec(j)=j*ds-K;
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

Amat=(Cmat-eye(M-1))/dt;
rhsmat=eye(M-1)-dt*Amat;

fold=payoffvec;
%Start rollback of time steps
for i=1:N,
	%Load RHS vector 
	Fvec=zeros(M-1,1);
	Fvec(1)=fold(2)-a(1)*f(1);
	Fvec(M-1)=fold(M)-c(M-1)*f(M+1);
	Fvec(2:M-2)=fold(3:M-1);
	%solve eqn Cmat*f(n-1)=f(n) as given in 18.29
	%tmp=invCmat*Fvec;
	tmp=rhsmat*Fvec;
	test(:,2)=tmp;
	if ExerciseType=='a',
		fold(2:M)=max(tmp,payvec);
	else
		fold(2:M)=tmp;
	end;
	fold(1)=f(1);
	fold(M+1)=f(M+1);
end
test;
svec=0:ds:smax;
option_price_explicit_scheme_corrected=interp1(svec',fold,S)

bsp=BinomialAmerican(1,S,K,r,0,T,v,N);

