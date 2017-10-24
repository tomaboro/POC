%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obrazy
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

%wyświetlamy obrazy i ich histogramy
subplot(2,4,1);
imshow(lena1);
title('lena 1');

subplot(2,4,5);
imhist(lena1,256);

subplot(2,4,2);
imshow(lena2);
title('lena 2');

subplot(2,4,6);
imhist(lena2,256);

subplot(2,4,3);
imshow(lena3);
title('lena 3');

subplot(2,4,7);
imhist(lena3,256);

subplot(2,4,4);
imshow(lena4);
title('lena 4');

subplot(2,4,8);
imhist(lena4,256);

%%
%czyścimy zmienne
clearvars;
clear all;
clc;
%wczytujemy i wyswietlamy obraz oraz wyswietlamy jego histogram
hist1 = imread('hist1.bmp');
subplot(2,2,1);
imshow(hist1);
title('hist1');
subplot(2,2,3);
imhist(hist1,256);

%rozciągamy histogram i wyświetlamy efekty
hist1adj = imadjust(hist1);
subplot(2,2,2);
imshow(hist1adj);
title('hist1adj');
subplot(2,2,4);
imhist(hist1adj,256);

%%
clearvars;
clear all;
clc;

%wczytujemy obraz
image = imadjust(imread('hist1.bmp'));
%image = imread('hist1.bmp');

%wyznaczamy histogram skumulowany
[H,x] = imhist(image,256);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

figure(1);
plot(x,H);
hold on;
plot(x,C2);

%pkt 11
C2Scale = uint8((C2/max(C2))*255);
nImage = intlut(image,C2Scale);

figure(2);
subplot(1,2,1);
imshow(nImage);
subplot(1,2,2);
imhist(nImage);

%%
clearvars;
clear all;
clc;

%image = imread('hist1.bmp');
%image = imread('hist2.bmp');
%image = imread('hist3.bmp');
image = imread('hist4.bmp');
figure(1);
histeq(image,256);

figure(2);
imshow(adapthisteq(image));

%%
clearvars;
clear all;
clc;

load histogramZadany;

image = imread('phobos.bmp');
subplot(2,3,1);
imshow(image);
subplot(2,3,4);
imhist(image);
subplot(2,3,2);
histeq(image);
subplot(2,3,5);
imhist(histeq(image));
subplot(2,3,3);
histeq(image,histogramZadany);
subplot(2,3,6);
imhist(histeq(image,histogramZadany));

figure(2);
imageAdj = imadjust(image);
imshow(adapthisteq(imageAdj));

%%
clearvars;
clear all;
clc;


