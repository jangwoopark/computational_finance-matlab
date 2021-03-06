function price=monomial(T,S0,k)
clc;
close all;
n       = 5000;                     % numbers of paths to simulate
N       = 6;                        % number of exercise points
%T       = 1;                        % time to maturity
dt      = T/N;
%S0      = 40;                      % initial stock price
K       = 40;                      % xrsice price
r       = 0.06;                     % interest rate
sig     = 0.2;                      % stock price vola
dW      = sqrt(dt)*randn(N-1,n);    % standard Brownian increments
disc    = exp(-r*dt);               % discout factor

% simulate asset processes
S = S0*exp(cumsum((r - 1/2*sig^2)*dt + sig*dW));
S = [ones(1,n)*S0; S ]';


P = zeros(n,N);                     % initialize payoff matrix
P(:,N) = max(0,K-S(:,N));           % American put option


for nn = N-1:-1:2
    y = max(0,K-S(:,nn));          % payoff of put option
    yex = [];
    X   = [];
    Y   = [];
    for i = 1:n
        if y(i) > 0                     % if in-the-money, then...
            yex = [yex; y(i)];          % exercise values
            X   = [X; S(i,nn)];          % stock prices at exercise values
            Y   = [Y;(disc.^[1:N-nn])*P(i,nn+1:N)']; % discount the cash flows to time step nn
        end
    end
    % basis functions 1, X, X^2
    if (k==2)
        A = [ones(size(yex)) X];
    elseif (k==3)
       A = [ones(size(yex)) X  X.*X   ] ;
    elseif (k==4)
       A = [ones(size(yex)) X  X.*X  X.*X.*X ] ;
    end;
    % Least-Square Regression:
    [U,W,V] = svd(A);
    b = V*(W\(U'*Y));
    % continuation value
    yco = A*b;
    % stopping rule
    j = 1;
    for i = 1:n
        if y(i)>0
            if (yex(j) > yco(j))
                P(i,:) = 0;
                P(i,nn) = yex(j);
            end
            j = j+1;
        end
    end
end
price = sum(P*disc.^[0:N-1]')/n;      % final price of the American contract
