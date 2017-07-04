function Gamma = G(P, K, r, mu, T, sig)
dt = sig * sqrt(T);                                
df = r - mu + 0.5 * sig ^ 2;
d1 = (log( P / K ) + df * T ) / dt;
d2 = d1 - dt;

nd1 = normcdf(d1);
nd2 = normcdf(d2);
nnd1 = normcdf(-d1);
nnd2 = normcdf(-d2);
nn1 = (1 / sqrt(2 * pi) * exp(-0.5 * d1 ^ 2));

Gamma =(nn1 * exp(-mu * T)) / (P * dt);
