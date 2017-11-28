%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('ertka.bmp');

SE = strel('square',3);
%SE = strel('square',5);
%SE = strel('diamond',3); 
%SE = strel('octagon', 3);

imageEroded1 = imerode(image,SE);
imageEroded2 = imerode(imageEroded1,SE);
imageEroded3 = imerode(imageEroded2,SE);

figure(1);
subplot(1,4,1); imshow(image);          title('oryginał');
subplot(1,4,2); imshow(imageEroded1);    title('erozja');
subplot(1,4,3); imshow(imageEroded2);    title('2x erozja');
subplot(1,4,4); imshow(imageEroded3);    title('3x erozja');

%%
image2 = imread('buzka.bmp');
SE2 = strel('arbitrary',[1 0 1;0 1 0;1 0 1]);
image2Eroded = imerode(image2,SE2);

figure(2);
subplot(1,2,1); imshow(image2);          title('oryginał');
subplot(1,2,2); imshow(image2Eroded);    title('erozja');

%%
image = imread('ertka.bmp');

SE = strel('square',3);

imageDilatated1 = imdilate(image,SE);
imageDilatated2 = imdilate(imageDilatated1,SE);
imageDilatated3 = imdilate(imageDilatated2,SE);

figure(3);
subplot(1,4,1); imshow(image);              title('oryginał');
subplot(1,4,2); imshow(imageDilatated1);    title('dylatacja');
subplot(1,4,3); imshow(imageDilatated2);    title('2x dylatacja');
subplot(1,4,4); imshow(imageDilatated3);    title('3x edylatacja');

%%
image = imread('ertka.bmp');
%image = imread('wyspa.bmp');
%image = imread('kolka.bmp');

SE = strel('square',3);
%SE = strel('square',5);
%SE = strel('diamond',3); 
%SE = strel('octagon', 3);

figure(4);
subplot(1,5,1); imshow(image);                  title('oryginał');
subplot(1,5,2); imshow(imerode(image,SE));      title('erozja');
subplot(1,5,3); imshow(imdilate(image,SE));     title('dylatacja');
subplot(1,5,4); imshow(imopen(image,SE));       title('otwarcie');
subplot(1,5,5); imshow(imclose(image,SE));      title('zamknięcie');

%%
image = imread('ertka.bmp');

SE = strel('square',3);
image = imopen(image,SE);
image = imclose(image,SE);

figure(5);
imshow(image);

%%
image = imread('hom.bmp');

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

figure(6);
subplot(1,2,1); imshow(image);                           title('oryginał');
subplot(1,2,2); imshow(bwhitmiss(image,SE1,SE2));        title('trafi, nie trafi');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('fingerprint.bmp');

image2 = bwmorph(image,'thin');
image3 = bwmorph(image2,'thin');
imageInf = bwmorph(image,'thin',Inf);

subplot(1,4,1); imshow(image);      title('oryginał');
subplot(1,4,2); imshow(image2);     title('1x bwmorph thin');
subplot(1,4,3); imshow(image3);     title('2x bwmorph thin');
subplot(1,4,4); imshow(imageInf);   title('Inf bwmorph thin');

%%
image = imread('kosc.bmp');

image2 = bwmorph(image,'skel');
image3 = bwmorph(image2,'skel');
imageInf = bwmorph(image,'skel',Inf);

subplot(1,4,1); imshow(image);     title('oryginał');
subplot(1,4,2); imshow(image2);    title('1x bwmorph skel');
subplot(1,4,3); imshow(image3);    title('2x bwmorph skel');
subplot(1,4,4); imshow(imageInf);  title('Inf bwmorph skel');

%%
image = imread('text.bmp');

SE = ones(51,1);

image2 = imopen(image,SE);
image3 = imreconstruct(imerode(image,SE),image);

subplot(1,3,1); imshow(image);     title('oryginał');
subplot(1,3,2); imshow(image2);    title('imopen');
subplot(1,3,3); imshow(image3);    title('imreconstruct');

%%
image = imread('text.bmp');

subplot(1,2,1); imshow(image);                    title('oryginał');
subplot(1,2,2); imshow(imfill(image,'holes'));    title('imfill holes');
%%
image = imread('text.bmp');

