function V=mutation(X,F)
NP=length(X);%length�����鳤�ȣ��������������еĽϴ�ֵ��
for i=1:NP
    %��[1 NP]�в���nrandI��������ȵ������������i�Բ����
    nrandI=5;
    r=randi([1,NP],1,nrandI);%1��5�У�����һ��1��5�еľ��󣬾���Ԫ��Ϊ1-NP�������������randint(n,m):����һ��n*m�ľ��󣬾���Ԫ����0��1������ġ�randint(2,3,[1,6]):����һ��2*3�ľ��󣬾���Ԫ��Ϊ1-6���������
    for j=1:nrandI
    equalr(j)=sum(r==r(j));
    end
    equali=sum(r==i);%r==i��ʾ��r���ж���iֵ��ȵ�Ԫ�أ����صĽ����logical�������ݣ�Ϊ1ʱ��ʾ��ǰλ��i��ȣ�Ϊ0ʱ��ʾ����ȣ�sum(r==i);��ʾ�����logical���������ͣ�r���л����������õ��Ľ���r����i�ĸ���
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
    
 
        
    