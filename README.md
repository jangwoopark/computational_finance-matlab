# computational_finance-matlab
## Projects are numbered in their 10s i.e. 11, 23, 34, etc
- 10 Random Number Generation, Discrete  and Continuous Random Variable Simulation 
- 20 Monte Carlo Simulation, Option pricing – the first steps Variance Reduction techniques.  
- 30 Simulation of Stochastic Processes, discretization schemes (Euler, Milstein, etc.), Pricing Securities by Simulation – the first steps. Low-Discrepancy sequences, Applications. 
- 40 Binomial, Trinomial methods of pricing European  and American options. Estimation of Greeks. 
- 50 Pricing American Options by Simulation,  Least Square Monte Carlo method. 
- 60 Exotic option valuation: Asian, Barrier Options, Variance Swap Valuation. 
- 70 Numerical Partial Differential Equations-Methods, finite difference schemes – Implicit, Explicit, Crank-Nicolson Methods. 
- 80 Interest rate models – Single or Multiple Factors (Vasicek, CIR, Longstaff-Schwartz, G2++, Hull-White), Pricing Options on Discount Bonds, Pricing Options on Coupon-Paying Bonds. 
- 90 Simulation method of valuation and hedging of Mortgage Backed Securities. Prepayment Models, Option-Adjusted Spread – Duration and Convexity. (to be done)
### Projects

1.1
- Generate 10,000 Uniformly distributed random numbers on [0,1].
- Plot the histogram of them using LGM method.
- Now use built-in functions of Matlab to do the same thing.
- Compare the histograms of the above random number sequences.

1.2
- Generate 10,000 random numbers with the following distribution:
- X =   -1 with probability 0.3 OR
- X =    0 with probability 0.5 OR
- X =    1 with probability 0.2
- Draw the histogram and the empirical distribution function by using the 10,000 numbers generated.

1.3
- Generate 1,000 random numbers with Binomial distribution with n=44 and p=0.64.
- A random variable with Binomial distribution (n, p) is a sum of n Bernoulli (p) distributed random variables, so 
- will need to generate 44,000 Uniformly distributed random numbers, to start with.
- Draw the histogram. Compute the probability that X, with Binomial (44, 0.64) distribution, is at least 40.
- Use any statistics textbook for the exact number for the above probability and compare them.   

1.4
- Generate 10,000 Exponentially distributed random numbers with parameter gamma=1.5.
- Draw the histogram by using the 10,000 numbers.

1.5
- Generate 5,000 Uniformly distributed random numbers on [0,1].
- Generate 5,000 Normally distributed random numbers with mean 0 and variance 1, by Box-Muller Method.
- Draw the histogram by using the 5,000 numbers.
- Now use the Polar-Marsaglia method.
- Draw the histogram by using the numbers you got.

1.6
- Use the density formula for the standard normal distribution to construct the density curve. 
- Plot it from –4 to 4 by 0.0005 step size.
- Compare it to the ones obtained above.

1.7
- Use the built-in function (of the software you are using : Matlab, C/C++, VBA, etc.) to generate 5,000 Normally distributed random numbers with mean 0 and variance 1.

1.8
- Compare the histogram of these to the other three cases. 
- You may compute the means of your sequence of numbers and compare them to 0. 
- Ideally they must be equal to 0.

1.9
- Generate 10,000 of each of the following distributions using Excel.
- Draw their histograms: Uniform[0,1], Bernoulli (0.65), Normal(0,1), Exponential(2).

2.1
- Generate a series  =1,…,n  Bivariate-Normally distributed random vectors, with mean of (0,0) and the variance – covariance matrix of 
- | 1 0.7 |
- | 0.7 1 |

2.2
- Evaluate the following expected values by using Monte Carlo simulation E(x^3 + SIN(y)) where X and Y have N(0,1) distribution and a covariance of 0.65.

