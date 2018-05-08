function [m, A, Eigenfaces] = EigenfaceCore(T)
%Usamos la Funcion de triangulacion para pasar los dos rostros de las
%imagenes y compararlas luego
m = mean(T,2);
Train_Number = size(T,2);

%Calculamos el rostro y la desviacion de la imagen.
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m;
    A = [A temp]; % Aplicamos a todas la Imagenes
end

L = A'*A;
[V D] = eig(L);

L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end
%Salida de la triangulacion de los rostros
Eigenfaces = A * L_eig_vec;