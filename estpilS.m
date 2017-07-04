function z=estpilS(m,L)
s=(0:(1/L):(1-1/L))+1/(2*L);
hvals=sqrt(1-s.^2);
cs=cumsum(hvals);
est=zeros(m,1);
for j=1:m
    loc=sum(rand*cs(L)<cs);
    x=(loc-1)/L+rand/L;
    p=hvals(loc)/cs(L);
    est(j)=sqrt(1-x.^2)/(p*L);
end
z=sum(est)/m;