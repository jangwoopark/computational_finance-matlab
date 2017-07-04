function Trinomial=TrinomEuroLog(P,K,r,T,sig,n)
dt=T/n;
logP=log(P);
logK=log(K);
dXu=sig*sqrt(3*dt);
dXd=-dXu;
p=(1/2)*((sig^2*dt+(r-sig^2/2)^2*dt^2)/(sig^2*3*dt)-(r-sig^2/2)*dt/sig*sqrt(3*dt));
q=(1/2)*((sig^2*dt+(r-sig^2/2)^2*dt^2)/(sig^2*3*dt)+(r-sig^2/2)*dt/sig*sqrt(3*dt));
m=1-p-q;
df=exp(-r*dt);

for i = 0:(2 * n)
    state = i + 1;
    Value(state)=max(0,((logP+dXu*max(i-n,0)+dXd*max(n*2-n-i,0))-logK));
end
for t = (n - 1):-1:0
    for i = 0:(t * 2)
        state = i + 1;
        Value(state)=(p*Value(state+2)+m*Value(state+1)+q*Value(state))*df;
    end
end

Trinomial = Value(1);