function V=mutation(X,F)
NP=length(X);%length：数组长度（即行数或列数中的较大值）
for i=1:NP
    %在[1 NP]中产生nrandI个互不相等的随机数，且与i皆不相等
    nrandI=5;
    r=randi([1,NP],1,nrandI);%1行5列，产生一个1行5列的矩阵，矩阵元素为1-NP的随机整数。在randint(n,m):产生一个n*m的矩阵，矩阵元素是0或1，随机的。randint(2,3,[1,6]):产生一个2*3的矩阵，矩阵元素为1-6的随机整数
    for j=1:nrandI
    equalr(j)=sum(r==r(j));
    end
    equali=sum(r==i);%r==i表示在r中判断与i值相等的元素，返回的结果是logical类型数据，为1时表示当前位与i相等，为0时表示不相等，sum(r==i);表示对这个logical数组进行求和，r是行或列向量，得到的将是r等于i的个数
    equalval=sum(equalr)+equali;
    while(equalval>nrandI)
        r=randi([1,NP],1,nrandI);
        for j=1:nrandI
        equalr(j)=sum(r==r(j));
        end
        equali=sum(r==i);
        equalval=sum(equalr)+equali;
    end
    V(i,:)=X(r(1),:)+F*(X(r(2),:)-X(r(3),:));
end
    
 
        
    