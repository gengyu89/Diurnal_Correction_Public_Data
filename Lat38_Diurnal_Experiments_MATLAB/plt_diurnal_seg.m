function plt_diurnal_seg(pltdir, T, E, phi, bilingual)
%PLTS_DIURNAL_SEG A modification of PLT_DIURNAL
%   for plotting diurnal magnitude and phase angle
% 
% bilingual - as a boolean
%   'true'  for plotting in both languages
%   'false' for plotting in English only
% 


%% Preparation.

% convert diurnal norm into \mu{V}
m = 69;  % set a marker
E = E * 1e3;

% break the time axis and the phase angle
T_1 = T(1:m); phi_1 = phi(1:m);
T_2 = T(m+1:end); phi_2 = phi(m+1:end);

% skip pchip interpolation
T_fit = T;
E_fit = E; phi_fit = phi;

% introduce new colormaps
newblue = [     0    0.4470    0.7410];
new_org = [0.8500    0.3250    0.0980];


%% Start plotting stuff.

% create a new window
fig = figure;

% specify window properties
if bilingual
    filename = 'mjt_dvar_chs.png';
else
    filename = 'mjt_dvar_eng.png';
end
fullpath = [pltdir, filename];

% plot diurnal magnitude
subplot(2,1,1)
if bilingual
    ntitle('(a ', 'location', 'northeast');  % chinese journal of geophysics
else
    ntitle(' a)', 'location', 'northwest');  % most foreign journals
end

hold on
plot(T_fit, E_fit);
scatter(T, E, '.');
hold off

% plot annotations
text(T(8),  E(8),  '\leftarrow 13.5h');
text(T(30), E(30), '\leftarrow 20.8h');
text(T(56), E(56), '\leftarrow 29.5h');
text(T(78), E(78), '\leftarrow 36.8h');
text(T(96), E(96), '\leftarrow 42.8h');

% label the axes
if bilingual
    xlabel({'时间/h', 'Time/h'});
    ylabel({'日变模量/(\mu{V}\cdot{m}^{-1})', 'Diurnal norm/(\mu{V}\cdot{m}^{-1})'});
else
    xlabel('Time [h]');
    ylabel('Diurnal norm [\mu{V}\cdot{m}^{-1}]');
end

% plot a legend
% if bilingual
%     legend('平滑曲线', '离散数据', 'Location', 'best');
% else
%     legend('Smoothed', 'Discrete', 'Location', 'best');
% end

% plot phase angle
subplot(2,1,2)
if bilingual
    ntitle('(b ', 'location', 'northeast');  % chinese journal of geophysics
else
    ntitle(' b)', 'location', 'northwest');  % most foreign journals
end

hold on
% plot(T_fit, phi_fit);
% scatter(T, phi, '.');
plot(T_1, phi_1); scatter(T_1, phi_1, '.');
plot(T_2, phi_2, 'color', newblue);
scatter(T_2, phi_2, 5, new_org, 'filled');
hold off

% tighten the plot
ylim([min(phi_fit), max(phi_fit)]);
% warning('Ordinate tightened with the min and max values!');

% plot annotations
text(T(8),  phi(8),  '\leftarrow 13.5h');
text(T(30), phi(30), '\leftarrow 20.8h');
text(T(56), phi(56), '\leftarrow 29.5h');
text(T(78), phi(78), '\leftarrow 36.8h');
text(T(96), phi(96), '\leftarrow 42.8h');

% label the axis
if bilingual
    xlabel({'时间/h', 'Time/h'});
    ylabel({'日变夹角/rad', 'Phase angle/rad'});
else
    xlabel('Time [h]');
    ylabel('Phase angle [rad]');
end

% plot a legend
% if bilingual
%     legend('平滑曲线', '离散数据', 'Location', 'best');
% else
%     legend('Smoothed', 'Discrete', 'Location', 'best');
% end

% save the plot
saveas(fig, fullpath);
fprintf('Done. File saved as: %s\n\n', fullpath);


end

