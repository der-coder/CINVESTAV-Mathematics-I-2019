% EIGENVALUES AND EIGENVECTORS
% PDP DECOMPOSITION

clear all
close all
clc

% Desired matrix
 A = [0,1,0;0,0,1;4,-17,8]; % Case 1
% A = [0,0,-2;1,2,1;1,0,3]; % Case 2 
% A = [1,0,0;1,2,0;-3,5,2] % Case 3

% Eigenvalues

 lambda = eig(A) % Using eig gives the values in a different order
% lambda = roots(poly(A))

% Obtain D and P

d = eye(3).*lambda

p = zeros(3,3);
 
for i=1:3
  t = lambda(i)*eye(3)-A;
  p(:,i) =  null(t);
endfor

p
p_inv = inv(p)

