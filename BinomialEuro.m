function Binomial = BinomialEuro(CallPut, AssetP, Strike, RiskFree, Div, Time, Vol, nSteps)
dt = Time / nSteps;

if CallPut
    b = 1;
end
if ~CallPut
    b = -1;
end

RR = exp(RiskFree * dt);
Up = exp(Vol * sqrt(dt));
Down = 1 / Up;
P_up = (exp((RiskFree - Div) * dt) - Down) / (Up - Down);
P_down = 1 - P_up;
Df = exp(-RiskFree * dt);

for i = 0:nSteps
    state = i + 1;
    St = AssetP * Up ^ i * Down ^ (nSteps - i);
    Value(state) = max(0, b * (St - Strike));
end

for tt = nSteps - 1 : -1 : 0
    for i = 0:tt
        state = i + 1;
        Value(state) = (P_up * Value(state + 1) + P_down * Value(state)) * Df;
    end
end

Binomial = Value(1)