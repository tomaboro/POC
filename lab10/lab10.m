%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

image = imread('knee.png');
imshow(image);

%%

ginput(1);

%%

selected = [347,195];
image = double(image);

[Y X] = size(image);

visited = zeros(Y,X);
segmented = zeros(Y,X);
stack = zeros(10000,2);
iStack = 1;

stack(1,:) = selected;
visited(selected(1), selected(2)) = 1;
segmented(selected(1), selected(2)) = 1;

while iStack > 0
   nY = stack(iStack,1);
   nX = stack(iStack,2);
   iStack = iStack - 1;
   if((nY-1 >= 1) && (nY+1 <= Y) && (nX-1 >= 1) && (nX+1 <= X))
       for J = nY-1:nY+1
           for I = nX-1:nX+1
               length = abs(image(nY,nX) - image(J,I));
               if (length < 10) && (visited(J,I) == 0)
                    iStack = iStack+1;
                    stack(iStack,:) = [J,I];
                    segmented(J,I) = 1;
               end
               visited(J,I) = 1;
           end
       end
   end
end
    
imshow(uint8(segmented),[]);

%%
selected = [347,195];
image = double(image);

[Y X] = size(image);

visited = zeros(Y,X);
segmented = zeros(Y,X);
stack = zeros(10000,2);
iStack = 1;
mV = 0;
nS = 0;

stack(1,:) = selected;
visited(selected(1), selected(2)) = 1;
segmented(selected(1), selected(2)) = 1;

while iStack > 0
   nY = stack(iStack,1);
   nX = stack(iStack,2);
   iStack = iStack - 1;
   nS = nS+1;
   mV = (mV*(nS-1) + image(nY,nX))/nS;
   if((nY-1 >= 1) && (nY+1 <= Y) && (nX-1 >= 1) && (nX+1 <= X))
       for J = nY-1:nY+1
           for I = nX-1:nX+1
               length = abs(mV - image(J,I));
               if (length < 20) && (visited(J,I) == 0)
                    iStack = iStack+1;
                    stack(iStack,:) = [J,I];
                    segmented(J,I) = 1;
               end
               visited(J,I) = 1;
           end
       end
   end
end

gauss = fspecial('gaussian');
segmented = imfilter(uint8(segmented),gauss);
    
imshow(segmented,[]);