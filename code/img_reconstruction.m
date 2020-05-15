clc
close all
clear all

pkg load image

load YaleBdatabase_cropped.mat;

data = Yale12_cut;

original = reshape(data,192,168,1,64);

matrix = reshape(data,192*168, 64);

[u, s, v] = svds(matrix);

reduction = u(:,1:3) * s(1:3,1:3) * transpose(v(:,1:3));

reduction = reshape(reduction, 192,168,1,64);

b = -min(u(:))/(max(u(:))-min(u(:)));
m = 1/(max(u(:))-min(u(:)));

u_new = m*u+b;

light = reshape(u_new,192,168,1,6);

v_mean = mean(v);

temp2 = u * s * transpose(v_mean);

construction = reshape(temp2,192,168);

figure(1)
montage(original)
title("Original","fontsize",32)
%%print("original.png","-S1728,1344")

figure(2)
montage(reduction)
title("Dimensionality Reduction","fontsize",32)
%%print("reconstructed.png","-S1728,1344")

figure(3)
plot(cumsum(diag(s)/sum(diag(s))),"k","LineWidth",3)
set(gca, 'FontSize', 30);
title("Cumulative sum of singular values","fontsize",32)
xlabel('Vectors','fontsize',28);
ylabel('Accuracy','fontsize',28);


%%print("cumsum.png","-S1080,1080")

figure(4)
imshow(construction)
##title("New image from the average of V","fontsize",32)
%%print("constructed.png","-S1728,1344")

figure(5)
montage(light)
title("Lighting", 'fontsize',32)
%%print("lighting.png","-S1728,1344")

figure(6)
montage(reshape(u*s,192,168,1,6))
title("U*Σ", 'fontsize', 100)
%%print("sigma.png","-S1728,1344")
