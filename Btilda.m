function b=Btilda(t,T)
sigma=.12;
kapa=.2;

h1=sqrt(kapa^2+2*sigma^2);
h2=(kapa+h1)/2;

b=(exp(h1*(T-t))-1)/(h2*(exp(h1*(T-t))-1)+h1);
end