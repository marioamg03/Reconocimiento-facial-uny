function OutputName = Recognition(TestImage, m, A, Eigenfaces)
% Proceso de reconocimiento del rostro y compraracion

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Proyectamos los segmentos valorados en el espacio de comparacion.
    ProjectedImages = [ProjectedImages temp]; 
end

% Extraemos las imagenes para comparacion

InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; % Centramos la imagen de comparacion.
ProjectedTestImage = Eigenfaces'*Difference; % aplicamos la prueba al vetor

%Comparamos los pesos establecidos con los de la imagen del Vector y
%asignamos la salida mas parecida comparando los valores obtenidos.

Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist);
OutputName = strcat(int2str(Recognized_index),'.png');
