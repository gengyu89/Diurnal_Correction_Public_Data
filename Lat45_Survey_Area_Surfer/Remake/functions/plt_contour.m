function plt_contour(pltdir, flag, dat, bilingual)
%PLT_CONTOUR Subroutine for creating
%   SP contour maps (including survey points)
% 
% flag
%   - provide 'before' or 'after'
% 


%% Create interpolant.

% split data into vectors
x = dat(:,1); y = dat(:,2);
u = dat(:,3);

% shift all coordinates with the origin
margin = 100;
org_x = min(x)-margin;
org_y = min(y)-margin;  % define the origin
x = x - org_x; y = y - org_y;

% define the starting point
% of each survey line
% lab = [313166, 4947499; ...
%     312908, 4948037; ...
%     312658, 4948593; ...
%     312418, 4949131; ...
%     312172, 4949674; ...
%     314628, 4947718];

% define the last point
% of each survey line
lab = [315779, 4948663; ...
    315529, 4949197; ...
    315293, 4949735; ...
    315048, 4950274; ...
    314790, 4950816; ...
    313368, 4950448];

% shift them by the origin
lab_x = lab(:,1); lab_y = lab(:,2);
lab_x = lab_x - org_x;
lab_y = lab_y - org_y;

% calculate new axes
dh = 10;  % in meters
gx = min(x)-margin : dh : max(x)+margin;
gy = min(y)-margin : dh : max(y)+margin;

% prepare meshgrids
[X, Y] = meshgrid(gx, gy);

% create interpolant
Fu = scatteredInterpolant(x, y, u, 'natural');
Cu = Fu(X(:,:,1), Y(:,:,1));


%% Start plotting.

% create a new window
fig = figure;
colormap(flipud(jet));  % show + as blue and - as red

% obtain new colormap
% new_cmap = brewermap([],'Spectral');
% colormap(new_cmap);

% adjust window properties
if bilingual
    filename = ['area_', flag, '_chs.png'];
else
    filename = ['area_', flag, '_eng.png'];
end
fullpath = [pltdir, filename];

% plot a smoothed surface
hold on
pcolor(X, Y, Cu);
shading interp

% contour the sp values
v = -1.5;  % used for delineating the anomaly
ctrcolor = repmat(0.5, 1,3);  % 0.5 for gray; 1.0 for white
[M,c] = contour(X, Y, Cu, repmat(v,1,2), 'color', ctrcolor);
% c.LineWidth = 1.5;

% plot measuring points
scatter(x, y, '+');
% legend('Survey Points', 'Location', 'best');
hold off

% label the axes
if bilingual
    xlabel({'东西向坐标/m', 'West-East coordinate/m'});
    ylabel({'南北向坐标/m', 'South-North coordinate/m'});
else
    xlabel('West-East coordinate [m]');
    ylabel('South-North coordinate [m]');
end

% specify aspect ratio
axis('equal');

% show color scale
cb = colorbar;
title(cb, 'mV');

% tighten the plot
axis('tight');

% finer adjustments
grid on; box on;
% set(gca, 'layer', 'top');

% hide tick values
% (without hiding the axis labels)
% set(gca, 'xtick', [], 'ytick', []);

% label the starting point
% of each survey line

% with arrow, black texts
% text(lab_x(1), lab_y(1), '\leftarrow E100');
% text(lab_x(2), lab_y(2), '\leftarrow E110');
% text(lab_x(3), lab_y(3), '\leftarrow E120');
% text(lab_x(4), lab_y(4), '\leftarrow E130');
% text(lab_x(5), lab_y(5), '\leftarrow E140');
% text(lab_x(6), lab_y(6), '\leftarrow N200');

