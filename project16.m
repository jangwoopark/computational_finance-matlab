clc;
bin=-4:.0005:4;
n=zeros(16001,1);
for i=1:16001
    n(i,1)=(1/(2*pi))*exp(-bin(i)^2/2);
end;

plot(bin,n);

% except for the errors, there are not many differences


