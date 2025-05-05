% Comparison of two data from archived and current annular flum experimetns
clc; clear; close all;
%%
casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\1dot5-0\05h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\1dot5-0\05h\Case_L';
comparePSD(casePath_old, casePath_new);

%%
casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\1dot5-0\09h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\1dot5-0\09h\Case_L';
comparePSD(casePath_old, casePath_new);

%%
casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\3-0\01h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\3-0\01h\Case_L';
comparePSD(casePath_old, casePath_new);

%%
casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\3-0\05h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\3-0\05h\Case_L';
comparePSD(casePath_old, casePath_new);

%%
casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\3-0\09h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\3-0\09h\Case_L';
comparePSD(casePath_old, casePath_new);

%%
casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\4dot5-0\05h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\4dot5-0\05h\Case_L';
comparePSD(casePath_old, casePath_new);

%%
casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\4dot5-0\09h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\4dot5-0\09h\Case_L';
comparePSD(casePath_old, casePath_new);

%% function implementation
function comparePSD(casePath_old, casePath_new)
data_old = load(fullfile(casePath_old, 'figure_data', 'pxxs.mat'));
data_new = load(fullfile(casePath_new, 'figure_data', 'pxxs.mat'));
base_dir = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis';

[ii_c_old, jj_c_old] = deal(round(size(data_old.fxs, 1)/2), round(size(data_old.fxs, 2)/2));
[ii_c_new, jj_c_new] = deal(round(size(data_new.fxs, 1)/2), round(size(data_new.fxs, 2)/2));

% Create a figure with a larger size
figure('Position', [100 100 800 600]); % [left bottom width height]

% Set the default text properties for the entire figure
set(gcf, 'DefaultTextInterpreter', 'latex', 'DefaultTextFontSize', 16);
plot(squeeze(data_old.fxs(ii_c_old, jj_c_old, :)), squeeze(data_old.pxxs(ii_c_old, jj_c_old, :)), 'k', 'LineWidth', 1);
hold on;
plot(squeeze(data_new.fxs(ii_c_new, jj_c_new, :)), squeeze(data_new.pxxs(ii_c_new, jj_c_new, :)), 'r', 'LineWidth', 0.8);

legend('Old $S_{uu}$', 'New $S_{uu}$', 'Interpreter', 'latex');
grid on; set(gca, 'XScale', 'log'); set(gca, 'YScale', 'log'); set(gca, 'FontSize', 16);
xlabel('$f$', 'Interpreter', 'latex');
ylabel('$S_{uu}$', 'Interpreter', 'latex');

% Save figure as fig and eps and svg and png to 'analysis_figrues' folder, if not existing, create it
fig_folder = fullfile(base_dir, 'analysis_figures');
if ~exist(fig_folder, 'dir')
    mkdir(fig_folder);
end
% make folder for each case
substring = 'reanalysis';
% Use strfind to find the position of the substring
position = strfind(casePath_new, substring);
% Extract the substring
substring = casePath_new(position(1)+length(substring):end);

caseName = fullfile(fig_folder, substring);
if ~exist(fullfile(caseName), 'dir')
    mkdir(fullfile(caseName));
end
title(strcat('PSD $S_{uu}$ of ', regexprep(substring, '\\', '-')), 'interpreter', 'latex');

saveas(gcf, fullfile(caseName, 'pxxs.fig'));
saveas(gcf, fullfile(caseName, 'pxxs.eps'));
saveas(gcf, fullfile(caseName, 'pxxs.svg'));
saveas(gcf, fullfile(caseName, 'pxxs.png'));

% Close figure
% close(gcf);

figure('Position', [100 100 800 600]); % [left bottom width height]

% Set the default text properties for the entire figure
set(gcf, 'DefaultTextInterpreter', 'latex', 'DefaultTextFontSize', 16);
plot(squeeze(data_old.fys(ii_c_old, jj_c_old, :)), squeeze(data_old.pyys(ii_c_old, jj_c_old, :)), 'k', 'LineWidth', 0.8);
hold on;
plot(squeeze(data_new.fys(ii_c_new, jj_c_new, :)), squeeze(data_new.pyys(ii_c_new, jj_c_new, :)), 'r', 'LineWidth', 1);

legend('Old $S_{uu}$', 'New $S_{uu}$', 'Interpreter', 'latex');
grid on; set(gca, 'XScale', 'log'); set(gca, 'YScale', 'log'); set(gca, 'FontSize', 16);
xlabel('$f$', 'Interpreter', 'latex');
ylabel('$S_{uu}$', 'Interpreter', 'latex');

legend('Old $S_{vv}$', 'New $S_{vv}$', 'Interpreter', 'latex');
grid on; set(gca, 'XScale', 'log'); set(gca, 'YScale', 'log'); set(gca, 'FontSize', 16);
xlabel('$f$', 'Interpreter', 'latex');
ylabel('$S_{vv}$', 'Interpreter', 'latex');

title(strcat('PSD $S_{vv}$ of ', regexprep(substring, '\\', '-')), 'interpreter', 'latex');

saveas(gcf, fullfile(caseName, 'pyys.fig'));
saveas(gcf, fullfile(caseName, 'pyys.eps'));
saveas(gcf, fullfile(caseName, 'pyys.svg'));
saveas(gcf, fullfile(caseName, 'pyys.png'));

% close(gcf);
end