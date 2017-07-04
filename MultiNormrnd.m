function Z = MultiNormrnd(mu,sigma,howmany)
n=length(mu);
Z=zeros(howmany,n);
mu=mu(:);
L=chol(sigma);
for i=1:howmany
    Z(i,:)=mu'+randn(1,n)*L;
end