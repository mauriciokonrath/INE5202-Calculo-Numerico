
A =[1,1;
    1,-1];
b = [4,2];

Toler = 1e-5;
IterMax = 10

%n,A,b,Toler,IterMax = ordem,matriz,vetor independente,tolerancia,numero
%maximo de iteracoes
%x,Iter,CondErro = vetor solucao,numero de iteracoes e condicao de erro

for i=1:n

    r=1/A(i,i);

    for j=1:n

        if i~=j

            A(i,j)=A(i,j)*r;

        end

    end

    b(i)=b(i)*r;

    x(i)=b(i);

end

Iter =0;

 fprintf('\nIter = %d  ' ,Iter);

    x

    

while 1

    Iter = Iter+1;

    for i=1:n

        Soma=0;

        for j=1:n

            if i~=j

                Soma=Soma+A(i,j)*x(j);

            end

        end

        v(i)=b(i)-Soma;

    end

    NormaNum =0;

    NormaDen=0;

    for i=1:n

        t=abs(v(i)-x(i));

        if t>NormaNum

            NormaNum =t;

        end

        if abs(v(i))>NormaDen

            NormaDen = abs(v(i));

        end

        x(i)=v(i);

    end

    NormaRel = NormaNum/NormaDen;

    fprintf('\nIter = %d  ' ,Iter);

    x

    fprintf('NormaRel = %f \n',NormaRel);

    if NormaRel<=Toler | Iter>=IterMax

        break;

    end

end

if NormaRel<=Toler

    CondErro =0;

else

    CondErro =1;

end