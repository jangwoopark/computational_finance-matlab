function ex=ppdbcir(n,N,r0,sigma,kapa,rbar,T)
dt=T/n;
rt=zeros(n,1);
x=zeros(N,1);

for i=1:N;
for j=1:n;
    r=r0;
    for k=1:j;
        r=r+kapa*(rbar-r)*dt+sigma*sqrt(r*dt)*randn;
    end;
    rt(j)=r;
end;
x(i)=-T/n*sum(rt);
end;
ex=mean(exp(x));
end