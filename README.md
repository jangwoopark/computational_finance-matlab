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

     / -1 with probability 0.3
X = |   0 with probability 0.5
     \  1 with probability 0.2

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
