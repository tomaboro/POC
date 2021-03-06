%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('coins.png');
%image = imread('rice.png');
%image = imread('tekst.bmp');
%image = imread('obiekty.bmp');
%image = imread('katalog.bmp');

figure(1);
subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imhist(image);

binImage = im2bw(image,80/255);
figure(2);
subplot(2,3,1);
imshow(image);
subplot(2,3,4);
imhist(image);
subplot(2,3,2);
imshow(binImage);
title(strcat('my ',num2str(80/255)));
subplot(2,3,3);
imshow(im2bw(image,graythresh(image)));
title(strcat('graytresh ',num2str(graythresh(image))));
subplot(2,3,5);
imshow(im2bw(image,clusterKittler(image)/255));
title(strcat('kittler ',num2str(clusterKittler(image)/255)));
subplot(2,3,6);
imshow(im2bw(image,entropyYen(image)/255));
title(strcat('yen ',num2str(entropyYen(image)/255)));


my = 80/255
gray = graythresh(image)
kittler = clusterKittler(image)/255
yen = entropyYen(image)/255
%%
clearvars;
clear all;
clc;

%image = imread('figura.png');
%image = imread('figura2.png');
%image = imread('figura3.png');
image = imread('figura4.png');
figure(1);
subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imhist(image);

%%
clearvars;
clear all;
clc;

image = imread('rice.png');

[X Y] = size(image);
imageCP = image;

for i = 1:X
    for j = 1:Y
        if image(j,i) < meanLT(j,i,7,image,X,Y) 
            imageCP(j,i) = 0;
        else
            imageCP(j,i) = 255;
        end 
    end
end

subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(imageCP);

%%
clearvars;
clear all;
clc;

image = imread('rice.png');

[X Y] = size(image);
imageCP = image;

for i = 1:X
    for j = 1:Y
        srednia = meanLT(j,i,7,image,X,Y);
        odchylenie = stddevLT(i,j,7,image,meanLT(i,j,7,image,X,Y),X,Y);
        T = srednia*(1-0.15*(odchylenie/128 - 1));
        if image(j,i) < T
            imageCP(j,i) = 0;
        else
            imageCP(j,i) = 255;
        end 
    end
end

subplot(1,2,1);
imshow(image);
subplot(1,2,2);
imshow(imageCP);

%%
clearvars;
clear all;
clc;

image = imread('bart.bmp');

figure(1);
subplot(2,1,1);
imshow(image);
subplot(2,1,2);
imhist(image);

progDolny = 190;
progGorny = 205;

imageBW = image > progDolny & image < progGorny;
imageBW = uint8(imageBW);

figure(2);
imshow(imageBW,[]);

%%
clearvars;
clear all;
clc;

image = imread('tekstReczny.png');

figure(1);
subplot(1,2,1); imshow(image);
subplot(1,2,2); imhist(image);

figure(2);
subplot(1,2,1); imshow(image);
subplot(1,2,2); imshow(im2bw(image,graythresh(image)));

imageCP = image;
N = 20;
a = 0.5;
[Y X] = size(image);
fifo = zeros(1,X*Y+100);
startPtr = 1;
endPtr = 20;
tmpM = 0;

for j = 1:Y
    for i = 1:X
        startPtr = startPtr+1;
        endPtr = endPtr+1;
        fifo(endPtr) = image(j,i);
        m = tmpM + (1/N)*(fifo(endPtr)-fifo(startPtr));
        tmpM = m;
        T = a*m;
        if image(j,i) < T
            imageCP(j,i) = 0;
        else
            imageCP(j,i) = 255;
        end 
    end
end

figure(3);
imshow(imageCP);