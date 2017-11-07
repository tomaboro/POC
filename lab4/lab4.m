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

%%
image = imadjust(imread('hist1.bmp'));

[H,x] = imhist(image,256);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

%pkt 11
C2Scale = uint8((C2/max(C2))*255);
nImage = intlut(image,C2Scale);

[H3,x3] = imhist(nImage,256);
C3 = cumsum(H3);
k3 = max(C3)/max(H3);
C4 = C3/k3;

figure(1);
subplot(1,2,1);
imshow(nImage);
subplot(1,2,2);
plot(x3,H3);
hold on;
plot(x3,C4);


%%
clearvars;
clear all;
clc;

%image = imread('hist1.bmp');
%image = imread('hist2.bmp');
%image = imread('hist3.bmp');
image = imread('hist4.bmp');

figure(1);
subplot(2,2,1);
imshow(image);
title('otyginał')
subplot(2,2,2);
imshow(imadjust(image));
title('imadjust');
subplot(2,2,3);
imshow(histeq(image));
title('histeq')
subplot(2,2,4);
imshow(adapthisteq(image));
title('adapthisteq');


%%
clearvars;
clear all;
clc;

%Wczytujemy zadany histogram
load histogramZadany;

%Wczytujemy obraz phobos
image = imread('phobos.bmp');

subplot(2,3,1);
imshow(image);
title('oryginał');
subplot(2,3,4);
imhist(image);
subplot(2,3,2);
histeq(image);
title('histeq');
subplot(2,3,5);
imhist(histeq(image));
subplot(2,3,3);
histeq(image,histogramZadany);
title('histeq z histogramzadany');
subplot(2,3,6);
imhist(histeq(image,histogramZadany));

figure(2);
%rozciągamy i wyrównujemy histogram 
imageAdj = imadjust(image);
imshow(adapthisteq(imageAdj));

%%
clearvars;
clear all;
clc;

lena = imread('lenaRGB.bmp');
%lena = imread('jezioro.jpg');
lenaR = lena(:,:,1);
lenaG = lena(:,:,2);
lenaB = lena(:,:,3);

figure(1);
subplot(1,3,1);
imhist(lenaR);
title('RED');
subplot(1,3,2);
imhist(lenaG);
title('GREEN');
subplot(1,3,3);
imhist(lenaB);
title('BLUE');

Re =  histeq(lenaR);
Ge =  histeq(lenaG);
Be =  histeq(lenaB);

lenaEQ = lena;
lenaEQ(:,:,1) = Re;
lenaEQ(:,:,2) = Ge;
lenaEQ(:,:,3) = Be;

lenaHSV = rgb2hsv(lena);
lenaH = lenaHSV(:,:,1);
lenaS = lenaHSV(:,:,2);
lenaV = lenaHSV(:,:,3);

Ve = histeq(lenaV);
lenaHSVEQ = lenaHSV;
lenaHSVEQ(:,:,3) = Ve;

figure(2);
subplot(1,3,1);
imshow(lena);
title('oryginał');
subplot(1,3,2);
imshow(lenaEQ);
title('histeq po RGB');
subplot(1,3,3);
imshow(hsv2rgb(lenaHSVEQ));
title('histeq po HSV');

%%
clearvars;
clear all;
clc;

image = imread('jet.bmp');

lm = round(mean(image(:)));

[H,x] = imhist(image,256);

H1 = H(1:lm);
H2 = H(lm+1:256);

H1 = H1/sum(H1);
H2 = H2/sum(H2);

C1 = cumsum(H1);
C2 = cumsum(H2);

C1n = (lm)*C1;
C2n = lm+1 + (255-lm+1)*C2;
lut = [C1n; C2n];

nImage = intlut(image,uint8(lut));

figure(1);
subplot(1,2,1);
imshow(nImage);
subplot(1,2,2);
imhist(nImage);

%%
clearvars;
clear all;
clc;

image = imread('jet.bmp');

[H,x] = imhist(image,256);
C = cumsum(H);
[X Y] = size(image);
[calue lm] = min(abs(C-(X*Y/2)));


H1 = H(1:lm);
H2 = H(lm+1:256);

H1 = H1/sum(H1);
H2 = H2/sum(H2);

C1 = cumsum(H1);
C2 = cumsum(H2);

C1n = (lm)*C1;
C2n = lm+1 + (255-lm+1)*C2;
lut = [C1n; C2n];

nImage = intlut(image,uint8(lut));

figure(1);
subplot(1,2,1);
imshow(nImage);
subplot(1,2,2);
imhist(nImage);