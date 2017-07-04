function Price = BlsHalton(S0,X,r,T,sigma,NPoints,Base1,Base2)
nuT=(r-.5*sigma^2)*T;
siT=sigma*sqrt(T);
%Use Box Muller to generate standard normals
H1 = GetHalton(ceil(NPoints/2),Base1);
H2 = GetHalton(ceil(NPoints/2),Base2);
Vlog=sqrt(-2*log(H1));
Norm1=Vlog.*cos(2*pi*H2);
Norm2=Vlog.*sin(2*pi*H2);
Norm=[Norm1; Norm2];
%
DiscPayoff=exp(-r*T)*max(0,S0*exp(nuT+siT*Norm)-X);
Price = mean(DiscPayoff);