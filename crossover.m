function U=crossover(X,V,CR)
[NP,Dim]=size(X);
        for i=1:NP
            jRand=floor(rand*Dim);%����jRandҪ��[0,1)*Dim��ȡֵ���ʶ���floor
            for j=1:Dim
                if rand<CR||j==jRand
                    U(i,j)=V(i,j);
                else
                    U(i,j)=X(i,j);
                end     
            end    
    
end
        
