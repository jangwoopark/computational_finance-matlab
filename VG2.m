function v=VG2(t,T)
rho=.7;
a=.1;
b=.3;
sigma=.03;
eta=.08;

v=sigma^2/a^2*(T-t+2/a*exp(-a*(T-t))-1/(2*a)*exp(-2*a*(T-t)-3/(2*a)))+eta^2/b^2*(T-t+2/b*exp(-b*(T-t))-1/(2*b)*exp(-2*b*(T-t)-3/(2*b)))+2*rho*sigma*eta/(a*b)*(T-t+(exp(-a*(T-t)-1)/a+(exp(-b*(T-t))-1)/b-(exp(-(a+b)*(T-t)-1))/(a+b)));
end