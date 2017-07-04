function Binomial= putBinomEurob(P,K,r,T,sig,n)
dt=T/n;

u=exp(r*dt)*(1+sqrt(exp(sig^2*dt)-1));
d=exp(r*dt)*(1-sqrt(exp(sig^2*dt)-1));
p=.5;
q=1-p;
df=exp(-r*dt);
for i = 0:n
    state = i + 1;
    St = P * u^i * d^(n - i);
    Value(state) = max(0, (K - St));
end
for t = n - 1 : -1 : 0
    for i = 0:t
        state = i + 1;
        Value(state) = (p * Value(state + 1) + q * Value(state)) * df;
    end
end

Binomial = Value(1);