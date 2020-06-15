% script for converting (x,y) locations into
% distances from the starting point created by: Yu Geng
% 2020-01-15

clc
clf
clear all
close all


%% Collect information.

format shortG

% load coordinates
dat = load('./input/s100.xy');
X = dat(:,1); Y = dat(:,2);

% calculate 2-norm
sq_sum = (X-X(1)).^2 + (Y-Y(1)).^2;
dist = sqrt(sq_sum);

% show locations of measuring points
fig = figure;

scatter(X, Y, '.');
xlabel('X'); ylabel('Y');
axis('equal');

title('Survey Line S100');

% examine output directory
pltdir = './output/';
if ~exist(pltdir, 'dir')
    mkdir(pltdir);
end


%% Saving the data.

disp('Saving...');

% write to an output file
filename = './output/dist.dat';

fp = fopen(filename, 'w');
fprintf(fp, '%12.5f\n', dist');  % transpose
fclose(fp);

fprintf('Done. File saved as: %s\n\n', filename);

