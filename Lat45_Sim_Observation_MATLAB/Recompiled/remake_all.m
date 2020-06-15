% script for remaking figures from BYTG (N45)
% created by: Yu Geng
% 2020-01-05

clc
clf
clear all
close all


%% Collect info.

% reload geoelectric data
Te = [10.75, 11, 11.25, 11.5, 11.75, 12, 12.25, 12.5, 12.75, 13, 13.25, 13.5, 13.75, 14, 14.25, 14.5, 14.75, 15, 15.25, 15.5, 15.75, 16, 16.25, 16.5, 16.75, 17, 17.25, 17.5, 17.75, 18, 18.25, 18.5, 18.75, 19, 19.25, 19.5, 19.75, 20, 20.25, 20.5, 20.75, 21, 21.25, 21.5, 21.75, 22, 22.25, 22.5, 22.75, 23, 23.25, 23.5, 23.75, 24, 24.25, 24.5, 24.75, 25, 25.25, 25.5, 25.75, 26, 26.25, 26.5, 26.75, 27, 27.25, 27.5, 27.75, 28, 28.25, 28.5, 28.75, 29, 29.25, 29.5, 29.75, 30, 30.25, 30.5, 30.75, 31, 31.25, 31.5, 31.75, 32, 32.25, 32.5, 32.75, 33, 33.25, 33.5, 33.75, 34, 34.25, 34.5, 34.75, 35, 35.25, 35.5, 35.75, 36];
V12 = [-1.6079, -0.105, 0.5979, 0.7009, 0.9038, 0.6067, 1.1096, 1.4125, 1.8154, 1.7183, 1.7212, 1.8242, 1.7271, 1.63, 1.3329, 1.3358, 1.4387, 1.3416, 1.0445, 1.1475, 1.0504, 0.7533, 0.7562, 0.5591, 0.662, 0.6649, 0.5678, 0.3708, 0.3737, 0.1766, 0.1795, 0.1824, 0.1853, 0.1882, 0.0911, 0.1941, 0.197, 0.2999, 0.1028, 0.0057, 0.0086, 0.2115, 0.0144, 0.2174, 0.1203, 0.0232, 0.0261, -0.071, -0.0681, -0.0652, -0.0623, -0.0593, -0.0564, -0.1535, -0.1506, 0.0523, -0.1448, -0.1419, -0.239, -0.136, -0.3331, -0.0302, -0.3273, -0.1244, -0.3215, -0.3186, -0.3157, -0.4127, -0.1098, -0.4069, -0.904, -0.4011, -0.1982, -0.2953, -0.3924, -0.1894, -0.4865, -0.4836, -0.6807, -0.9778, -0.5749, -0.572, -0.4691, -0.5661, -0.4632, -0.5603, -0.4574, -0.6545, -0.9516, -0.8487, -0.8458, -0.9428, -0.7399, -0.937, -1.0341, -1.2312, -1.3283, -2.1254, -1.4225, -1.2195, -1.5166, -1.4137];
V13 = [-0.9794, 0.4197, 0.5187, 1.4177, 1.5167, 1.7158, 2.1148, 2.4138, 2.3129, 2.4119, 2.3109, 2.1099, 2.009, 1.908, 1.707, 1.7061, 1.5051, 1.2041, 0.9032, 0.6022, 0.6012, 0.3002, 0.2993, -0.2017, -0.2027, -0.5036, -0.6046, -0.6056, -0.4066, -1.1075, -1.0085, -0.8095, -0.3104, -0.3114, -0.3124, -0.3134, -0.3143, -0.5153, -0.1163, -0.2172, -0.6182, -0.4192, -0.6201, -0.5211, -0.6221, -0.3231, -0.324, -0.425, -0.626, -0.1269, -0.6279, -0.4289, -0.5299, -0.5308, -0.5318, -0.4328, -0.5337, -0.5347, -0.5357, -0.5367, -0.5376, -0.5386, -0.5396, -0.2405, -0.1415, -0.2425, -0.1434, -0.2444, -0.3454, -0.3464, -1.0473, -0.2483, -0.3493, -0.1502, -0.4512, -0.0522, -0.5532, -0.3541, -0.6551, -1.6561, -0.557, -1.258, -1.059, -0.86, -1.2609, -0.9619, -0.4629, -0.7638, -0.7648, -0.7658, 0.3333, -0.0677, 0.1313, -0.3697, -0.1706, 0.3284, 0.5274, -0.2735, 1.1255, 0.9245, 0.6235, 1.1226];
E = [0.0195837, 0.00426132, 0.00813213, 0.0157603, 0.0176914, 0.0180058, 0.0238385, 0.0280075, 0.0297524, 0.0298572, 0.0290992, 0.0283301, 0.0269038, 0.025477, 0.0219107, 0.0219239, 0.0212332, 0.0184962, 0.0141884, 0.0135367, 0.0126124, 0.00852147, 0.00854734, 0.00625624, 0.00730357, 0.0086131, 0.0084524, 0.00712165, 0.00562294, 0.0110139, 0.010065, 0.00816579, 0.00362255, 0.00364756, 0.00321057, 0.0036985, 0.00372304, 0.00596974, 0.001578, 0.00212935, 0.00605886, 0.00468165, 0.00607871, 0.00560399, 0.00622874, 0.00317585, 0.00318717, 0.00423253, 0.00617707, 0.00142325, 0.00618867, 0.00424998, 0.00522727, 0.00545099, 0.00545123, 0.0042775, 0.00545135, 0.00545216, 0.00583075, 0.00545409, 0.00634519, 0.00528785, 0.00632745, 0.00270165, 0.00368418, 0.00413383, 0.00363437, 0.00499338, 0.00357992, 0.00549411, 0.0140515, 0.00490452, 0.00401808, 0.00346344, 0.00607505, 0.00207485, 0.00748777, 0.00619691, 0.00966643, 0.0192654, 0.00818826, 0.0137426, 0.011511, 0.0103512, 0.0132991, 0.0111463, 0.00664525, 0.0102132, 0.0125793, 0.0117263, 0.00955518, 0.0100314, 0.00795997, 0.010587, 0.0111053, 0.0134616, 0.0150194, 0.0227233, 0.018701, 0.0158021, 0.0172216, 0.0186089];

