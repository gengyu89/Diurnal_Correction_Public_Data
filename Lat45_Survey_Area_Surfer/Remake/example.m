clc
clear all
close all

[X,Y,Z] = peaks;
v = [1];
contour(X,Y,Z,v, 'ShowText', 'on')

% "v = [1];" is equivalent to "v = 1;"
% and the outcome is to show one contour line
% See https://ww2.mathworks.cn/help/matlab/ref/contour.html
