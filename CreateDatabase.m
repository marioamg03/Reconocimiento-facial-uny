function T = CreateDatabase(TrainDatabasePath)

TrainFiles = dir('C:\Users\Mario Mendoza\Documents\Proyecto Inteligencia\Base de Datos');
Train_Number = 0;

for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Numero de todas las imagenes en la Carpeta base de Datos
    end
end

% creamos la base de datos utilizando una matriz 2D del Vector de imagenes
% 1D
T = [];
for i = 1 : Train_Number
    
    %Escojo todas la imagenes y les asigno el nuemro del Png
    str = int2str(i);
    str = strcat('\',str,'.png');
    str = strcat('C:\Users\Mario Mendoza\Documents\Proyecto Inteligencia\Base de Datos',str);
    
    img = imread(str);
    imshow(img);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % Hacemos el vector
    T = [T temp]; % incremente al proximo turno
end