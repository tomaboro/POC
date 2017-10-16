%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars

%odczytujemy informacje o obrazach
bmpInfo = imfinfo('lena.bmp');
jpgInfo = imfinfo('lena.jpg');

%wczytujemy obraz w formacie bmp i wyświetlamy go
figure(1);
bmpRead = imread('lena.bmp');
bmpShow = imshow(bmpRead);

%wczytujemy obraz w formacie jpg i wyświetlamy go
figure(2);
jpgRead = imread('lena.jpg');
jpgShow = imshow(jpgRead);

%konwertujemy obraz do skali szarości i wyświetlamy go
figure(3);
bmpGray = rgb2gray(bmpRead);
imshow(bmpGray)
%przekonwertowny obraz zapisujemy na dysku
imwrite(bmpGray,'lena_gray.bmp');

%Rysujemy dwuwymiarowy wyres obrazu
figure(4)
colormap gray
mesh(bmpGray)

%Rysujemy przekrój 10 wiersza
figure(5)
plot(bmpGray(10,:));

%rysujemy przekrój 10 kolumny
figure(6)
plot(bmpGray(:,10));

%%
%czyścimy zmienne
clearvars

%wczytujemy obraz w odcieniach szarości
img = imread('lena_gray.bmp');

%konwertujemy obraz do obrazu indeksowanego i wyświetlamy go
figure(1);
[X,MAP] = gray2ind(img,256);
imshow(X,MAP);

%zmieniamy mpy kolorów
figure(2);
MAP1 = colormap(winter(256));
imshow(X,MAP1);
figure(3);
MAP2 = colormap(summer(256));
imshow(X,MAP2);

%tworzymy własną mapę kolorów 
%colormapeditor