subplot(1,2,1); imshow(image);                    title('oryginał');
subplot(1,2,2); imshow(imclearborder(image));    title('imclearborder');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('ferrari.bmp');

SE = strel('square',3);

imageEroded = imerode(image,SE);
imageDilatated = imdilate(image,SE);
diff = imabsdiff(imageEroded,imageDilatated);
imageOpened = imopen(image,SE);
imageClosed = imclose(image,SE);
imageTopHat = imtophat(image,SE);
imageBottomHat = imbothat(image,SE);

figure(1);
subplot(1,4,1); imshow(image);              title('oryginał');
subplot(1,4,2); imshow(imageEroded);        title('erozja');
subplot(1,4,3); imshow(imageDilatated);     title('dylatacja');
subplot(1,4,4); imshow(diff);               title('diff');

figure(2);
subplot(1,3,1); imshow(image);              title('oryginał');
subplot(1,3,2); imshow(imageOpened);        title('otwarcie');
subplot(1,3,3); imshow(imageClosed);        title('zamknięcie');

figure(3);
subplot(1,3,1); imshow(image);              title('oryginał');
subplot(1,3,2); imshow(imageTopHat);        title('topHat');
subplot(1,3,3); imshow(imageBottomHat);     title('bottomHat');

image2 = imread('rice.png');

SE2 = strel('disk',10);
image2tophat = imtophat(image2,SE2);

figure(4);
subplot(1,2,1); imshow(image2);             title('oryginal');
subplot(1,2,2); imshow(image2tophat);       title('tophat');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('calculator.bmp');

SE = ones(1,71);
imageEroded = imerode(image,SE);
imageReconstructed = imreconstruct(imageEroded,image);
imageOpened = imopen(image,SE);

figure(1);
subplot(1,4,1); imshow(image);                    title('oryginal');
subplot(1,3,2); imshow(imageReconstructed);       title('rekonstrukcja');
subplot(1,3,3); imshow(imageOpened);              title('klasyczne otwarcie');

image2 = imabsdiff(image,imageReconstructed);

figure(2);
subplot(1,2,1); imshow(image2);                  title('imabsdiff');
subplot(1,2,2); imshow(imtophat(image,SE));         title('tophat');

SE2 = ones(1,11);
image2Eroded = imerode(image2,SE2);
image2Reconstructed = imreconstruct(image2Eroded,image2);

figure(3);
subplot(1,2,1); imshow(image2);                    title('oryginal');
subplot(1,2,2); imshow(image2Reconstructed);       title('rekonstrukcja');

SE3 = ones(1,21);
image3 = imdilate(image2Reconstructed,SE3);
image3Reconstructed = imreconstruct(min(image3,image2),image2);

figure(4);
subplot(1,2,1); imshow(image);                  title('start');
subplot(1,2,2); imshow(image3Reconstructed);    title('result');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

load gra.mat;

lut = makelut(@myFunc,3);

image = imread('szkielet.bmp');

figure(1);
subplot(1,2,1); imshow(image);
subplot(1,2,2); imshow(applylut(image,lut));

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

load gra.mat;

lut = makelut(@myFunc2,3);

step0 = plansza1;
step1 = applylut(step0,lut);
step2 = applylut(step1,lut); 
step3 = applylut(step2,lut); 
step4 = applylut(step3,lut); 
step5 = applylut(step4,lut);

figure(1);
subplot(2,3,1); imshow(step0); title('step0');
subplot(2,3,2); imshow(step1); title('step1');
subplot(2,3,3); imshow(step2); title('step2');
subplot(2,3,4); imshow(step3); title('step3');
subplot(2,3,5); imshow(step4); title('step4');
subplot(2,3,6); imshow(step5); title('step5');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

load gra.mat;

lut = makelut(@myFunc2,3);

step1 = obraz;
step2 = plansza2;
for i = 1:120
    subplot(1,2,1); imshow(step1);
    subplot(1,2,2); imshow(step2);
    step1 = applylut(step1,lut);
    step2 = applylut(step2,lut);
    pause(0.25);
end