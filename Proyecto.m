% Inicializamos.
clear all
clc
close all

% Buscar Las Carpetas donde esta alojada la base de datos y la imagen a
% comparar.

TrainDatabasePath ='C:\Users\Mario Mendoza\Documents\Proyecto Inteligencia\Base de Datos';
TestDatabasePath = uigetdir('C:\Users\Mario Mendoza\Documents\Proyecto Inteligencia\Rostros de Prueba', 'Selecciona la Carpeta donde la Imagen esta localizada');

% Elegimos la imagen a comparar utilizando el nombre de la imagen.
prompt = {'Coloca el Nombre de la Imagen a Comparar: '};
dlg_title = 'Sistema de Reconocimiento Facial';
num_lines= 1;
def = {'Nombre'};

% Con el nombre la ubicacion y la extencion asignamos a la variable la
% imagen.
TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.png');
im = imread(TestImage);

%Con la Carpeta contenedora de las imagenes que serviran como base de datos
%creamos la base de datos a la cual se le hara el triangulo de
%reconocimiento.
T = CreateDatabase(TrainDatabasePath);

% llamamos el proceso de triangulacion para la imagen y las imagenes de la
% base de datos
[m, A, Eigenfaces] = EigenfaceCore(T);

%Decimos que nuestra salida va a ser la comparacion por pesos de los
%trianglos de la imagen.
OutputName = Recognition(TestImage, m, A, Eigenfaces);

%Mostramos las salidas la imagen a mostrar y la imagen mas parecida
%forzadamente a la entrada.
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

imshow(im)
title('Imagen a Buscar');
figure,imshow(SelectedImage);
title('Cara Mas Parecida a la Imagen');

str = strcat('Matched image is :  ',OutputName);
disp(str)
