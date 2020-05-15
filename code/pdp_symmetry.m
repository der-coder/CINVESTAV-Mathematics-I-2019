% EIGENVALUES AND EIGENVECTORS
% PDP DECOMPOSITION

clear all
close all
clc

% Desired matrix
 A = [4,2,2;2,4,2;2,2,4]; %

% Eigenvalues

 lambda = eig(A) % Using eig gives the values in a different order
% lambda = roots(poly(A))

% Obtain D and P

d = eye(3).*lambda

p = zeros(3,3);
 
for i=1:3
  t = lambda(i)*eye(3)-A;
  p(:,i) =  null(t); % This will fail because there are repeated eigenvalues
endfor

p
p_inv = inv(p)

