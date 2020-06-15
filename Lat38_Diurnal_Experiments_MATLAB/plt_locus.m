function plt_locus(pltdir, T, V12, V13, L12, L13, bilingual)
%PLT_LOCUS Subroutine for plotting
%   the locus of the diurnal vector
% 
% bilingual - as a boolean
%   'true'  for plotting in both languages
%   'false' for plotting in English only
% 


%% Preparation.

% normalize the potential differences
% and convert them into \mu{V}/m
V12 = V12 / L12 * 1e3;
V13 = V13 / L13 * 1e3;

% there is no way to perform pchip interpolation
% for a dataset whose x-data is not monotonically increasing
V12_fit = V12; V13_fit = V13;


%% Start plotting stuff.

% create a new window
fig = figure;

% specify window properties
if bilingual
    filename = 'mjt_locus_chs.png';
else
    filename = 'mjt_locus_eng.png';
end
fullpath = [pltdir, filename];

% present the locus as line segments
hold on
plot(V12_fit, V13_fit);
scatter(V12, V13, '.');
hold on

% manipulate axes
axis('equal');

% plot annotations
if bilingual
    text(V12(1), V13(1), '\leftarrow 起始点');
else
    text(V12(1), V13(1), '\leftarrow Starting point');
end

% label the axes
if bilingual
    xlabel({'东向电位差/(\mu{V}\cdot{m}^{-1})', ...
        'East potential difference/(\mu{V}\cdot{m}^{-1})'});
    ylabel({'北向电位差/(\mu{V}\cdot{m}^{-1})', ...
        'North potential difference/(\mu{V}\cdot{m}^{-1})'});
else
    xlabel('East potential difference [\mu{V}\cdot{m}^{-1}]');
    ylabel('North potential difference [\mu{V}\cdot{m}^{-1}]');
end

% finer adjustments
% grid on;
box on;

% save the plot
saveas(fig, fullpath);
fprintf('Done. File saved as: %s\n\n', fullpath);


end