2.3
- Estimate the expected values: E(W5^2 + sin(W5), E(e^(t/2) cos(Wt)) for t = .5, 4, 8 Where Wt is a Weiner Process.
- The values of the last three integrals (t = .5, 4, 8) related.
- Now use a variance reduction technique (whichever you want) to compute the expected value.

2.4
- Let St be a Geometric Brownian Motion Process: ST = S0 e^(sigWT+(r-(sig^2)/2)T) where r = .04, sig = .2, S0 = 88, Wt is a Standard Bronian Motion process (Wiener process).
- Estimate the price c of a European Call option on the stock with T = 10, X = 100 by using Monte Carlo simulation.

2.5
- Simulate 4 paths of St for 0<=t<=10 by dividing up the interval [0, 10] into 1,000 equal parts.  Then, for each integer number n from 1 to 10, compute ESn. Plot all of this in one graph.

2.6
- Consider a way of computing the number pi: integral(0,1) sqrt(1-x^2)dx = pi/4.
- This can be done by simple numerical integration using, say Euler’s (or any other) scheme. Compute it and show your work. Can also compute by Monte Carlo simulation.
- Now try the Importance sampling method to improve the estimate of pi.

3.1
- Evaluate the following expected values and probabilities:  E(X2^(1/3)), E(Y3), E(X2Y2 1(X2>1)), P(Y2>5)   where the Ito’s processes X and Y evolve according to the following SDE: dXt = (1/5 - 1/2Xt) dt + 2/3 dWt, X0 = 1, dYt = ((2/(1+t) Yt + (1+t^3)/3) dt + (1+t^3)/3 dZt, Y0 = 3/4 and  are independent Wiener processes.

3.2
-  Estimate the following expected values and compare: E(1+X3)^(1/3), and E(1+Y3)^(1/3) where dXt = 1/4Xtdt + 1/3XtdWt - 3/4XtdZt, X0 = 1, Yt = e^(-.08t + 1/3 Wt + -3/4Zt) and  are independent Wiener processes. 

3.3
- Compute the price of a European Call option via Monte Carlo simulation. Use variance reduction techniques (e.g. Antithetic variates). The code should be generic: for any input of the 5 parameters S0, T, X, r, sig, the output is the corresponding price of the call option.
- Compute the price of a European Call option by using the Black-Scholes formula. (use the approximation of N(.)). The code should be generic: for any input values of the 5 parameters S0, T, X, r, sig,  it should compute and return the value of the option price.
- Compute the hedging parameters of a Call option (all 5 of the Greeks) and graph them as a function of stock price: S0,  where S0=20, X=20, sig=0.25, r=0.04 and T=0.5 years. Use the range [15:25] for S0 with a step size 1. 

3.4
-  Compute the probability (by simulation) that a European put option will expire in the money. Use these parameters: S0=20, X=20, sig=0.25, r=0.04 and T=0.5 years. 

3.5
- Compare the pseudorandom sample with the quasi MC sample of Uniform[0,1]x[0,1]:
- Generate 100 vectors of Uniform [0,1]x[0,1] by using MATLAB (or the software you are using) random number generator.
- Generate 100 points of the 2-dimentional Halton sequences, using bases 2  and 7.
- Generate 100 points of the 2-dimentional Halton sequences, using bases 2  and 4. (4 is non-prime!).
- Draw all on separate graphs and see if there are differences in the three (visual test only).
- Use 2-dimensional Halton sequences and compute the following integral:    (use N=10,000. Try different couples of bases: (2,4), (2,7), (5,7). ) int(0,1) int(0,1) e^(-xy) * (sin6pi + cos^(1/3)2pi * y) dxdy

4.1
- Use the Binomial Method to price a 6-month European Call option for this situation:  the risk-free interest rate is 5% per annum and the volatility is 24%/annum, the current stock price is $32 and the strike price is $30. Divide the time interval into  parts to estimate the price of this option. Use n = 10, 15, 20, 40, 70, 80, 100, 200 and 500 to compute the approximate price and draw them in one graph, where the horizontal axis measures , and the vertical one– the price of the option. Compare the convergence rates of the four methods below: 
- Use the binomial method in which u = 1/d, d = c - sqrt(c^2 - 1), c = 1/2(e^-rdelta + e^(r+sig^2)delta), p = (e^rdelta - d)/(u-d)
- Use the binomial method in which u = e^rdelta(1 + sqrt(e^sig^2*delta - 1)), d = e^rdelta(1 - sqrt(e^sig^2*delta - 1)), p = 1/2
- Use the binomial method in which u = e^(r-(sig^2/2)delta+sigsqrt(delta), d = e^(r-sig^2/2)delta - sig*sqrt(delta), p = 1/2
- Use the binomial method in which u = e^sig*sqrt(delta), d = e^(-sigsqrt(delta)), p = 1/2+1/2((r-sig^2/2)sqrt(delta)/sig)

4.2
- Take the current price of GOOG. Use interest rate =2% , and strike price that is the closest integer (divisible by 10) to 120% of the current price.  Estimate the price of the call option that expires on January of next year, using the binomial approach. GOOG does not pay dividends. To estimate the volatility, use 60 month of historical stock price data (or whatever available) on the company and the method discussed in class. You may use finance.yahoo.com to obtain historical prices, current price of GOOG.  

4.3
- Consider the following information on the stock and options on it of a company: S0 = $49, K = $50, r = .03, sig = .2, T = .3846 (20 weeks), mu = .14.

4.4
- Estimate the following and draw the graphs:
- Delta of the call option as a function of S0, for S0 ranging from $10 to $80, in increments of $2.
- Delta of the call option, as a function of T (time to expiration), from 0 to 0.3846.
- Theta of the call option, as a function of S0, for S0 ranging from $10  to $80.
- Gamma of the call option, as a function of S0, for S0 ranging from $10  to $80.
- Vega of the call option, as a function of S0, for S0 ranging from $10  to $80.
- Rho of the call option, as a function of S0, for S0 ranging from $10  to $80.

4.5
-  Consider 12-month put options on a stock of company XYZ. Assume the risk-free rate is 5%/annum and the volatility of the stock price is 30 % /annum and the strike price of the option is $100. Use binomial method to estimate the prices of European and American Put options with current stock prices varying from $80 to $120in increments of $5. Draw them all in one graph and compare.

4.6
-  Use the Trinomial Method to price a 6-month European Call option in this situation:  the risk-free interest rate is 5% per annum and the volatility is 24%/annum, the current stock price is $32 and the strike price is $30. Divide the time interval into n parts to estimate the price of this option. Use  n = 10, 15, 20, 40, 70, 80, 100, 200 and 500 to compute the approximate price and draw them in one graph, where the horizontal axis measures n, and the vertical one– the price of the option. Compare the convergence rates of the four methods below: 
-  Use the trinomial method applied to the stock price-process (St) in which u = 1/d, d = e^(-sig*sqrt(3delta)), Pd = (rdelta(1-u)+(rdelta)^2 + sig^2 delta)/(u-d)(1-d), Pu = (rdela(1-d)+(rdelta)^2 + sig^2 delta)/(u-d)(u-1), Pm = 1-Pu-Pd
- Use the trinomial method applied to the Log-stock price-process (Xt) in which in which deltaXu = sig*sqrt(3delta), delta Xd = -sig*sqrt(3delta), Pd = 1/2((sig^2 delta+(r-sig^2/2)^2 delta^2)/deltaXd^2 - (r-sig^2/2)delta/deltaXd), Pu = 1/2((sig^2 delta+(r-sig^2/2)^2)delta^2)/deltaXu^2 + (r-sig^2/2)delta/deltaXu), Pm = 1 - Pu - Pd.

4.7
-  Use Halton’s Low-discrepancy sequences to price European call options. The code should be generic: it will ask for user inputs for S0, K, T, r, sig, N (number of points) and  (base 1)  and  (base 2). Box-Muller method should be used to generate Normals such as: Z1 = sqrt(-2Ln(U1))cos(2piU2), Z2 = sqrt(-2Ln(U1))sin(2piU2) where  and are the Halton numbers with base b1 and base b2 accordingly. For the price of the call option you may use the following formula: c =b e^-(rT)E*(ST-K)^+ = e^-(rT)E*(S0e^((r-sig^2/2)T+sigWT)-K)^+ = E*f(WT)

5.1
- Consider the following situation on the stock of company XYZ: The current stock price is $40, and the volatility of the stock price is sig = 20% per annum. Assume the prevailing risk-free rate is r = 6% per annum. Use the following method to price the specified option: 
-  Use the LSMC method with 100,000 paths simulations (50,000 plus 50,000 antithetic) to price an American put option with strike price of K=$40, maturity of 0.5-years, 1-year, 2-years, and current stock prices of $36, $40, $44. Use Laguerre polynomials for k=2, 3, 4. 
- Use the LSMC method with 100,000 paths simulations (50,000 plus 50,000 antithetic) to price an American put option with strike price of K=$40, maturity of 0.5-years, 1-year, 2-years, and current stock prices of $36, $40, $44. Use Hermite polynomials for k=2, 3, 4. 
-  Use the LSMC method with 100,000 paths simulations (50,000 plus 50,000 antithetic) to price an American put option with strike price of K=$40, maturity of 0.5-years, 1-year, 2-years, and current stock prices of $36, $40, $44. Use simple monomials for k=2, 3, 4.
- Compare all your findings above.

5.2
- Compute the prices of European options on the same stock with same specifications of the previous problem. Compare with the exact (Black-Scholes) formula.

5.3
- Forward-start options are path dependent options that have strike prices to be determined at a future date. For example, a forward-start put option payoff at maturity is max(St - ST,0) where the strike price of the put option is St-the price of the stock at the start-time of the option. Here 0 <= t <= T.
- Estimate the value of the forward-start European put option on a stock with these characteristics: S0 = $65,K = $60, sig = 20% per annum, risk-free rate is r = 6% per annum, t = 0.2 and T = 1. 
- Estimate the value of the forward-start American put option on a stock with these characteristics: S0 = $65, K = $60, sig = 20% per annum, risk-free rate is r = 6% per annum, t = 0.2 and T = 1. The continuous exercise starts at time t = 0.2.  

7.1
-  Consider the following situation on the stock of company XYZ: The current stock price is $10, and the volatility of the stock price is sig = 20% per annum. Assume the prevailing risk-free rate is r = 4% per annum. Use the X = Ln(S) transformation of the Black-Scholes PDE, and deltat = .002, deltaX = sig*sqrt(deltat), or deltaX = sig*sqrt(3deltat), or deltaX = sig*sqrt(4deltat) , a uniform grid to price the following options using the specified methods below: 
- Use the Explicit Finite-difference method, the Implicit Finite-Difference Method, and Crank-Nicolson Finite-Difference Method to price an European Put option with strike price of K = $10, maturity of 0.5-years, and current stock prices for a range from $1 to $20, in increments of about $1.

7.2
- Consider the following situation on the stock of company XYZ: The current stock price is $10, and the volatility of the stock price is sig = 20% per annum. Assume the prevailing risk-free rate is  per annum. Use the Black-Scholes PDE and the Explicit Finite-difference method, the Implicit Finite-Difference Method, and Crank-Nicolson Finite-Difference Method to price an American Call and American Put options with strike prices of K = $10, maturity of 0.5-years, and current stock prices for a range from $1 to $20, in increments of about $1.  Choose deltat = .002, and deltaS = .5, delatS = 1, deltaS = 1.5.

8.1
-  Assume the dynamics of the short-term interest rate, under the risk-neutral measure, are given by the following SDE (Vasicek model) : drt = k(rbar - rt) dt + sig dWt with r0 = 3%, sig = 15%, k = .2, rbar = 5%.
-  Use Monte Carlo Simulation (assume each time step is a day) to find the price of a pure discount bond, with Face Value of $1,000, maturing in T=0.5 years (at time t=0):  P(t, T) = EE(* t) [exp(-int(from t to T)r(s)ds)] 
- 
