function plt_comparison(pltdir, Te, E, Tm, nT, bilingual)
%PLT_COMPARISON Subroutine for plotting
%   diurnal magnitude and magnetic induction
% 
% bilingual - as a boolean
%   'true'  for plotting in both languages
%   'false' for plotting in English only
% 


%% Preparation.

% find a common time axis
% (used only for tightening)
T_lim = [min(Te(1),Tm(1)), max(Te(end),Tm(end))];

% prepare new axes for interpolation
dT = 0.01;  % to keep as many details as possible
Te_fit = min(Te) : dT : max(Te);
Tm_fit = min(Tm) : dT : max(Tm);

% convert diurnal norm into \mu{V}
E = E * 1e3;

% perform pchip
E_fit  = interpn(Te, E,  Te_fit, 'pchip');
nT_fit = interpn(Tm, nT, Tm_fit, 'pchip');


%% Start plotting stuff.

% create a new window
fig = figure;

% specify window properties
if bilingual
    filename = 'line_compare_chs.png';
else
    filename = 'line_compare_eng.png';
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
plot(Te_fit, E_fit);
scatter(Te, E, '.');
hold off

% plot annotations
text(Te(10), E(10), '\leftarrow 13 h');
text(Te(98), E(98), '\leftarrow 35 h');

% tighten the plot
xlim(T_lim);

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

% plot magnetic induction
subplot(2,1,2)
if bilingual
    ntitle('(b ', 'location', 'northeast');  % chinese journal of geophysics
else
    ntitle(' b)', 'location', 'northwest');  % most foreign journals
end

hold on
plot(Tm_fit, nT_fit);
scatter(Tm, nT, '.');
hold off

% tighten the plot
xlim(T_lim);

% label the axes
if bilingual
    xlabel({'时间/h', 'Time/h'});
    ylabel({'磁感应强度/nT', 'Magnetic induction/nT'});
else
    xlabel('Time [h]');
    ylabel('Magnetic induction [nT]');
end

% plot annotations
text(Tm(17), nT(17), '\leftarrow 12 h');
text(Tm(76), nT(76), '\leftarrow 34 h');

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

