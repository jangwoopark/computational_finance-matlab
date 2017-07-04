function a=Atilda(t,T)

sigma=.12;
kapa=.2;
rbar=.05;

h1=sqrt(kapa^2+2*sigma^2);
h2=(kapa+h1)/2;
h3=2*kapa*rbar/sigma^2;
a=(h1*exp(h2*(T-t))/(h2*(exp(h1*(T-t))-1)+h1))^h3;
end