%TOMASZ BOROWICZ

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

load MR_data;

%imshow (I_noisy1);
imshow(convolution(I_noisy1,[5 5]));