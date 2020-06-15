function dat_corr = detrend_sp(fullpath)
%DETREND_SP Subroutine for detrending an sp curve,
%   creating a subplot and saving the data.


%% Calculation.

% load the data
dat_corr = load(fullpath);

% split into vectors
X = dat_corr(:,1); Y = dat_corr(:,2);
sp = dat_corr(:,3);

% calculate new abscissa
sq_sum = (X-X(1)).^2 + (Y-Y(1)).^2;
dist = sqrt(sq_sum);

% detrend the spontaneous potential
sp_corr = detrend(sp);


%% Plot making.

% plot both of them
hold on
plot(dist, sp, '--');
plot(dist, sp_corr);
hold off

% annotate the curves
% legend('Before', 'After', 'Location', 'best');

% label the plot
% xlabel('Distance [m]');
% ylabel('SP [mV]');

% tighten the horizontal axis
xlim([min(dist), max(dist)]);


%% Save the corrected data.

% string replacement
dirshift = strrep(fullpath, '/input/', '/output/');
new_file = strrep(dirshift, '.raw', '.cor');

% create the file
fp = fopen(new_file, 'w');

% start writing data
dat_corr = [X, Y, sp_corr];  % save original coords, not the distance
fprintf(fp, '%6d%9d%8.2f\n', dat_corr');  % see *.TTT files for the format

% close the file
fclose(fp);

% report to the command window
fprintf('File saved as: %s\n', new_file);  % single carriage


end

