%% Clear/close all
clc;
close all;
clear;
%% Read Data from 2sit.csv
A = csvread('2sit.csv',4,0);
sit_CH1 = A(:,5); % mVolts
sit_CH2 = A(:,7); % mVolts
sit_time = A(:,39)/1000; % secs
sit_CH3 = A(:,45); % mVolts
sit_CH4 = A(:,47); % mVolts
%% Read Data from 2stand.csv
B = csvread('2stand.csv',4,0);
stand_CH1 = B(:,5); % mVolts
stand_CH2 = B(:,7); % mVolts
stand_time = B(:,39)/1000; % secs
stand_CH3 = B(:,45); % mVolts
stand_CH4 = B(:,47); % mVolts
%% Read Data from 2sitkick.csv
C = csvread('2sitkick.csv',4,0);
sitkick_CH1 = C(:,5); % mVolts
sitkick_CH2 = C(:,7); % mVolts
sitkick_time = C(:,39)/1000; % secs
sitkick_CH3 = C(:,45); % mVolts
sitkick_CH4 = C(:,47); % mVolts
%% Read Data from 2sts.csv
D = csvread('2sts.csv',4,0);
STS_CH1 = D(:,5); % mVolts
STS_CH2 = D(:,7); % mVolts
STS_time = D(:,39)/1000; % secs
STS_CH3 = D(:,45); % mVolts
STS_CH4 = D(:,47); % mVolts
%% Read Data from 2walk.csv
E = csvread('2walk.csv',4,0);
walk_CH1 = E(:,5); % mVolts
walk_CH2 = E(:,7); % mVolts
walk_time = E(:,39)/1000; % secs
walk_CH3 = E(:,45); % mVolts
walk_CH4 = E(:,47); % mVolts
%% EMG Channel 1 (High Pass Filter Rectified)
sampling_frequency = 1024/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; % 200 Hz
[b,a] = butter(4,low_cutoff,'high');
sit_CH1filt = abs(filtfilt(b,a,sit_CH1));
stand_CH1filt = abs(filtfilt(b,a,stand_CH1));
sitkick_CH1filt = abs(filtfilt(b,a,sitkick_CH1));
STS_CH1filt = abs(filtfilt(b,a,STS_CH1));
walk_CH1filt = abs(filtfilt(b,a,walk_CH1));

figure (1);

subplot(2,3,1);
plot(sit_time,sit_CH1filt);
title('Sitting - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,2);
plot(stand_time,stand_CH1filt);
title('Standing - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,3);
plot(sitkick_time,sitkick_CH1filt);
title('Sit w/ Kicking - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,3);
plot(STS_time,STS_CH1filt);
title('STS - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,4);
plot(walk_time,walk_CH1filt);
title('Walking - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

%% EMG Channel 2 (High Pass Filter Rectified)
sampling_frequency = 1024/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; % 200 Hz
[b,a] = butter(4,low_cutoff,'high');
sit_CH2filt = abs(filtfilt(b,a,sit_CH2));
stand_CH2filt = abs(filtfilt(b,a,stand_CH2));
sitkick_CH2filt = abs(filtfilt(b,a,sitkick_CH2));
STS_CH2filt = abs(filtfilt(b,a,STS_CH2));
walk_CH2filt = abs(filtfilt(b,a,walk_CH2));

figure (2);

subplot(2,3,1);
plot(sit_time,sit_CH2filt);
title('Sitting - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,2);
plot(stand_time,stand_CH2filt);
title('Standing - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,3);
plot(sitkick_time,sitkick_CH2filt);
title('Sit w/ Kicking - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,3);
plot(STS_time,STS_CH2filt);
title('STS - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,4);
plot(walk_time,walk_CH2filt);
title('Walking - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

%% EMG Channel 3 (High Pass Filter Rectified)
sampling_frequency = 1024/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; % 200 Hz
[b,a] = butter(4,low_cutoff,'high');
sit_CH3filt = abs(filtfilt(b,a,sit_CH3));
stand_CH3filt = abs(filtfilt(b,a,stand_CH3));
sitkick_CH3filt = abs(filtfilt(b,a,sitkick_CH3));
STS_CH3filt = abs(filtfilt(b,a,STS_CH3));
walk_CH3filt = abs(filtfilt(b,a,walk_CH3));

figure (3);

subplot(2,3,1);
plot(sit_time,sit_CH3filt);
title('Sitting - Tibialis Anterior EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,2);
plot(stand_time,stand_CH3filt);
title('Standing - Tibialis Anterior EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,3);
plot(sitkick_time,sitkick_CH3filt);
title('Sit w/ Kicking - Tibialis Anterior EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,3);
plot(STS_time,STS_CH3filt);
title('STS - Tibialis Anterior EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,4);
plot(walk_time,walk_CH3filt);
title('Walking - Tibialis Anterior EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

%% EMG Channel 4 (High Pass Filter Rectified)
sampling_frequency = 1024/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; % 200 Hz
[b,a] = butter(4,low_cutoff,'high');
sit_CH4filt = abs(filtfilt(b,a,sit_CH4));
stand_CH4filt = abs(filtfilt(b,a,stand_CH4));
sitkick_CH4filt = abs(filtfilt(b,a,sitkick_CH4));
STS_CH4filt = abs(filtfilt(b,a,STS_CH4));
walk_CH4filt = abs(filtfilt(b,a,walk_CH4));

figure (4);

subplot(2,3,1);
plot(sit_time,sit_CH4filt);
title('Sitting - Vastus Medialis EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,2);
plot(stand_time,stand_CH4filt);
title('Standing - Vastus Medialis EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,3);
plot(sitkick_time,sitkick_CH4filt);
title('Sit w/ Kicking - Vastus Medialis EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,3);
plot(STS_time,STS_CH4filt);
title('STS - Vastus Medialis EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,2,4);
plot(walk_time,walk_CH4filt);
title('Walking - Vastus Medialis EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

