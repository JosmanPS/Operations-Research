%Este programa obtiene la matriz de distancias m�s cortas en una red,
%utilizando el algoritmo de Floyd-Warshall.
n=input('El numero de v�rtices es:');
D=input('La matriz de distancias es:');
F=D;
for k=1:n
    for s=1:n
        for t=1:n
            F(s,t)=min(F(s,t), F(s,k)+F(k,t));
        end
    end
end
disp('La matriz de distancias m�s cortas es')
F