%TOMASZ BOROWICZ

%%
%NAJBLIŻSZY SĄSIAD
%czyścimy zmienne
clearvars;
clear all;
clc;


%wczytujemy obraz
image = imread('parrot.bmp');
%image = imread('clock.bmp');
%image = imread('chessboard.bmp');

%wyświetlamy obraz
figure(1);
imshow(image)
title('oryginał')

%ustalamy wartość przeskalowanie
xReScale = 3;
yReScale = 3;
% xReScale = 0.5;
% yReScale = 0.5;
% xReScale = 1.5;
% yReScale = 1.5;

%odczytujemy rozmiary oryginalnego obrazu
[origialSizeY,originalSizeX] = size(image);

%wyliczamy rozmiary nowego obrazu
newSizeX = round(originalSizeX*xReScale);
newSizeY = round(origialSizeY*yReScale);

%inicjalizujemy nowy obraz (same 0 -> czarny prostokąt)
newImage = uint8(zeros(newSizeY,newSizeX));

%wyliczamy skok pętli
xStep = originalSizeX/newSizeX;
yStep = origialSizeY/newSizeY;

%iterujemy po pikselach nowego obrazu
for nX = 0:(newSizeX-1)
    for nY = (0:newSizeY-1)
        %znajdujemy najbliższy piksel w oryginalnym obrazie
        oY = round(nY*yStep);
        oX = round(nX*xStep);
        
        %zabezpieczamy się przed wykroczeniem poza obraz
        if oX > (originalSizeX - 1) 
            oX = originalSizeX-1;
        end
        if oY > (origialSizeY-1) 
            oY = origialSizeY-1;
        end
        
        %nadajemy wartość nowemu pikselowi na wartość najbliższego piksela
        %w starym obrazie
        newImage(nY+1,nX+1) = image(oY+1,oX+1);
    end
end

%wyświetlamy przeskalowany obraz
figure(2);
imshow(newImage)
title('najbliższy sąsiad')

%%
%DWULINIOWA
%czscimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obraz
image = double(imread('parrot.bmp'));
%image = double(imread('clock.bmp'));
%image = double(imread('chessboard.bmp'));

%wyświetlamy obraz
figure(1);
imshow(uint8(image))
title('oryginał')

%ustalamy wartość przeskalowanie
xReScale = 3.2;
yReScale = 3.2;
%xReScale = 0.5;
%yReScale = 0.5;
%xReScale = 5;
%yReScale = 5;

%odczytujemy rozmiary oryginalnego obrazu
[origialSizeY,originalSizeX] = size(image);

%wyliczamy rozmiary nowego obrazu
newSizeX = round(originalSizeX*xReScale);
newSizeY = round(origialSizeY*yReScale);

%wyliczamy skok pętli
xStep = originalSizeX/newSizeX;
yStep = origialSizeY/newSizeY;

%inicjalizujemy nowy obraz (same 0 -> czarny prostokąt)
newImage = double(zeros(newSizeY,newSizeX));

%iterujemy po pikselach nowego obrazu
for nX = 0:(newSizeX-1)
    for nY = (0:newSizeY-1)
        
        j = mod(nY*yStep,1);
        i = mod(nX*xStep,1);
        
        %obliczamy współrzędne punktów potrzebne do interpolacji
        x1 = floor(nX*xStep)+1;
        y1 = floor(nY*yStep)+1;
        x2 = x1 + 1;
        y2 = y1 + 1;
        
        %zabezpieczamy się przed wykroczeniem poza obraz
        if x1 > (originalSizeX - 1) 
            x1 = originalSizeX-1;
        end
        if y1 > (origialSizeY-1) 
            y1 = origialSizeY-1;
        end
        if x2 > (originalSizeX - 1) 
            x2 = originalSizeX-1;
        end
        if y2 > (origialSizeY-1) 
            y2 = origialSizeY-1;
        end
        
        %wyznaczamy wartosci w poszczegolnych punktach
        fA = image(y1,x1);
        fB = image(y1,x2);
        fC = image(y2,x2);
        fD = image(y2,x1);
        
        %podstawiamy do wzoru (3 wersje XD)
        
        %newImage(nY+1,nX+1) = 1/((x2-x1)*(y2-y1)) * ( fA*(x2-nX)*(y2-nY) + fB*(nX-x1)*(y2-nY) + fC*(nX-x1)*(nY-y1) + fD(x2-nX)*(nY-y1));
        %newImage(nY+1,nX+1) = fA*(1-nX)*(1-nY) + fB*nX*(1-nY) + fC*nX*nY + fD*(1-nX)*nY;
        newImage(nY+1,nX+1) = [1-i i]*[fA fD; fB fC]*[1-j;j];
        
        %nI(jj+1,ii+1) = [1 - i i] * [I(Aj,Ai) I(Dj,Di); I(Bj,Bi) I(Cj,Ci)] * [1 - j; j];
    end
end

%wyświetlamy przeskalowany obraz
figure(3)
imshow(uint8(newImage))
title('dwuliniowa')

%%
%DWUSZESCIENNA

%czscimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obraz
image = double(imread('parrot.bmp'));
%image = double(imread('clock.bmp'));
%image = double(imread('chessboard.bmp'));

