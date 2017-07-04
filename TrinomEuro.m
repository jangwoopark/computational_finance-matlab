function Trinomial=TrinomEuro(P,K,r,T,sig,n)
dt=T/n;

d=exp(-sig*sqrt(3*dt));
u=1/d;
p=(r*dt*(1-u)+(r*dt)^2+sig^2*dt)/((u-d)*(1-d));
q=(r*dt*(1-d)+(r*dt)^2+sig^2*dt)/((u-d)*(u-1));
m=1-p-q;
df=exp(-r*dt);

for i = 0:(2 * n)
    state = i + 1;
    Value(state)=max(0,(P*u^max(i-n,0)*d^max(n*2-n-i,0)-K));
end
for t = (n - 1):-1:0
    for i = 0:(t * 2)
        state = i + 1;
        Value(state)=(p*Value(state+2)+m*Value(state+1)+q*Value(state))*df;
    end
end

Trinomial = Value(1);