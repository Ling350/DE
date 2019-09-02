load thinker;
%产生含噪信号
[m,n]=size(X);%192行96列的矩阵
init=2055615866;
for i=1:m
    randn('seed',init);
    NX(i,:)=X(i,:)+18*randn(size(X(i,:)));
end
%NX:192行，96列
%[a,b]=size(NX)


%使用db2小波进行二层分解
dec=mdwtdec('r',NX,2,'db2');
%使用阈值方法‘sqtwolog’和阈值调整方法‘sln’小波去噪
[XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','sln');%返回原始信号NX的去噪信号XD，
%decDEN为NX的小波分解结构，THRESH阈值矩阵，sqtwolog为去噪方法，代表通用阈值。sln代表阈值调整
%方法，根据第一层的系数进行噪声层的估计来调整阈值。
THRESH([2 31],:)

%比较原始信号、含噪信号和去噪信号
figure(1);
subplot(221);
plot(X([2 31],:)');
title('原始信号2和31');
subplot(222);
plot(NX([2 31],:)');
title('含噪信号2和31');
subplot(223);
plot(XD([2 31],:)');
title('去燥信号2和31');


%使用阈值方法‘sqtwolog’和阈值调整方法‘one’小波去噪
[XD,decDEN,THRESH]=mswden('den',dec,'sqtwolog','one');%返回原始信号NX的去噪信号XD，
%decDEN为NX的小波分解结构，THRESH阈值矩阵，sqtwolog为去噪方法，代表通用阈值。sln代表阈值调整
%方法，根据第一层的系数进行噪声层的估计来调整阈值。
THRESH([2 31],:)

%比较原始信号、含噪信号和去噪信号
figure(2);
subplot(221);
plot(X([2 31],:)');
title('原始信号2和31');
subplot(222);
plot(NX([2 31],:)');
title('含噪信号2和31');
subplot(223);
plot(XD([2 31],:)');
title('去燥信号2和31');






    