%wyświetlamy obraz
figure(1);
imshow(uint8(image))
title('oryginał')

%ustalamy wartość przeskalowanie
xReScale = 3.2;
yReScale = 3.2;
%xReScale = 0.5;
%yReScale = 0.5;
%xReScale = 5;
%yReScale = 5;

%odczytujemy rozmiary oryginalnego obrazu
[origialSizeY,originalSizeX] = size(image);

%wyliczamy rozmiary nowego obrazu
newSizeX = round(originalSizeX*xReScale);
newSizeY = round(origialSizeY*yReScale);

%wyliczamy skok pętli
xStep = originalSizeX/newSizeX;
yStep = origialSizeY/newSizeY;

%inicjalizujemy nowy obraz (same 0 -> czarny prostokąt)
newImage = double(zeros(newSizeY,newSizeX));

%pobieramy macierz A^-1
A1 = getfield(load('a1'),'A1');

%iterujemy po pikselach nowego obrazu
for nX = 0:(newSizeX-1)
    for nY = (0:newSizeY-1)
        
        j = mod(nY*yStep,1);
        i = mod(nX*xStep,1);
        
        %obliczamy współrzędne punktów potrzebne do interpolacji
        x1 = floor(nX*xStep)+1;
        y1 = floor(nY*yStep)+1;
        x2 = x1 + 1;
        y2 = y1 + 1;
        
        %zabezpieczamy się przed wykroczeniem poza obraz
        if x1 > (originalSizeX - 1) 
            x1 = originalSizeX-1;
        end
        if y1 > (origialSizeY-1) 
            y1 = origialSizeY-1;
        end
        if x2 > (originalSizeX - 1) 
            x2 = originalSizeX-1;
        end
        if y2 > (origialSizeY-1) 
            y2 = origialSizeY-1;
        end
        
        %wyliczamy macierz x
        x = [ image(y1,x1); image(y1,x2); image(y2,x1); image(y2,x2); pochodnaX(image,y1,x1); pochodnaX(image,y1,x2); pochodnaX(image,y2,x1); pochodnaX(image,y2,x2); pochodnaY(image,y1,x1); pochodnaY(image,y1,x2); pochodnaY(image,y2,x1); pochodnaY(image,y2,x2); pochodnaXY(image,y1,x1); pochodnaXY(image,y1,x2); pochodnaXY(image,y2,x1); pochodnaXY(image,y2,x2)];
        
        %wyliczmay a
        a = A1*x;
        
        %liczymy sume sum
        tmp = 0;
        for ii = 0:3
            for jj = 0:3
                tmp = tmp + a((jj*4 + ii)+1)*(i^ii)*(j^jj);
            end
        end
        
        %nadajemy wartosc pikselowi
        newImage(nY+1,nX+1) = tmp;
    end
end

%wyświetlamy przeskalowany obraz
figure(4)
imshow(uint8(newImage))
title('dwuszescienna')

%%
%POROWNANIE INTERPOLACJI
%czscimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obraz
image = double(imread('parrot.bmp'));
%image = double(imread('clock.bmp'));
%image = double(imread('chessboard.bmp'));

%wyświetlamy obraz
figure(1);
imshow(uint8(image))
title('oryginał')

%ustalamy wartość przeskalowanie
xReScale = 100;
yReScale = 120;

%newImage = imresize(image,[xReScale yReScale],'bicubic');
newImage = imresize(image,[xReScale yReScale],'bilinear');
%newImage = imresize(image,[xReScale yReScale],'nearest');
figure(5)
imshow(uint8(newImage))
title('imresize')

%%
%ROZDZIELCZOSC DPI
%czscimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obraz
image = imread('lena.bmp');

%przeskalowywujemy obraz i powiekszamy go
newImage = imresize(image,[256 256],'bilinear');
newImage1 = imresize(image,[128 128],'bilinear');
newImage2 = imresize(image,[64 64],'bilinear');

%wyświetlamy wyniki
subplot(1,3,1);
imshow(newImage,'InitialMagnification',200)
subplot(1,3,2);
imshow(newImage1,'InitialMagnification',400)
subplot(1,3,3);
imshow(newImage2,'InitialMagnification',800)

%%
%LICZBA POZIOMÓW JASNOŚCI 
%czscimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obraz
image = imread('lena.bmp');

%przeksalowywujemy obraz
newImage = imresize(image,[128 128],'bilinear');

%zmieniamy odpowiednio poziomy jasnosci 
newImage1 = imadjust(newImage,[0 1], [0 31*1/256]);
newImage2 = imadjust(newImage,[0 1], [0 15*1/256]);
newImage3 = imadjust(newImage,[0 1], [0 7*1/256]);
newImage4 = imadjust(newImage,[0 1], [0 3*1/256]);
newImage5 = imadjust(newImage,[0 1], [0 1*1/256]);

%tysujemy wszystko na jednym wykresie
subplot(2,3,1);
imshow(newImage1,[])
subplot(2,3,2);
imshow(newImage2,[])
subplot(2,3,3);
imshow(newImage3,[])
subplot(2,3,4);
imshow(newImage4,[])
subplot(2,3,5);
imshow(newImage5,[])

