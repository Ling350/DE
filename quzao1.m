load thinker;
%���������ź�
[m,n]=size(X);%192��96�еľ���
init=2055615866;
for i=1:m
    randn('seed',init);
    NX(i,:)=X(i,:)+18*randn(size(X(i,:)));
end
%NX:192�У�96��
%[a,b]=size(NX)


%ʹ��db2С�����ж���ֽ�
dec=mdwtdec('r',NX,2,'db2');
%ʹ����ֵ������sqtwolog������ֵ����������sln��С��ȥ��
[XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','sln');%����ԭʼ�ź�NX��ȥ���ź�XD��
%decDENΪNX��С���ֽ�ṹ��THRESH��ֵ����sqtwologΪȥ�뷽��������ͨ����ֵ��sln������ֵ����
%���������ݵ�һ���ϵ������������Ĺ�����������ֵ��
THRESH([2 31],:)

%�Ƚ�ԭʼ�źš������źź�ȥ���ź�
figure(1);
subplot(221);
plot(X([2 31],:)');
title('ԭʼ�ź�2��31');
subplot(222);
plot(NX([2 31],:)');
title('�����ź�2��31');
subplot(223);
plot(XD([2 31],:)');
title('ȥ���ź�2��31');


%ʹ����ֵ������sqtwolog������ֵ����������one��С��ȥ��
[XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','one');%����ԭʼ�ź�NX��ȥ���ź�XD��
%decDENΪNX��С���ֽ�ṹ��THRESH��ֵ����sqtwologΪȥ�뷽��������ͨ����ֵ��sln������ֵ����
%���������ݵ�һ���ϵ������������Ĺ�����������ֵ��
THRESH([2 31],:)

%�Ƚ�ԭʼ�źš������źź�ȥ���ź�
figure(2);
subplot(221);
plot(X([2 31],:)');
title('ԭʼ�ź�2��31');
subplot(222);
plot(NX([2 31],:)');
title('�����ź�2��31');
subplot(223);
plot(XD([2 31],:)');
title('ȥ���ź�2��31');






    

