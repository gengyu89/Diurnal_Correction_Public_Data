function plt_diurnal(pltdir, T, E, phi, bilingual)
%PLT_DIURNAL Subroutine for plotting
%   diurnal magnitude and phase angle
% 
% bilingual - as a boolean
%   'true'  for plotting in both languages
%   'false' for plotting in English only
% 


%% Preparation.

% prepare a new axis for interpolation
% dT = 20/60;  % this will miss the last data
% T_fit = min(T) : dT : max(T);
T_fit = T;

% convert diurnal norm into \mu{V}
E = E * 1e3;

% perform pchip
% E_fit   = interpn(T, E,   T_fit, 'pchip');
% phi_fit = interpn(T, phi, T_fit, 'pchip');
E_fit = E; phi_fit = phi;


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

% label the axes
if bilingual
    xlabel({'时间/h', 'Time/h'});
    ylabel({'日变模量/(\mu{V}\cdot{m}^{-1})', 'Diurnal norm/(\mu{V}\cdot{m}^{-1})'});
else
    xlabel('Time [h]');
    ylabel('Diurnal norm [\mu{V}\cdot{m}^{-1}]');
end

% plot a legend
if bilingual
    legend('平滑曲线', '离散数据', 'Location', 'best');
else
    legend('Smoothed', 'Discrete', 'Location', 'best');
end

% plot phase angle
subplot(2,1,2)
if bilingual
    ntitle('(b ', 'location', 'northeast');  % chinese journal of geophysics
else
    ntitle(' b)', 'location', 'northwest');  % most foreign journals
end

hold on
plot(T_fit, phi_fit);
scatter(T, phi, '.');
hold off

% tighten the plot
ylim([min(phi_fit), max(phi_fit)]);
warning('Ordinate tightened with the min and max values!');

% label the axis
if bilingual
    xlabel({'时间/h', 'Time/h'});
    ylabel({'日变夹角/rad', 'Phase angle/rad'});
else
    xlabel('Time [h]');
    ylabel('Phase angle [rad]');
end

% plot a legend
if bilingual
    legend('平滑曲线', '离散数据', 'Location', 'best');
else
    legend('Smoothed', 'Discrete', 'Location', 'best');
end

% save the plot
saveas(fig, fullpath);
fprintf('Done. File saved as: %s\n\n', fullpath);


end

