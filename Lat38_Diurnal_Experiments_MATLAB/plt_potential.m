function plt_potential(pltdir, T, V12, V13, bilingual)
%PLT_POTENTIAL Subroutine for plotting
%   east and north potential differences
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

% perform pchip
% V12_fit = interpn(T, V12, T_fit, 'pchip');
% V13_fit = interpn(T, V13, T_fit, 'pchip');
V12_fit = V12; V13_fit = V13;

% find a common ordinate
V_all = [V12_fit, V13_fit];
Y_min = min(V_all); Y_max = max(V_all);


%% Start plotting stuff.

% create a new window
fig = figure;

% specify window properties
if bilingual
    filename = 'mjt_pdiff_chs.png';
else
    filename = 'mjt_pdiff_eng.png';
end
fullpath = [pltdir, filename];

% plot east difference
subplot(2,1,1)
if bilingual
    ntitle('(a ', 'location', 'northeast');  % chinese journal of geophysics
else
    ntitle(' a)', 'location', 'northwest');  % most foreign journals
end

hold on
plot(T_fit, V12_fit);
scatter(T, V12, '.');
hold off

% unify the ordinate
% ylim([Y_min, Y_max]);

% plot annotations
text(T(31), V12(31), '\leftarrow 21.2 h');
text(T(78), V12(78), '\leftarrow 36.8 h');

% label the axes
if bilingual
    xlabel({'时间/h', 'Time/h'});
    ylabel({'电位差/mV', 'Potential difference/mV'});
else
    xlabel('Time [h]');
    ylabel('Potential difference [mV]');
end

% plot a legend
% if bilingual
%     legend('平滑曲线', '离散数据', 'Location', 'best');
% else
%     legend('Smoothed', 'Discrete', 'Location', 'best');
% end

% plot north difference
subplot(2,1,2)
if bilingual
    ntitle('(b ', 'location', 'northeast');  % chinese journal of geophysics
else
    ntitle(' b)', 'location', 'northwest');  % most foreign journals
end

hold on
plot(T_fit, V13_fit);
scatter(T, V13, '.');
hold off

% unify the ordinate
% ylim([Y_min, Y_max]);

% plot annotations
text(T(37), V13(37), '\leftarrow 23.2 h');
text(T(78), V13(78), '\leftarrow 36.8 h');

% label the axes
if bilingual
    xlabel({'时间/h', 'Time/h'});
    ylabel({'电位差/mV', 'Potential difference/mV'});
else
    xlabel('Time [h]');
    ylabel('Potential difference [mV]');
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

