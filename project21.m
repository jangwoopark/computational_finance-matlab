clc;
mu=[0;0];
sigma=[1 .7;.7 1];
howmany=1000;
bivariate=MultiNormrnd(mu,sigma,howmany);
meanx=sum(bivariate(:,1))/howmany;
meany=sum(bivariate(:,2))/howmany;
matlabro=corrcoef(bivariate(:,1),bivariate(:,2));
ro1=zeros(howmany,1);
ro2=zeros(howmany,1);
ro3=zeros(howmany,1);
    for i=1:howmany
        ro1(i,1)=(bivariate(i,1)-meanx)*(bivariate(i,2)-meany);
        ro2(i,1)=(bivariate(i,1)-meanx)^2;
        ro3(i,1)=(bivariate(i,2)-meany)^2;
    end;
    ro=(sum(ro1)/howmany)/(sqrt(sum(ro2)/howmany)*sqrt(sum(ro3)/howmany));