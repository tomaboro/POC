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
imageEdge = edge(image,'Canny');
%imageEdge = edge(image,'canny',tresh,sigma);

figure(2);
subplot(1,2,1); imshow(image);              title('oryginal');
subplot(1,2,2); imshow(imageEdge);          title('detekcja Canny');

%%

image = imread('dom.png');
tresh = 0;
sigma = 0;
%imageEdge = edge(image,'Sobel');
imageEdge = edge(image,'Sobel',tresh);

figure(2);
subplot(1,2,1); imshow(image);          title('oryginal');
subplot(1,2,2); imshow(imageEdge);          title('detekcja Sobel');

%%
image = imread('dom.png');

imageEdgeLoG = edge(image,'log');

imageEdgeSobel = edge(image,'Sobel');

imageEdgeCanny = edge(image,'canny');


tresh1 = 0.5;
sigma1 = 0.5;
imageEdgeLoG1 = edge(image,'log',tresh1,sigma1);

tresh2 = 0.3;
sigma2 = 0.3;
imageEdgeSobel1 = edge(image,'Sobel',tresh1);

tresh3 = 0.5;
sigma3 = 0.5;
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

[H,theta,rho] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);
peaks = houghpeaks(H,8);

figure(2);
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

%%
figure(3);
lines = houghlines(imageEdge,theta,rho,peaks,'FillGap',5,'MinLength',7);
figure, imshow(imageEdge), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

%%
