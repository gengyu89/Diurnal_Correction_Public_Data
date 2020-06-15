% script for remaking the plots of BC area (N45)
% created by: Yu Geng
% 2020-01-05

clc
clf
clear all
close all


%% Preparation.

% set paths to dependencies
addpath(fullfile(pwd, 'functions'));

% read the datasets
dat_1 = load('contrast.dat');
dat_2 = load('contrast_comprehensive.dat');

% you can also try 'contrast_diurnal.dat'
% and 'contrast_detrending.dat'

% create output directory
pltdir = './remake/';
if ~exist(pltdir, 'dir')
    mkdir(pltdir);
end


%% Plotting.

disp('Plotting...');

% initialize line width
set(0, 'DefaultLineLineWidth', 1.5)

% plot the 1st dataset
plt_contour(pltdir, 'before', dat_1, true);  % in both languages
plt_contour(pltdir, 'before', dat_1, false); % in English only

% plot the 2nd dataset
plt_contour(pltdir, 'after', dat_2, true);  % in both languages
plt_contour(pltdir, 'after', dat_2, false); % in English only

% restore default width
set(0, 'DefaultLineLineWidth', 0.5)

