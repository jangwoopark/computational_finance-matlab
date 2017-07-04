function a=A(t,T)
rbar=.05;
sigma=.15;
kapa=.2;
a=exp((rbar-sigma^2/(2*kapa^2))*(B(t,T)-(T-t))-sigma^2/(4*kapa)*B(t,T)^2);
end