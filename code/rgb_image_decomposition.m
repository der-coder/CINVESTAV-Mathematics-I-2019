% RECONSTRUCTION OF IMAGES
% SINGULAR VALUE DECOMPOSITION

close all
clc
clear all

% READ IMAGE FILE
image = imread("DSC_1798.JPG", "PixelRegion",{[601 900],[1001 1500]});


% SPLIT INTO RGB CHANNELS
% SCALE RGB CHANNELS TO [0 1] INTERVAL
imageR = im2double(image(:,:,1));
imageG = im2double(image(:,:,2));
imageB = im2double(image(:,:,3));

[u_R, s_R, v_R] = svd(imageR);
[u_G, s_G, v_G] = svd(imageG);
[u_B, s_B, v_B] = svd(imageB);

% PLOT THE RGB CHANNELS

figure(1)
imshow(image)

figure(2)
subplot(3,1,1, "align")
plot(cumsum(diag(s_R)/sum(diag(s_R))))
subplot(3,1,2, "align")
plot(cumsum(diag(s_G)/sum(diag(s_G))))
subplot(3,1,3, "align")
plot(cumsum(diag(s_B)/sum(diag(s_B))))
ylim([0 1])

r = 2;
c = 2;

figure(3)
subplot(r,c,1, "align")
double2rgb(imageR, imageG, imageB, 1, image)

subplot(r,c,2, "align")
double2rgb(imageR, imageG, imageB, 50, image)

subplot(r,c,3, "align")
double2rgb(imageR, imageG, imageB, 200, image)

subplot(r,c,4, "align")
double2rgb(imageR, imageG, imageB, 300, image)

