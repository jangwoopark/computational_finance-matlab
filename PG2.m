function p=PG2(t,T)
x0=0;
y0=0;
phi0=.03;
a=.1;
b=.3;

p=exp(-T*phi0-(1-exp(-a*(T-t)))/a*x0-(1-exp(-b*(T-t)))/b*y0+(1/2)*VG2(t,T));
end