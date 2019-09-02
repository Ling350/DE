NX=hs300';%5*702
%产生含噪信号

%NX:192行，96列
%[a,b]=size(NX)


%使用db2小波进行二层分解
dec=mdwtdec('r',NX,2,'db2');
%使用阈值方法‘sqtwolog’和阈值调整方法‘sln’小波去噪
[XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','sln');%返回原始信号NX的去噪信号XD，
%decDEN为NX的小波分解结构，THRESH阈值矩阵，sqtwolog为去噪方法，代表通用阈值。sln代表阈值调整
%方法，根据第一层的系数进行噪声层的估计来调整阈值。
THRESH(:,:)

%比较原始信号、含噪信号和去噪信号
figure(1);
kp=0;
for i=1:5
    subplot(5,2,kp+1),plot(NX([i],:)');
    title(['原始信号',num2str(i)])
    subplot(5,2,kp+2),plot(XD([i],:)');
    title(['含噪信号',num2str(i)])
    kp=kp+2;
end



%使用阈值方法‘sqtwolog’和阈值调整方法‘one’小波去噪
% [XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','one');%返回原始信号NX的去噪信号XD，
% %decDEN为NX的小波分解结构，THRESH阈值矩阵，sqtwolog为去噪方法，代表通用阈值。sln代表阈值调整
% %方法，根据第一层的系数进行噪声层的估计来调整阈值。
% THRESH(:,:)
% 
% %比较原始信号、含噪信号和去噪信号
% figure(2);
% kp=0;
% for i=1:5
%     subplot(5,2,kp+1),plot(NX([i],:)');
%     title(['原始信号',num2str(i)])
%     subplot(5,2,kp+2),plot(XD([i],:)');
%     title(['含噪信号',num2str(i)])
%     kp=kp+2;
% end
H=XD'
xlswrite('C:\Users\灵\Desktop\quzao.xlsx',H)






    

