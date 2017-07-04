function [X] = BlackScholesEuro(CallPut, AssetP, Strike, RiskFree, Time, Volatility)

dt = Volatility * sqrt(Time);                                
df = RiskFree + 0.5 * Volatility ^ 2;            % Computes the drift term
d1 = (log( AssetP / Strike ) + df * Time ) / dt;             % Calculates the d1 term used in Black-Scholes
d2 = d1 - dt;                                                % Calculates the d2 term used in Black-Scholes

% The cumulative normal distribution functions for use in computing calls
nd1 = normcdf(d1);
nd2 = normcdf(d2);
% The cumulative normal distribution functions for use in computing puts
nnd1 = normcdf(-d1);
nnd2 = normcdf(-d2);

if CallPut
    % Computes call price
    CallPrice = AssetP * nd1 - Strike * exp(-RiskFree * Time) * nd2;
    X = CallPrice;
end

if ~CallPut
    % Computes put price
    PutPrice = Strike * exp(-RiskFree * Time) * nnd2 - AssetP * nnd1;
    X = PutPrice;
end