%测试函数.求值用函数testFun(x)
%变异向量用函数mutation(X,bestX,F)
%交叉向量用函数crossover(X,V,CR)
clear all;
close all;%清图
clc;%清屏
B=zeros(25,1);
for run=1:25
    maxIteration=1000;%最大迭代次数
    Generation=0;%进化代数，或者当前迭代代数
    Xmax=1.28;%搜索上界，可以根据需要改为向量形式
    Xmin=-1.28;%搜索下界
    Dim=30;%个体维数
    NP=200;%population size,种群规模
    F=0.3;%scaling factor 缩放因子，变异算子[0,2]
    CR=0.3;%crossover rate 交叉概率，交叉算子[0,1]
    


%%
%step1 初始化
%X represent population
%Generation=0;    
    X=(Xmax-Xmin)*rand(NP,Dim)+Xmin;%X行代表个体i，列代表个体i的维度j %赋初值rand(a,b)产生一个a行b列的0到1之间的随机数2行30列，列代表个体，行代表个体的维度
    
%%
%step2 mutation,crossover,selection

    while Generation<maxIteration
        %求bestX
        for i=1:NP 
          fitnessX(i)=testFun(X(i,:));%fitnessX表示X的适应值
        end
        
        [fitnessbestX,indexbestX]=min(fitnessX);%fitnessX是一个行向量，[Y,U]=min(A)：返回行向量Y和U，Y向量记录A的每列的最小值，U向量记录每列最小值的行号。
        %bestX=X(indexbestX,:);%bestX表示最优值对应的位置   
%%

%产生为每一个个体Xi,G 产生一个变异向量Vi,G。 G代表进化代数        
        V=mutation(X,F);
        
  %%   
%step2.2 crossover    
%产生为每一个个体Xi,G 产生一个交叉向量Ui,G。 G代表进化代数
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
    optValue=num2str(bestfitnessX);%将数字转换为字符串
    Location=num2str(bestX);%num2str将数值换成字符串
    disp(strcat('the optimal value','=',optValue));%disp相当于print
    disp(strcat('the best location','=',Location));%strcat横向连接字符串
    %画图
    plot(hengzhou,zongzhou)
    xlabel('Iteration')
    ylabel('log10')
    title('问题一收敛曲线图')
B(run,1)=bestfitnessX;
end
IndependentbestX=min(B)
IndependentworstX=max(B)
means=mean(B)
Standard=std(B)



   
   
 


