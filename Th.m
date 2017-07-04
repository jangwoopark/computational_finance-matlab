function Theta = Th(P, K, r, mu, T, sig)
dt = sig * sqrt(T);                                
df = r - mu + 0.5 * sig ^ 2;
d1 = (log( P / K ) + df * T ) / dt;
d2 = d1 - dt;

nd1 = normcdf(d1);
nd2 = normcdf(d2);
nn1 = (1 / sqrt(2 * pi) * exp(-0.5 * d1 ^ 2));

Theta = -((P*nn1*exp(-mu*T)*sig)/(2*sqrt(T)))+(-mu*P*nd1*exp(-mu*T))-(r*K*exp(-r*T)*nd2);
