%% UNSAFE CASES
% Precision is 0.1
init_set=[0.05, 0.06, 0.07, 0.08, 0.09, 0.1]
verif_time=[7.198, 7.073, 6.827, 6.527, 7.233, 7.373]
figure
h1= scatter(init_set,verif_time)
title('Initial Set Intervals vs. Verification Time, Precision=0.1')
xlabel('Interval Range')
ylabel('Verification Time (s)')
saveas(h1, 'file1', 'png');

% Precision is 0.05
init_set2=[0.05, 0.06, 0.07, 0.08, 0.09, 0.1]
verif_time2=[8.062, 600.000, 600.000, 600.00, 600.00, 600.00]
figure
h2=scatter(init_set2,verif_time2)
title('Initial Set Intervals vs. Verification Time, Precision=0.05')
xlabel('Interval Range')
ylabel('Verification Time (s)')
saveas(h2, 'file2', 'png');
% Precision is 0.15
figure
init_set3=[0.05, 0.06, 0.07, 0.08, 0.09, 0.1]
verif_time3=[6.271, 6.640, 6.174, 6.557, 6.756, 6.725]
h3=scatter(init_set3,verif_time3)
title('Initial Set Intervals vs. Verification Time, Precision=0.15')
xlabel('Interval Range')
ylabel('Verification Time (s)')
saveas(h3, 'file3', 'png');
% Precision is 0.2

%% SAFE CASES

%% GOAL SET SIZE