clc;
clear all;
close all;

# without elitism
renER1p = csvread('renER1p.csv');
renERUn = csvread('renERUn.csv');
renET2p = csvread('renET2p.csv');

# with elitism
reER1p = csvread('reER1p.csv');
reET2p = csvread('reET2p.csv');
reETUn = csvread('reETUn.csv');

# with steady state
reE2R1p = csvread('reE2R1p.csv');
reE3T2p = csvread('reE3T2p.csv');

# plot results
t = 1:length(renER1p);

# use gnuplot toolkit
#graphics_toolkit('gnuplot');

figure;
subplot(2, 1, 1);
plot(t, renER1p(:, 3), '-k', 'linewidth', 2, ...
     t, renERUn(:, 3), '-', 'linewidth', 2, ...
     t, renET2p(:, 3), '-', 'linewidth', 2);
hold on;
plot(t, reER1p(:, 3), '-', 'linewidth', 2, ...
     t, reET2p(:, 3), '-', 'linewidth', 2, ...
     t, reETUn(:, 3), '-', 'linewidth', 2);
hold on;
plot(t, reE2R1p(:, 3), '-b', 'linewidth', 2, ...
     t, reE3T2p(:, 3), '-', 'linewidth', 2);
hold off;
grid minor;
legend('nER1p', ...
       'nERUn', ...
       'nET2p', ...
       'ER1p', ...
       'ET2p', ...
       'ETUn', ...
       'Ee2R1p', ...
       'Ee3R2p ', ...
       'location', 'northeastoutside');
title('Comportamento médio dos melhores fitness por experimento');
xlabel('Número de gerações');
ylabel('Fitness');
axis([1 500 .95 .995]);

subplot(2, 1, 2);
plot(t, renER1p(:, 2), '-k', 'linewidth', 2, ...
     t, renERUn(:, 2), '-', 'linewidth', 2, ...
     t, renET2p(:, 2), '-', 'linewidth', 2);
hold on;
plot(t, reER1p(:, 2), '-', 'linewidth', 2, ...
     t, reET2p(:, 2), '-', 'linewidth', 2, ...
     t, reETUn(:, 2), '-', 'linewidth', 2);
hold on;
plot(t, reE2R1p(:, 2), '-b', 'linewidth', 2, ...
     t, reE3T2p(:, 2), '-', 'linewidth', 2);
hold off;
grid minor;
legend('nER1p', ...
       'nERUn', ...
       'nET2p', ...
       'ER1p', ...
       'ET2p', ...
       'ETUn', ...
       'Ee2R1p', ...
       'Ee3R2p ', ...
       'location', 'northeastoutside');
title('Comportamento médio dos fitness médios por experimento');
xlabel('Número de gerações');
ylabel('Fitness');
axis([1 500 .5 .94]);

figure;
p = find(mod(renER1p(:, 1), 50) == 0 | renER1p(:, 1) == 1);
bar(p, [renER1p(p, 3) renERUn(p, 3) renET2p(p, 3)]);
grid minor;
legend('renER1p', ...
       'renERUn', ...
       'renET2p', ...
       'location', 'northwest');
ylim([.7 1]);

figure;
bar(p, [reER1p(p, 3) reET2p(p, 3) reETUn(p, 3)]);
grid minor;
legend('reER1p', ...
       'reET2p', ...
       'reETUn', ...
       'location', 'northwest');
ylim([.7 1]);

figure;
bar(p, [reE2R1p(p, 3) reE3T2p(p, 3)]);
grid minor;
legend('reE2R1p', ...
       'reE3T2p', ...
       'location', 'northwest');
ylim([.7 1]);

figure;
bar(p, [renET2p(p, 3) reER1p(p, 3) reE2R1p(p, 3)]);
grid minor;
legend('nET2p', ...
       'ER1p', ...
       'Ee2R1p', ...
       'location', 'northwest');
ylim([.7 1]);

# show statistics resume
disptbl('renER1p', renER1p, 50);
disptbl('renERUn', renERUn, 50);
disptbl('renET2p', renET2p, 50);

disptbl('reER1p', reER1p, 50);
disptbl('reET2p', reET2p, 50);
disptbl('reETUn', reETUn, 50);

disptbl('reE2R1p', reE2R1p, 50);
disptbl('reE3T2p', reE3T2p, 50);
