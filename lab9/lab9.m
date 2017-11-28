%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('dom.png');
tresh = 10;
sigma = 0.1;
%imageEdge = edge(image,'log');
imageEdge = edge(image,'log',tresh,sigma);

figure(1);
subplot(1,2,1); imshow(image);              title('oryginal');
subplot(1,2,2); imshow(imageEdge);          title('detekcja LoG');

%%

image = imread('dom.png');
tresh = 0.5;
sigma = 4;
imageEdge = edge(image,'canny');
%imageEdge = edge(image,'canny',tresh,sigma);

figure(2);
subplot(1,2,1); imshow(image);          title('oryginal');
subplot(1,2,2); imshow(imageEdge);          title('detekcja Canny');

%%

image = imread('dom.png');
tresh = 4;
sigma = 4;
imageEdge = edge(image,'Sobol');
%imageEdge = edge(image,'Sobol',tresh,sigma);

figure(2);
subplot(1,2,1); imshow(image);          title('oryginal');
subplot(1,2,2); imshow(imageEdge);          title('detekcja Sobol');

%%
image = imread('dom.png');

imageEdgeLoG = edge(image,'log');

imageEdgeSobel = edge(image,'Sobel');

imageEdgeCanny = edge(image,'canny');

tresh1 = 4;
sigma1 = 4;
imageEdgeLoG1 = edge(image,'log',tresh1,sigma1);

tresh2 = 4;
sigma2 = 4;
imageEdgeSobel1 = edge(image,'Sobel',tresh2,sigma2);

tresh3 = 4;
sigma3 = 4;
imageEdgeCanny1 = edge(image,'canny',tresh3,sigma3);

figure(4);
subplot(2,3,1); imshow(imageEdgeLoG);          title('LoG');
subplot(2,3,2); imshow(imageEdgeSobel);        title('Sobel');
subplot(2,3,3); imshow(imageEdgeCanny);        title('Canny');
subplot(2,3,4); imshow(imageEdgeLoG1);         title('LoG1');
subplot(2,3,5); imshow(imageEdgeSobel1);       title('Sobel1');
subplot(2,3,6); imshow(imageEdgeCanny1);       title('Canny1');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = zeros(11,11);
image(7,2) = 1;

[H,tehta,ro] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

image(5,11) = 1;

[H2,tehta2,ro2] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure(1);
subplot(1,3,1); imshow(image);      title('oryginal');
subplot(1,3,2); imshow(H,[]);       title('hough');
subplot(1,3,3); imshow(H2,[]);       title('hough 2');

%%
image = zeros(11,11);
image(7,2) = 1;
image(5,11) = 1;
image(1,1) = 1;
image(4,6) = 1;

[H,theta,rho] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure(2);
subplot(1,1,1); imshow(H,[]);
%%
rho1 = rho(143);
theta1 = theta(163);
%%
x = 0:0.1:10;

y = (rho1 - x*cosd(theta1)/sind(theta1));
figure(3);
imshow(image);
hold on;
plot(x+1,y+1);

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('kwadraty.png');
imageEdge = edge(image,'canny');

figure(1);
imshow(imageEdge);

[H,theta,rho] = hough(image);

figure(2);
imshow(H,[]);
hold on;

tmp = houghpeaks(H,8);

plot(tmp,'o');