% reload geomagnetic data
Tm = [6.66667, 7, 7.33333, 7.66667, 8, 8.33333, 8.66667, 9, 9.33333, 9.66667, 10, 10.3333, 10.6667, 11, 11.3333, 11.6667, 12, 12.3333, 12.6667, 13, 13.3333, 13.6667, 14, 14.3333, 14.6667, 15, 15.3333, 15.6667, 16, 16.3333, 16.6667, 17, 17.3333, 17.6667, 18, 18.3333, 18.6667, 19, 19.3333, 19.6667, 21.3333, 21.6667, 22, 22.3333, 22.6667, 23, 23.3333, 23.6667, 24, 24.3333, 24.6667, 25, 25.3333, 25.6667, 26, 26.3333, 26.6667, 27, 27.3333, 27.6667, 28, 28.3333, 28.6667, 29, 29.3333, 29.6667, 30, 30.3333, 30.6667, 31, 32.3333, 32.6667, 33, 33.3333, 33.6667, 34, 34.3333, 34.6667, 35, 35.3333, 35.6667];
nT = [10.53, 8.3, 4.92, 2.22, -1.83, -4.74, -7.79, -12.47, -14.96, -17.52, -21.15, -21.39, -20.35, -20.62, -23.29, -22.63, -24.1, -23.13, -20.74, -16.65, -14.01, -6.15, -2.59, 1.47, 10.49, 16.19, 13.39, 14.11, 8.17, 11.84, 6.81, 12.18, 7.83, 7.92, 3.43, 2.25, 5.41, 4.73, 0.72, -0.24, 22.08, 15.07, 13.96, 10.06, 12.44, 12.38, 13.21, 13.77, 15.13, 12.91, 12.83, 12.03, 16.07, 10.73, 9.52, 9.62, 8.11, 11.89, 13.66, 15.65, 12.26, 11.54, 11.92, 12.51, 13.69, 16.03, 15.52, 15.25, 7.52, 6.59, -4.54, -11.18, -21.08, -20.89, -25.26, -35.01, -34.64, -26.75, -21.95, -19.69, -19.13];

% examine output directory
pltdir = './remake/';
if ~exist(pltdir, 'dir')
    mkdir(pltdir);
end


%% Start making plots.

% initialize line width
set(0, 'DefaultLineLineWidth', 1.5)

disp('Plotting potential differences...');

plt_potential(pltdir, Te, V12, V13, true);  % in both languages
plt_potential(pltdir, Te, V12, V13, false); % in English only

disp('Plotting comparisons...');

plt_comparison(pltdir, Te, E, Tm, nT, true);  % in both languages
plt_comparison(pltdir, Te, E, Tm, nT, false); % in English only

% restore default width
set(0, 'DefaultLineLineWidth', 0.5)

