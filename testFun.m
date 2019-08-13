function y=testFun(x)
sum=0;
can=randi([0,1],1,1);
for i=1:length(x)
    sum=sum+i*x(i)^4;
end
y=sum+can;
    