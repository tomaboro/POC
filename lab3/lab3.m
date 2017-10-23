%TOMASZ BOROWICZ
%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%ładujemy funkcje z pliku
load funkcjeLUT;

image = imread('jet.bmp');
%image = imread('lena.bmp');

%rysujemy wykresy dla roznych funkcji 
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

%ładujemy obrazki
jet = imread('jet.bmp');
lena = imread('lena.bmp');

%dodajemy obrazki do siebie
sum = imadd(lena,jet);
%dodajemy obrazki ale zwiększamy bity na liczbę (mniej bitów o wartości
%maxymalnej)
sum16 = imadd(lena,jet,'uint16');

%wyświetlamy efekty dodawania
figure(1);
subplot(1,2,1);
imshow(sum);
title('uint8');
subplot(1,2,2);
imshow(sum16,[]);
title('uint16');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obrazki
jet = imread('jet.bmp');
lena = imread('lena.bmp');

%konwertujemy obrazki (uint8 na int16 -> pojawiaja sie wartosci ujemne)
lena16 = int16(lena);
jet16 = int16(jet);

%odejmujemy obrazki
sub = imsubtract(lena,jet);
%zwiekszenie zakresow kazdego bita daje lepsze efekty
sub16 = imsubtract(lena16,jet16);
diff = imabsdiff(lena,jet);

%wyświetlamy efekty odejmowania
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
%czyścimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obrazki
jet = imread('jet.bmp');
lena = imread('lena.bmp');

%przemnażamy obrazki przez siebie (nie ma sensu)
multi = immultiply(lena,jet);
%przemnażamy obraz przez stałą (rozjaśniamy/przyciemniamy)
multiConst = immultiply(lena,3);
%nakładamy maskę na obraz przez odpowiedznie mnozenie
maska = boolean(imread('kolo.bmp'));

%wyświetlamy efekty 
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
%czyścimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obraz
lena = imread('lena.bmp');

%robimy negatyw obrazu
compl = imcomplement(lena);

%wyświetlamy efekt
figure(4);
imshow(compl,[]);
title('imcomplement');

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obrazki
kolo = boolean(imread('kolo.bmp'));
kwadrat = boolean(imread('kwadrat.bmp'));

%wykonujemy różne operacje logiczne na obrazkach i wyświetlamy efekty
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

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

%wczytujemy obraz i konwertujemy go do skali szarosci
lena = rgb2gray(imread('100zloty.jpg'));

%inicjalizujemy wektor obrazow bitowych
[Y,X] = size(lena);

%tworzymy binarne obrazy
lenaBin1 = createBinaryImage(lena,Y,X,1);
lenaBin2 = createBinaryImage(lena,Y,X,2);
lenaBin3 = createBinaryImage(lena,Y,X,3);
lenaBin4 = createBinaryImage(lena,Y,X,4);
lenaBin5 = createBinaryImage(lena,Y,X,5);
lenaBin6 = createBinaryImage(lena,Y,X,6);
lenaBin7 = createBinaryImage(lena,Y,X,7);
lenaBin8 = createBinaryImage(lena,Y,X,8);

%wyświetlamy oryginał i obrazy binarne
figure(1);
subplot(5,2,1:2);
imshow(lena);
title('oryginal');
subplot(5,2,3);
imshow(lenaBin1);
title('bit 1');
subplot(5,2,4);
imshow(lenaBin2);
title('bit 2');
subplot(5,2,5);
imshow(lenaBin3);
title('bit 3');
subplot(5,2,6);
imshow(lenaBin4);
title('bit 4');
subplot(5,2,7);
imshow(lenaBin5)
title('bit 5')
subplot(5,2,8);
imshow(lenaBin6);
title('bit 6');
subplot(5,2,9);
imshow(lenaBin7);
title('bit 7');
subplot(5,2,10);
imshow(lenaBin8);
title('bit 8');

%%
%PRZED URUCHOMIENIEM TEJ SEKCJI UPEWNIJ SIE, ŻE URUCHOMIONO SEKCJE TWORZACA
%OBRAY BINARNE

figure(2);

%odtwarzanie zaczynamy od pustego obrazu (same 0 -> czarny obraz)
currImage = zeros(Y,X);
subplot(5,2,1);
imshow(currImage);
title('step 0');

%zaczynamy odtwarzanie obrazu od bitu 8 
%w efekcie z kolejnymi bitami dodajemy coraz wiecej szczegolow
currImage = recreateImage(currImage,lenaBin8,Y,X,8);
subplot(5,2,2);
imshow(currImage);
title('step 1');

currImage = recreateImage(currImage,lenaBin7,Y,X,7);
subplot(5,2,3);
imshow(currImage);
title('step 2');

currImage = recreateImage(currImage,lenaBin6,Y,X,6);
subplot(5,2,4);
imshow(currImage);
title('step 3');

currImage = recreateImage(currImage,lenaBin5,Y,X,5);
subplot(5,2,5);
imshow(currImage);
title('step 4');

currImage = recreateImage(currImage,lenaBin4,Y,X,4);
subplot(5,2,6);
imshow(currImage);
title('step 6');

currImage = recreateImage(currImage,lenaBin3,Y,X,3);
subplot(5,2,7);
imshow(currImage);
title('step 7');

currImage = recreateImage(currImage,lenaBin2,Y,X,2);
subplot(5,2,8);
imshow(currImage);
title('step 8');

currImage = recreateImage(currImage,lenaBin1,Y,X,1);
subplot(5,2,9:10);
imshow(currImage);
title('final effect');

%%
%PRZED URUCHOMIENIEM TEJ SEKCJI UPEWNIJ SIE, ŻE URUCHOMIONO SEKCJE TWORZACA
%OBRAY BINARNE
figure(3);

%odtwarzanie zaczynamy od pustego obrazu (same 0 -> czarny obraz)
currImage = zeros(Y,X);
subplot(5,2,1);
imshow(currImage);
title('step 0');

%odtwarzamy od 1 bitu czyli od najwiekszych szczegolow
currImage = recreateImage(currImage,lenaBin1,Y,X,1);
subplot(5,2,2);
imshow(currImage);
title('step 1');

currImage = recreateImage(currImage,lenaBin2,Y,X,2);
subplot(5,2,3);
imshow(currImage);
title('step 2');

currImage = recreateImage(currImage,lenaBin3,Y,X,3);
subplot(5,2,4);
imshow(currImage);
title('step 3');

currImage = recreateImage(currImage,lenaBin4,Y,X,4);
subplot(5,2,5);
imshow(currImage);
title('step 4');

currImage = recreateImage(currImage,lenaBin5,Y,X,5);
subplot(5,2,6);
imshow(currImage);
title('step 6');

currImage = recreateImage(currImage,lenaBin6,Y,X,6);
subplot(5,2,7);
imshow(currImage);
title('step 7');

currImage = recreateImage(currImage,lenaBin7,Y,X,7);
subplot(5,2,8);
imshow(currImage);
title('step 8');

currImage = recreateImage(currImage,lenaBin8,Y,X,8);
subplot(5,2,9:10);
imshow(currImage);
title('final effect');