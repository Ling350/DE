%���Ժ���.��ֵ�ú���testFun(x)
%���������ú���mutation(X,bestX,F)
%���������ú���crossover(X,V,CR)
clear all;
close all;%��ͼ
clc;%����
B=zeros(25,1);
for run=1:25
    maxIteration=1000;%����������
    Generation=0;%�������������ߵ�ǰ��������
    Xmax=1.28;%�����Ͻ磬���Ը�����Ҫ��Ϊ������ʽ
    Xmin=-1.28;%�����½�
    Dim=30;%����ά��
    NP=200;%population size,��Ⱥ��ģ
    F=0.3;%scaling factor �������ӣ���������[0,2]
    CR=0.3;%crossover rate ������ʣ���������[0,1]
    


%%
%step1 ��ʼ��
%X represent population
%Generation=0;    
    X=(Xmax-Xmin)*rand(NP,Dim)+Xmin;%X�д������i���д������i��ά��j %����ֵrand(a,b)����һ��a��b�е�0��1֮��������2��30�У��д�����壬�д�������ά��
    
%%
%step2 mutation,crossover,selection

    while Generation<maxIteration
        %��bestX
        for i=1:NP 
          fitnessX(i)=testFun(X(i,:));%fitnessX��ʾX����Ӧֵ
        end
        
        [fitnessbestX,indexbestX]=min(fitnessX);%fitnessX��һ����������[Y,U]=min(A)������������Y��U��Y������¼A��ÿ�е���Сֵ��U������¼ÿ����Сֵ���кš�
        %bestX=X(indexbestX,:);%bestX��ʾ����ֵ��Ӧ��λ��   
%%

%����Ϊÿһ������Xi,G ����һ����������Vi,G�� G�����������        
        V=mutation(X,F);
        
  %%   
%step2.2 crossover    
%����Ϊÿһ������Xi,G ����һ����������Ui,G�� G�����������
        U=crossover(X,V,CR);
        
%%    
%step2.3 selection        
        
        for i=1:NP
            fitnessU(i)=testFun(U(i,:));
        end
        for i=1:NP
            if fitnessU(i)<=fitnessX(i)
                X(i,:)=U(i,:);
                fitnessX(i)=fitnessU(i);
                if fitnessU(i)<fitnessbestX
                    bestX=U(i,:);
                    fitnessbestX=fitnessU(i);
                end
            end
        end
        fitnessbestX;
        %bestX
        
        Generation=Generation+1;
        bestfitnessG(Generation)=fitnessbestX;
    end
    [bestfitnessX,index]=min(fitnessbestX); 
    %bestfitnessX
    bestX=X(index,:);
    bestfitnessX;
    hengzhou=1:maxIteration;
    y=abs(bestfitnessG-bestfitnessX);
    zongzhou=log10(y);
    optValue=num2str(bestfitnessX);%������ת��Ϊ�ַ���
    Location=num2str(bestX);%num2str����ֵ�����ַ���
    disp(strcat('the optimal value','=',optValue));%disp�൱��print
    disp(strcat('the best location','=',Location));%strcat���������ַ���
    %��ͼ
    plot(hengzhou,zongzhou)
    xlabel('Iteration')
    ylabel('log10')
    title('����һ��������ͼ')
B(run,1)=bestfitnessX;
end
IndependentbestX=min(B)
IndependentworstX=max(B)
means=mean(B)
Standard=std(B)



   
   
 


