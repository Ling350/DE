%���ض�Ԫ�ź�x,ԭʼ�ź�x_org�Լ�����Э�������convar
load ex4mwden

x;       %�����ź�
x_orig;  %ԭʼ�ź�1024*4
[m,n]=size(x);%1024��4��

%����ȥ�����
level=5;%�ֽ����
wname='sym4';%С������
tptr='sqtwolog';%ȥ�������Ĭ��ֵ
sorh='s';%ȥ�������Ĭ��ֵ

%����PCA����ѡ���������ɷ���Ŀ��ʹ��Kaiser's׼��
npc_app='kais';%ѡ�����ɷֵķ���
npc_fin='kais';%ѡ�����ɷֵķ���

%��Ԫȥ��
[x_den,npc,nestco]=wmulden(x,level,wname,npc_app,npc_fin,tptr,sorh);
%x_den��xȥ�����ź�  npc:ѡ���������ɷ���Ŀʸ����nestco������Э�������

%D��ʾԭʼ��ȥ���ź�
kp=0;
for i=1:4
    subplot(4,3,kp+1),plot(x_orig(:,i));
    title(['ԭʼ�ź�',num2str(i)])
    subplot(4,3,kp+2),plot(x(:,i));
    title(['�����ź�',num2str(i)])
    subplot(4,3,kp+3),plot(x_den(:,i));
    title(['ȥ���ź�',num2str(i)])
    kp=kp+3;
end
%���������ɷ���Ŀ
npc
%���Ƶ�����Э�������
nestco
%��ʵ��Э�������
covar
    



