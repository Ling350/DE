NX=hs300';%5*702
%���������ź�

%NX:192�У�96��
%[a,b]=size(NX)


%ʹ��db2С�����ж���ֽ�
dec=mdwtdec('r',NX,2,'db2');
%ʹ����ֵ������sqtwolog������ֵ����������sln��С��ȥ��
[XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','sln');%����ԭʼ�ź�NX��ȥ���ź�XD��
%decDENΪNX��С���ֽ�ṹ��THRESH��ֵ����sqtwologΪȥ�뷽��������ͨ����ֵ��sln������ֵ����
%���������ݵ�һ���ϵ������������Ĺ�����������ֵ��
THRESH(:,:)

%�Ƚ�ԭʼ�źš������źź�ȥ���ź�
figure(1);
kp=0;
for i=1:5
    subplot(5,2,kp+1),plot(NX([i],:)');
    title(['ԭʼ�ź�',num2str(i)])
    subplot(5,2,kp+2),plot(XD([i],:)');
    title(['�����ź�',num2str(i)])
    kp=kp+2;
end



%ʹ����ֵ������sqtwolog������ֵ����������one��С��ȥ��
% [XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','one');%����ԭʼ�ź�NX��ȥ���ź�XD��
% %decDENΪNX��С���ֽ�ṹ��THRESH��ֵ����sqtwologΪȥ�뷽��������ͨ����ֵ��sln������ֵ����
% %���������ݵ�һ���ϵ������������Ĺ�����������ֵ��
% THRESH(:,:)
% 
% %�Ƚ�ԭʼ�źš������źź�ȥ���ź�
% figure(2);
% kp=0;
% for i=1:5
%     subplot(5,2,kp+1),plot(NX([i],:)');
%     title(['ԭʼ�ź�',num2str(i)])
%     subplot(5,2,kp+2),plot(XD([i],:)');
%     title(['�����ź�',num2str(i)])
%     kp=kp+2;
% end
H=XD'
xlswrite('C:\Users\��\Desktop\quzao.xlsx',H)






    

