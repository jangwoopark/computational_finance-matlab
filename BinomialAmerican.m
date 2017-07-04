function Binomial = BinomialAmerican(CallPut, AssetP, Strike, RiskFree, Div, Time, Vol, nSteps)
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

% Sets up the asset movements on the binomial tree
for i = 0:nSteps
    State = i + 1;
    St = AssetP * Up ^ i * Down ^ (nSteps - i);
    Value(State) = max(0, b * (St - Strike));
end

% Works backwards recursively to determine the price of the option    
for TT = (nSteps - 1):-1:0
    for i = 0:TT
        State = i + 1;
        Value(State) = max((b * (AssetP * Up ^ i * Down ^ (abs(i - TT)) - Strike)), (P_up * Value(State + 1) + P_down * Value(State)) * Df);
    end
end

Binomial = Value(1)