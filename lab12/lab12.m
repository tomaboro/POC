%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%image = imread('dwieFale.bmp');
%image = imread('kolo.bmp');
%image = imread('kwadrat.bmp');
image = imread('kwadrat45.bmp');
%image = imread('trojkat.bmp');


fImage = fft2(image);
ffImage = fftshift(fImage);

figure(1);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(fImage);
subplot(1,3,3); imshow(ffImage);

A = abs(ffImage);
ampl = log10(A + 1);
phaze = angle(ffImage.*(A>0.0001));

figure(2);
subplot(1,3,1); imshow(ffImage);
subplot(1,3,2); imshow(ampl,[]);
subplot(1,3,3); imshow(phaze,[]);

F1 = fft(image,[],1);
F2 = fft(F1,[],2);

figure(3);
subplot(1,2,1); imshow(fImage);
subplot(1,2,2); imshow(F2);

%%
image1 = imread('kwadrat.bmp');
%image2 = imread('kwadratT.bmp');
%image2 = imread('kwadrat45.bmp');
image2 = imread('kwadratS.bmp');
%image2 = imread('kwadrat45.bmp');
%image2 = imread('kwadratKL.bmp');

fImage = fft2(image1);
ffImage = fftshift(fImage);
A = abs(ffImage);
ampl = log10(A + 1);
phaze = angle(ffImage.*(A>0.0001));

subplot(2,4,1); imshow(image1); title('oryginal');
subplot(2,4,2); imshow(ffImage); title('fImage');
subplot(2,4,3); imshow(ampl,[]); title('amplituda');
subplot(2,4,4); imshow(phaze,[]); title('faza');

fImage = fft2(image2);
ffImage = fftshift(fImage);
A = abs(ffImage);
ampl = log10(A + 1);
phaze = angle(ffImage.*(A>0.0001));

subplot(2,4,5); imshow(image2); title('oryginal');
subplot(2,4,6); imshow(ffImage); title('fImage');
subplot(2,4,7); imshow(ampl,[]); title('amplituda');
subplot(2,4,8); imshow(phaze,[]); title('faza');

%%
image = imread('kolo.bmp');

fImage = fft2(image);
ffImage = fftshift(fImage);

ifImage = ifftshift(ffImage);
nImage = ifft2(ifImage);

imshow(imabsdiff(image,uint8(nImage)),[]);

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('lena.bmp');
fImage = fft2(image);
ffImage = fftshift(fImage);
A = abs(ffImage);
ampl = log10(A + 1);
phaze = angle(ffImage.*(A>0.0001));

figure(1)
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(ampl,[]); title('amplituda');
subplot(1,3,3); imshow(phaze,[]); title('faza');

[f1,f2] = freqspace(512,'meshgrif');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd((r>0.1)) = 0;
%Hd((r<0.7)) = 0;
%Hd((r<0.1) | (r>0.7) ) = 0;
figure(2);
colormap(jet(64)); mesh(f1,f2,Hd);

imageFiltr = ffImage.*Hd;

nImage = ifft2(ifftshift(imageFiltr));

figure(3);
imshow(nImage,[]);

h = fwind1(Hd,hanning(21));
[H f1 f2] = freqz2(h,512,512);

figure(4);
mesh(f1,f2,H);

imageFiltr2 = ffImage.*H;

nnImage = ifft2(ifftshift(imageFiltr2));

figure(5);
imshow(nnImage,[]);