%加载多元信号x,原始信号x_org以及噪声协方差矩阵convar


x;      %含噪信号702*5

[m,n]=size(x);%1024行4列

%设置去噪参数
level=5;%分解层数
wname='sym4';%小波名称
tptr='sqtwolog';%去噪参数，默认值
sorh='s';%去噪参数，默认值

%设置PCA参数选择保留的主成分数目，使用Kaiser's准则
npc_app='kais';%选择主成分的方法
npc_fin='kais';%选择主成分的方法

%多元去噪
[x_den,npc,nestco]=wmulden(x,level,wname,npc_app,npc_fin,tptr,sorh);
%x_den：x去噪后的信号  npc:选择保留的主成分数目矢量，nestco：噪声协方差矩阵

%D显示原始和去噪信号
kp=0;
for i=1:5
    subplot(5,2,kp+1),plot(x(:,i));
    title(['原始信号',num2str(i)])
    subplot(5,2,kp+2),plot(x_den(:,i));
    title(['含噪信号',num2str(i)])
    kp=kp+2;
end
%保留的主成分数目
npc
%估计的噪声协方差矩阵
nestco
%真实的协方差矩阵
covar
    



