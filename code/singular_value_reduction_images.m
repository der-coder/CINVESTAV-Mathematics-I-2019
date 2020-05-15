% 2019-11-05
% Singular Value Reduction on images

% Isaac Ayala Lozano


% Initialization
close all
clc
clear all

% Sample image 

imageSample = zeros(500,500);
imageSample(150:350,150:350) = rand(201);

% Load user images

image01 = imread('image.png');
image02 = imread('image2.jpg');

figure(1)
imshow(image02)

grey01 = double(rgb2gray(image01))/255;
grey02 = double(rgb2gray(image02))/255;


figure(2)
##imshow(imageSample)
imshow(grey02)


##

[u,s,v] = svd(grey02);

imageRecovered = u * s * transpose(v);

##figure(2)
##imshow(imageRecovered)

##imageRecoveredSample = u(:,1:100) * s(1:100,1:100) * transpose(v(:,1:100));

figure(3)
##imshow(imageRecoveredSample)
plot(cumsum(diag(s)/sum(diag(s))))
