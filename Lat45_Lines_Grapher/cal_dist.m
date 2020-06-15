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
dat = load('coord.xy');
X = dat(:,1); Y = dat(:,2);

% calculate 2-norm
sq_sum = (X-X(1)).^2 + (Y-Y(1)).^2;
dist = sqrt(sq_sum);

% show locations of measuring points
fig = figure;

scatter(X, Y, '.');
xlabel('X'); ylabel('Y');
axis('equal');
% text(X(1), Y(1), '\leftarrow Starting point');

title('Survey Line N800');


%% Save the output.

disp('Saving...');

% write to an output file
filename = 'dist';

fp = fopen('dist', 'w');
fprintf(fp, '%12.6f\n', dist');  % transpose
fclose(fp);

fprintf('Done. File saved as: %s\n\n', filename);

