%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('ccl1.png');

[Y,X] = size(image);
L = 1;
nImage = zeros(Y,X);
id = zeros(100);
for I = 1:100
    id(I) = I;
end


for J = 2:Y-1
    for I = 2:X-1
        if(image(J,I) ~= 0)
            A = nImage(J-1,I-1);
            B = nImage(J-1,I);
            C = nImage(J-1,I+1);
            D = nImage(J,I-1);
            sasiedzi = [A,B,C,D];

            if sum(sasiedzi) == 0 
                nImage(J,I) = L;
                L = L+1;
            else
                sasiedzi1 = nonzeros(sasiedzi);
                minimum = min(sasiedzi1);
                maximum = max(sasiedzi1);

                if(minimum == maximum)
                    nImage(J,I) = maximum;
                else
                    id = union(minimum,maximum,id);
                    nImage(J,I) = minimum;
                end
            end 
        end
     end
end

lut = zeros(100);
for I = 1:100
   lut(I) = root(id(I),id); 
end

for J = 1:Y
    for I = 1:X
        if nImage(J,I) ~= 0
           nImage(J,I) = lut(nImage(J,I)); 
        end
    end
end
imageResult = imread('ccl1Result.png');

figure(1);
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(nImage,[]); title('my result');
subplot(1,3,3); imshow(imageResult); title('result');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('ccl2.png');
nImage4 = bwlabel(image,4);
nImage8 = bwlabel(image,8);

figure(2);
subplot(1,3,1); imshow(image,[]); title('oryginal');
subplot(1,3,2); imshow(nImage4,[]); title('bwlabel 4');
subplot(1,3,3); imshow(nImage8,[]); title('bwlabel 8');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('shapes.png');
srcImage = image;

image = bwlabel(image,4);

wsp = obliczWspolczynniki(image);
[Y,X] = size(image);

for J = 1:Y
    for I = 1:X
        piksel = image(J,I);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.33 && wsp(piksel,2) < 0.66)
            image(J,I) = 0;
        end
    end
end

figure(3);
subplot(1,2,1); imshow(srcImage,[]); title('oryginal');
subplot(1,2,2); imshow(image,[]); title('x');

%%
image = imread('shapesReal.png');

imageSrc = image;

IBW = im2bw(image,0.22);
IC = imcomplement(IBW);
element_str = strel('rectangle',[5 5]);
Ierode = imerode(IC,element_str);

image = Ierode;

figure(4);
subplot(1,2,1); imshow(imageSrc);
subplot(1,2,2); imshow(image);


image = bwlabel(image,4);

wsp = obliczWspolczynniki(image);
[Y,X] = size(image);

for J = 1:Y
    for I = 1:X
        piksel = image(J,I);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.50 && wsp(piksel,2) < 0.66)
            image(J,I) = 0;
        end
    end
end

figure(5);
subplot(1,2,1); imshow(imageSrc,[]); title('oryginal');
subplot(1,2,2); imshow(image,[]); title('x');