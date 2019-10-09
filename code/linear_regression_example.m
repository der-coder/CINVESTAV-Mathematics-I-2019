clear all
clc
close all

data = csvread("data.csv"); % Import the data

heights= data(:,1);
weights = data(:,2); % Store weight as the output of the system

A(:,1)= data(:,1); % Store height as input
A(:,2) = ones(length(data),1); % Add an extra column 
                               %because the model is m x + b

A_pseudo = inv(transpose(A)*A)*transpose(A); % Get the pseudo inverse

x_tilde = A_pseudo * weights % Get the values for m and and b for the model

weight_approx = A*x_tilde;

figure(3)
plot(data(:,1),data(:,2),'+b',heights,weight_approx,'r')
xlabel('Height: [m]')
ylabel('Weight: [m]')
title('Linear regression for weight')
legend('Original data','Linear regression')