%TOMASZ BOROWICZ
%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%ładujemy funkcje z pliku
load funkcjeLUT;

figure(1);
title('kwadratowa');
plot(kwadratowa)

image = imread('jet.bmp');
figure(2);
imshow(image)
title('oryginał');

newImage = intlut(image,kwadratowa);
figure(3);
imshow(newImage)
title('po operacji LUT');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%ładujemy funkcje z pliku
load funkcjeLUT;

image = imread('jet.bmp');
%image = imread('lena.bmp');

%rysujemy wykresy dla roznych funkcji \
figure(1);
LUT(image,kwadratowa);

figure(2);
LUT(image,log);

figure(3);
LUT(image,odwlog);

figure(4);
LUT(image,odwrotna);

figure(5);
LUT(image,pierwiastkowa);

figure(6);
LUT(image,pila);

figure(7);
LUT(image,wykladnicza);

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

jet = imread('jet.bmp');
lena = imread('lena.bmp');

sum = imadd(lena,jet);
sum16 = imadd(lena,jet,'uint16');

figure(1);
subplot(1,2,1);
imshow(sum);
title('uint8');
subplot(1,2,2);
imshow(sum16,[]);
title('uint16');

lena16 = int16(lena);
jet16 = int16(jet);

%%

jet = imread('jet.bmp');
lena = imread('lena.bmp');
lena16 = int16(lena);
jet16 = int16(jet);

sub = imsubtract(lena,jet);
sub16 = imsubtract(lena16,jet16);
diff = imabsdiff(lena,jet);

figure(2);
subplot(1,3,1);
imshow(sub);
title('imsubtract uint8');
subplot(1,3,2);
imshow(sub16,[]);
title('imsubtract int16');
subplot(1,3,3);
imshow(diff,[]);
title('imabsdiff uint8');

%%
jet = imread('jet.bmp');
lena = imread('lena.bmp');

multi = immultiply(lena,jet);
multiConst = immultiply(lena,3);
maska = boolean(imread('kolo.bmp'));
multiMaska = immultiply(lena,maska);

figure(3);
subplot(1,3,1);
imshow(multi);
title('immultiply');
subplot(1,3,2);
imshow(multiConst,[]);
title('const');
subplot(1,3,3);
imshow(multiMaska,[]);
title('mask');

%%
lena = imread('lena.bmp');

figure(4);
compl = imcomplement(lena);
imshow(compl,[]);
title('imcomplement');

%%
kolo = boolean(imread('kolo.bmp'));
kwadrat = boolean(imread('kwadrat.bmp'));

figure(5);
subplot(1,4,1);
imshow(~kolo);
title('negacja');
subplot(1,4,2);
imshow(kolo & kwadrat);
title('i');
subplot(1,4,3);
imshow(kolo | kwadrat);
title('lub');
subplot(1,4,4);
imshow(xor(kolo,kwadrat));
title('xor');

