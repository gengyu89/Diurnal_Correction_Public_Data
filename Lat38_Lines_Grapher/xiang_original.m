% easy script that split xiang's original data
% created by: Yu Geng
% 2020-04-08

clc
clf
clear all
close all


%% Collect information.

% load original data here
fin = load('./input/200.dat');
fout = './output/u_prime.dat';

% examine output directory
pltdir = './output/';
if ~exist(pltdir, 'dir')
    mkdir(pltdir);
end


%% Saving the data.

disp('Writing...');

% print the 2nd column in a file
fp = fopen(fout, 'w');
fprintf(fp, '%7.1f\n', fin(:,2)');
fclose(fp);

fprintf('Done. File saved as: %s\n', fout);

