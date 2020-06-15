% script that attempt to correct sp curves using "detrending" approach
% created by: Yu Geng
% 2020-01-08

clc
clf
clear all
close all


%% Collect info.

% set paths to dependencies
addpath(fullfile(pwd, 'functions'));
e100_raw = './input/e100.raw';
e110_raw = './input/e110.raw';
e120_raw = './input/e120.raw';
e130_raw = './input/e130.raw';
e140_raw = './input/e140.raw';
n200_raw = './input/n200.raw';

% examine output directory
pltdir = './output/';
if ~exist(pltdir, 'dir')
    mkdir(pltdir);
end


%% Correct the SP curves.

% initialize line width
set(0, 'DefaultLineLineWidth', 1.5)

% create a new window
fig = figure;
fullpath = './remake/detrended.png';

% increase the window size
set(gcf, 'Position', [100 100 500 500])

disp('Correcting...');

% time the computation section
tic();

% start plotting stuffs
subplot(3,2,1)
e100_cor = detrend_sp(e100_raw);
title('E100');

subplot(3,2,2)
e110_cor = detrend_sp(e110_raw);
title('E110');

subplot(3,2,3)
e120_cor = detrend_sp(e120_raw);
title('E120');

subplot(3,2,4)
e130_cor = detrend_sp(e130_raw);
title('E130');

subplot(3,2,5)
e140_cor = detrend_sp(e140_raw);
title('E140');

subplot(3,2,6)
n200_cor = detrend_sp(n200_raw);
title('N200');

% stop the timer
toc();

% save the big plot
saveas(fig, fullpath);
fprintf('Done. File saved as: %s\n\n', fullpath);

% restore default width
set(0, 'DefaultLineLineWidth', 0.5)


%% Combine the corrected data and save it.

% construct a matrix
all_cor = [e100_cor; e110_cor; e120_cor; ...
    e130_cor; e140_cor; n200_cor];

% create a new file
new_file = 'contrast_detrending.dat';
fp = fopen(new_file, 'w');

% start writing the data
fprintf(fp, '%6d%9d%8.2f\n', all_cor');  % format adopted from *.TTT files

% close the file
fclose(fp);

% report to the command window
fprintf('Done. File saved as: %s\n\n', new_file);

