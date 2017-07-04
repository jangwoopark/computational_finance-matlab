clc;
mu=[0;0];
sigma=[1 .65;.65 1];
howmany=1000;
bivariate=MultiNormrnd(mu,sigma,howmany);
expected=zeros(howmany,1);
for i=1:howmany
    expected(i,1)=bivariate(i,1)^3 + sin(bivariate(i,1));
end;
expectation=sum(expected)/howmany;