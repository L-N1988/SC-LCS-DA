%% Comparison of two data from archived and current annular flum experimetns

casePath_old = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\archived\1dot5-0\05h\Case_L';
casePath_new = 'C:\Users\29945\Desktop\annular-flume-PIVmat\annular_flume reanalysis\1dot5-0\05h\Case_L';
data_old = load(fullfile(casePath_old, 'figure_data', 'pxxs.mat'));
data_new = load(fullfile(casePath_new, 'figure_data', 'pxxs.mat'));

figure;
plot(data_old.pxxs, 'b', 'LineWidth', 2);
hold on;
plot(data_new.pxxs, 'r', 'LineWidth', 2);
legend('Old', 'New');
xlabel('x');
ylabel('Pxx');