% shift with an offset, white texts
% dX = -50; dY = 250;  % x and y offsets
% txtcolor = repmat(1.0, 1,3);  % 0.5 for gray; 1.0 for white
% text(lab_x(1)+dX, lab_y(1)+dY, 'E100', 'Color', txtcolor);
% text(lab_x(2)+dX, lab_y(2)+dY, 'E110', 'Color', txtcolor);
% text(lab_x(3)+dX, lab_y(3)+dY, 'E120', 'Color', txtcolor);
% text(lab_x(4)+dX, lab_y(4)+dY, 'E130', 'Color', txtcolor);
% text(lab_x(5)+dX, lab_y(5)+dY, 'E140', 'Color', txtcolor);
% text(lab_x(6)+dX, lab_y(6)+dY, 'N200', 'Color', txtcolor);

% with text boxes
% bg_color = repmat(1.0, 1,3);
% text(lab_x(1), lab_y(1), 'E100', 'BackgroundColor', bg_color);
% text(lab_x(2), lab_y(2), 'E110', 'BackgroundColor', bg_color);
% text(lab_x(3), lab_y(3), 'E120', 'BackgroundColor', bg_color);
% text(lab_x(4), lab_y(4), 'E130', 'BackgroundColor', bg_color);
% text(lab_x(5), lab_y(5), 'E140', 'BackgroundColor', bg_color);
% text(lab_x(6), lab_y(6), 'N200', 'BackgroundColor', bg_color);

% label the last point
% of each survey line

% determine text color
if strcmp(flag, 'before')
    txtcolor = repmat(1.0, 1,3);
else
    txtcolor = repmat(0.0, 1,3);
end

% shift with an offset, gray texts
dX = -200; dY = 0;  % x and y offsets
FS = 10.5;  % font size
text(lab_x(1)+dX, lab_y(1)+dY, 'E100', 'HorizontalAlignment', 'right', 'Color', txtcolor, 'FontSize', FS);
text(lab_x(2)+dX, lab_y(2)+dY, 'E110', 'HorizontalAlignment', 'right', 'Color', txtcolor, 'FontSize', FS);
text(lab_x(3)+dX, lab_y(3)+dY, 'E120', 'HorizontalAlignment', 'right', 'Color', txtcolor, 'FontSize', FS);
text(lab_x(4)+dX, lab_y(4)+dY, 'E130', 'HorizontalAlignment', 'right', 'Color', txtcolor, 'FontSize', FS);
text(lab_x(5)+dX, lab_y(5)+dY, 'E140', 'HorizontalAlignment', 'right', 'Color', txtcolor, 'FontSize', FS);
text(lab_x(6)+0.5*dX, lab_y(6)+dY, 'N200', 'HorizontalAlignment', 'right', 'Color', txtcolor, 'FontSize', FS);

% shift with an offset, with text boxes
% dX = -200; dY = 0;  % x and y offsets
% bg_color = repmat(1.0, 1,3);
% text(lab_x(1)+dX, lab_y(1)+dY, 'E100', 'HorizontalAlignment', 'right', 'BackgroundColor', bg_color);
% text(lab_x(2)+dX, lab_y(2)+dY, 'E110', 'HorizontalAlignment', 'right', 'BackgroundColor', bg_color);
% text(lab_x(3)+dX, lab_y(3)+dY, 'E120', 'HorizontalAlignment', 'right', 'BackgroundColor', bg_color);
% text(lab_x(4)+dX, lab_y(4)+dY, 'E130', 'HorizontalAlignment', 'right', 'BackgroundColor', bg_color);
% text(lab_x(5)+dX, lab_y(5)+dY, 'E140', 'HorizontalAlignment', 'right', 'BackgroundColor', bg_color);
% text(lab_x(6)+0.5*dX, lab_y(6)+dY, 'N200', 'HorizontalAlignment', 'right', 'BackgroundColor', bg_color);

% You may also want to introduce 'EdgeColor'
% Instructions:
%   https://stackoverflow.com/questions/14262354/textbox-in-matlab-plot
%   http://www.ece.northwestern.edu/local-apps/matlabhelp/techdoc/ref/text_props.html

% save the plot
saveas(fig, fullpath);
fprintf('Done. File saved as: %s\n\n', fullpath);


end

