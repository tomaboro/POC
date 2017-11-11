%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('plansza.bmp');
%image = imread('lena.bmp');

C = uint8(conv2(image,fspecial('average'),'same'));

figure(1);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(C);
subplot(1,3,3); imshow(imabsdiff(image,C),[]);

C3 = uint8(conv2(image,fspecial('average',3),'same'));
C5 = uint8(conv2(image,fspecial('average',5),'same'));
C9 = uint8(conv2(image,fspecial('average',9),'same'));
C15 = uint8(conv2(image,fspecial('average',15),'same'));
C35 = uint8(conv2(image,fspecial('average',35),'same'));

figure(2);
subplot(1,5,1); imshow(C3);
subplot(1,5,2); imshow(C5);
subplot(1,5,3); imshow(C9);
subplot(1,5,4); imshow(C15);
subplot(1,5,5); imshow(C35);

M = [1 2 1; 2 4 2; 1 2 1];
M = M/sum(sum(M));

tmp = uint8(conv2(image,M,'same'));

figure(3);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(tmp);
subplot(1,3,3); imshow(imabsdiff(image,tmp),[]);


filtrGaus1 = fspecial('gaussian',5,0.5);
filtrGaus2 = fspecial('gaussian',5,5);

figure(4);
subplot(1,2,1); mesh(filtrGaus1);
subplot(1,2,2); mesh(filtrGaus2);

nI1 = uint8(conv2(image,filtrGaus1,'same'));
nI2 = uint8(conv2(image,filtrGaus2,'same'));

figure(5);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(nI1);
subplot(1,3,3); imshow(nI2);

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('lenaSzum.bmp');

C_median = medfilt2(image,[5 5]);
C_avg = uint8(conv2(image,fspecial('average',5),'same'));

figure(1);
subplot(1,4,1); imshow(image);
subplot(1,4,2); imshow(C_median);
subplot(1,4,3); imshow(C_avg);
subplot(1,4,4); imshow(imabsdiff(C_median,C_avg),[]);

C = C_median;
for i = 1:9
    C = medfilt2(C,[5 5]);
end

figure(2);
subplot(1,2,1); imshow(image);
subplot(1,2,2); imshow(C);

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('moon.bmp');
M = [0 1 0; 1 -4 1; 0 1 0];
M = M/9;

%M = fspecial('laplacian',0.75);
M = fspecial('laplacian',0.75);
imageN = uint8(conv2(image,M,'same'));

figure(1);
subplot(1,4,1); imshow(image);
subplot(1,4,2); imshow(imageN+128,[]);
subplot(1,4,3); imshow(abs(imageN),[]);
%subplot(1,4,4); imshow(imadd(image,imageN));
subplot(1,4,4); imshow(imsubtract(image,imageN));

%%
clearvars;
clear all;
clc;

image = imread('kw.bmp');
%image = imread('jet.bmp');

load maskiPP;

%M = R1;
%M = R2;
%M = P1;
%M = P2;
%M = S1;
M = S2;
imageN = uint8(conv2(image,M,'same'));

figure(1);
subplot(1,4,1); imshow(image);
subplot(1,4,2); imshow(imageN+128,[]);
subplot(1,4,3); imshow(abs(imageN),[]);
%subplot(1,4,4); imshow(imadd(image,imageN));
subplot(1,4,4); imshow(imsubtract(image,imageN));


O = image;
OW = sqrt(imadd(conv2(O,S1,'same').^2,conv2(O,S2,'same').^2));
OW2 = sqrt(imadd(abs(conv2(O,S1,'same')),abs(conv2(O,S2,'same'))));
figure(2);
subplot(1,2,1); imshow(OW);
subplot(1,2,2); imshow(OW2);

%%
clearvars;
clear all;
clc;

%image = imread('lenaSzum.bmp');
image = imread('plytkaSzumImp.bmp');
[Y X] = size(image);

imageCP = image;
maxSize = 3;
defSize = 1;
for i = 5:Y-5
    for j = 5:X-5
        currSize = 1;
        
        while true
            %faza A    for j = 5:X-5
            window = image(i-currSize:i+currSize,j-currSize:j+currSize);
            z_med = median(median(window));
            z_max = max(max(window));
            z_min = min(min(window));
            z_xy = image(i,j);
            A1 = z_med - z_min;
            A2 = z_med - z_max;
            
            if A1 > 0 && A2 < 0
                %faza B;
                B1 = z_xy - z_min;
                B2 = z_xy - z_max;
            
                if B1 > 0 && B2 < 0
                    imageCP(i,j) = z_xy;
                else
                    imageCP(i,j) = z_med;
                end
                break
            elseif currSize > maxSize
                    imageCP(i,j) = z_med;
                    break
            else 
                currSize = currSize+1;
            end
        end
    end
end

imageCP2 = medfilt2(image,[5 5]);

figure(1);
subplot(1,3,1); imshow(image);
subplot(1,3,2); imshow(imageCP2);
subplot(1,3,3); imshow(imageCP);