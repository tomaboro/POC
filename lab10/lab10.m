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


%%
close all;
clearvars;
clc;

image = imread('umbrealla.png');
imshow(image);

image = double(rgb2hsv(image));
imageH = image(:,:,1);
[Y X] = size(imageH);

global sTh window_min_size segRes MRes index;
sTh = 0.05;
window_min_size = 8;
segRes = zeros(Y,X);
MRes = zeros(Y,X);
index = 0;

split(imageH,1,1,Y,X);

i = 0;

while i < index
    IB = segRes == i;
    if size(IB(:)) == 0 
       i = i + 1;
       continue;
    end
    [yF xF] = find(IB,1,'first');
    IB_dilate = imdilate(IB,strel('square',3));
    IB_diff = imabsdiff(IB_dilate,IB);
    IB_mult = IB_diff.* segRes;
    IB_mult_non_zeros = nonzeros(IB_mult);
    IB_unique = unique(IB_mult_non_zeros);
    joined = 0;
    for k = 1:numel(IB_unique)
        IBS = segRes == IB_unique(k);
        [yFS, xFS] = find(IBS,1,'first');        
        color_difference = abs(MRes(yF,xF) - MRes(yFS, xFS));
        if color_difference < (5/255)
            segRes(IBS) = i;
            joined = 1;
        end
    end
        if joined == 0
            i = i+1;
        end
end

segRes_for = segRes;
MRes_for = MRes;

segRes_unique = unique(segRes);
for i = 1:numel(segRes_unique)
    obszar = segRes == segRes_unique(i);
    if sum(obszar) < 33
        segRes(obszar) = 0;
    end
end

segRes_unique_2 = unique(segRes);
for i = 1:numel(segRes_unique_2)
    obszar = segRes == segRes_unique_2(i);
    segRes(obszar) = i;
end

Img_final = label2rgb(segRes);

subplot(1,2,1); 
subplot(1,2,2); imshow(Img_final,[]);