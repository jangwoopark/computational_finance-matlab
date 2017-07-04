1;

clear all;

%Calculates bond option price using analytical formula
%in G2 model 
% r(t)=x1(t) + x2(t) + b(t)
% where
% dx1 = -k1*x1*dt + sigma1*dZ1
% dx2 = -k2*x2*dt + sigma2*(rho*dZ1 + (1-rho^2)^0.5*dZ2)

%%%%%%%%%%% Enter parameters %%%%%%%%%%%

%G2 model parameters
k1 = 0.1;
sigma1 = 0.1;
k2 = 0.1;
sigma2 = 0.1;
rho = 0.75;
    
%Bond specifications
bMaturity=4; %maturity of underlying bond

%Bond Option
oMaturity=1; %maturity of bond Option
oStrike=0.96; %strike of bond option
CallPutFlag='C'; %Enter C or P for call/Put

%Enter term structure function for instantaneous forward rate
%Assume continuous compounding
function ret=fRate(t,T)
	ret=0.05;
endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%discount bond 
function ret=P(t,T)
	ret=exp(-quad('fRate',t,T));
endfunction

%Create parameter values for Black Formula

tmp = 1 - exp(-(k1+k2)*oMaturity);
tmp1 = 1 - exp(-k1*(bMaturity-oMaturity));
tmp2 = 1 - exp(-k2*(bMaturity-oMaturity));

%use formula for black vol
v =  0.5*sigma1^2*tmp1^2*(1 - exp(-2*k1*oMaturity))/(k1^3) + ...
       0.5*sigma2^2*tmp2^2*(1 - exp(-2*k2*oMaturity))/(k2^3) + ...
       2*rho*sigma1*sigma2/(k1*k2*(k1+k2))*tmp1*tmp2*tmp;
v=v^0.5; %Black  volatility
f=P(0,bMaturity); %forward in Balck formula
k=P(0,oMaturity)*oStrike; %strike for Black formula

d1 = log(f/k)/v + 0.5*v;
d2 = d1 - v;

if CallPutFlag=='C',
	oTypeFlag=1;
else
	oTypeFlag=-1;
endif; 

option_price = oTypeFlag*(f*normal_cdf(oTypeFlag*d1) - k*normal_cdf(oTypeFlag*d2))
 
%Calculates bond option price for two-factor vasicek model (G2++) based on analytical formula
%For the G2++ model, the interest rate rt is given by
%rt = x1,t +x2,t +b(t)
%where the dynamics of the risk factors are governed by
%dx1 = −κ1*x1*dt +σ1 *dZ1
%dx2 = −κ2*x2*dt +σ2*(ρ*dZ1 + sqrt(1 − ρ^2)* dZ2)
%Here, b(t) is a function which is determined by fitting the current interest rate term structure and ρ is the correlation coefficient between the 2 factors.
