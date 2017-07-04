function [] = Greeks(CallPut, AssetP, Strike, RiskFree, DividendY, Time, Volatility)
dt = Volatility * sqrt(Time);                                
df = RiskFree -DividendY + 0.5 * Volatility ^ 2;                        % Computes the drift term
d1 = (log( AssetP / Strike ) + df * Time ) / dt;             % Calculates the d1 term used in Black-Scholes
d2 = d1 - dt;                                                % Calculates the d2 term used in Black-Scholes

% The cumulative normal distribution functions for use in computing calls
nd1 = normcdf(d1);
nd2 = normcdf(d2);
% The cumulative normal distribution functions for use in computing puts
nnd1 = normcdf(-d1);
nnd2 = normcdf(-d2);
nn1 = (1 / sqrt(2 * pi) * exp(-0.5 * d1 ^ 2));

% Computes call greeks
if CallPut
    Delta = nd1 * exp(-DividendY * Time)
    Gamma =(nn1 * exp(-DividendY * Time)) / (AssetP * dt)
    Theta = -((AssetP * nn1 * exp(-DividendY * Time) * Volatility) / (2 * sqrt(Time))) + (-DividendY * AssetP * nd1 * exp(-DividendY * Time)) - (RiskFree * Strike * exp(-RiskFree * Time) * nd2)
    Vega = AssetP * sqrt(Time) * nn1 * exp(-DividendY * Time)
    Rho1 = Strike * Time * exp(-RiskFree * Time) * nd2
    Rho2 = -AssetP * exp(-DividendY * Time) * Time * nd1
end
% Computes put greeks
if ~CallPut
    Delta = (nd1 - 1) * exp(-DividendY * Time)
    Gamma =(nn1 * exp(-DividendY * Time)) / (AssetP * dt)
    Theta = -((AssetP * nn1 * Volatility * exp(-DividendY * Time)) / (2 * sqrt(Time))) - (DividendY * AssetP * nnd1 * exp(-DividendY * Time)) + (RiskFree * Strike * exp(-RiskFree * Time) * nnd2)
    Vega = AssetP * sqrt(Time) * nn1 * exp(-DividendY * Time)
    Rho1 = -Strike * Time * exp(-RiskFree * Time) * nnd2
    Rho2 = AssetP * exp(-DividendY * Time) * Time * nnd1
end