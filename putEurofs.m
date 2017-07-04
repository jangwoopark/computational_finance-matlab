function X=putEurofs(CallPut,alpha,b,sig,T,t,r,P)

d1=(log(1/alpha)+(b+sig^2/2)*(T-t))/(sig*sqrt(T-t));
d2=d1-sig*sqrt(T-t);

nd1 = normcdf(d1);
nd2 = normcdf(d2);
mnd1 = normcdf(-d1);
mnd2 = normcdf(-d2);

if CallPut
    % Computes call price
    CallPrice = P*exp((b-r)*t)*(exp((b-r)*(T-t))*nd1-alpha*exp(-r*(T-t))*nd2);
    X = CallPrice;
end

if ~CallPut
    % Computes put price
    PutPrice = P*exp((b-r)*t)*(alpha*exp(-r*(T-t))*mnd2-exp((b-r)*(T-t))*mnd1);
    X = PutPrice;
end