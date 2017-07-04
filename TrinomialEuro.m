function [] = TrinomialEuro(CallPut, AssetP, Strike, RiskFree, Div, Time, Vol, nSteps)
dt = Time / nSteps;                     % Allocates the time steps
cc = RiskFree - Div;                    % Specifies the cost of carry (r - D)

if CallPut
    b = 1;
end
if ~CallPut
    b = -1;
end

RR = exp(RiskFree * dt);
Up = exp(Vol * sqrt(2 * dt));           % The magnitude of an up movement
Down = 1 / Up;                          % The magnitude of a down movement
%%% Specifies the probability of up, down and mid moves for trinomial tree
P_up = ((exp(cc * dt / 2) - exp(-Vol * sqrt(dt / 2))) / (exp(Vol * sqrt(dt / 2)) - exp(-Vol * sqrt(dt / 2)))) ^ 2;
P_down = ((exp(Vol * sqrt(dt / 2)) - exp(cc * dt / 2)) / (exp(Vol * sqrt(dt / 2)) - exp(-Vol * sqrt(dt / 2)))) ^ 2;
P_mid = 1 - P_up - P_down;
Df = exp(-RiskFree * dt);

% Sets up the asset movements on the trinomial tree
for i = 0:(2 * nSteps)
    State = i + 1;
    Value(State) = max(0, b * (AssetP * Up ^ max(i - nSteps, 0) * Down ^ max(nSteps * 2 - nSteps - i, 0) - Strike));
end

% Works backwards recursively to determine the price of the option
for tt = (nSteps - 1):-1:0
    for i = 0:(tt * 2)
        State = i + 1;
        Value(State) = (P_up * Value(State + 2) + P_mid * Value(State + 1) + P_down * Value(State)) * Df;
    end
end

Trinomial = Value(1)