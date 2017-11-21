%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

load MR_data;

%image = I_noisefree;
image = I_noisy1;
%image = I_noisy2;
%image = I_noisy3;
%image = I_noisy4;

subplot(1,4,1); imshow (image,[]);                         title('oryginał');
subplot(1,4,2); imshow(convolution(image,[5 5]),[]);       title('convoution');
subplot(1,4,3); imshow(bilateral(image,[5 5]),[]);       title('bilateral');
subplot(1,4,4); imshow(nlm(image,[5 5]),[]);               title('nlm');