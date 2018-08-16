%% Clear/close all
clc;
close all;
clear;
%% Read Data from SittingStill.csv
A = csvread('SittingStill.csv',4,0);
sit_CH1 = A(:,5); % mVolts
sit_CH2 = A(:,7); % mVolts
sit_GyroX = A(:,15); % deg/sec*
sit_GyroY = A(:,17); % deg/sec*
sit_GyroZ = A(:,19); % deg/sec*
sit_AccelX = A(:,21); % m/(sec^2)*
sit_AccelY = A(:,23); % m/(sec^2)*
sit_AccelZ = A(:,25); % m/(sec^2)*
sit_time = A(:,39)/1000; % secs
%% Read Data from StandingStill.csv
B = csvread('StandingStill.csv',4,0);
stand_CH1 = B(:,5); % mVolts
stand_CH2 = B(:,7); % mVolts
stand_GyroX = B(:,15); % deg/sec*
stand_GyroY = B(:,17); % deg/sec*
stand_GyroZ = B(:,19); % deg/sec*
stand_AccelX = B(:,21); % m/(sec^2)*
stand_AccelY = B(:,23); % m/(sec^2)*
stand_AccelZ = B(:,25); % m/(sec^2)*
stand_time = B(:,39)/1000; % secs
%% Read Data from SitwKicking.csv
C = csvread('SitwKicking.csv',4,0);
sitkick_CH1 = C(:,5); % mVolts
sitkick_CH2 = C(:,7); % mVolts
sitkick_GyroX = C(:,15); % deg/sec*
sitkick_GyroY = C(:,17); % deg/sec*
sitkick_GyroZ = C(:,19); % deg/sec*
sitkick_AccelX = C(:,21); % m/(sec^2)*
sitkick_AccelY = C(:,23); % m/(sec^2)*
sitkick_AccelZ = C(:,25); % m/(sec^2)*
sitkick_time = C(:,39)/1000; % secs
%% Read Data from STS.csv
D = csvread('STS.csv',4,0);
STS_CH1 = D(:,5); % mVolts
STS_CH2 = D(:,7); % mVolts
STS_GyroX = D(:,15); % deg/sec*
STS_GyroY = D(:,17); % deg/sec*
STS_GyroZ = D(:,19); % deg/sec*
STS_AccelX = D(:,21); % m/(sec^2)*
STS_AccelY = D(:,23); % m/(sec^2)*
STS_AccelZ = D(:,25); % m/(sec^2)*
STS_time = D(:,39)/1000; % secs
%% Read Data from STS2.csv
E = csvread('STS2.csv',4,0);
STS2_CH1 = E(:,5); % mVolts
STS2_CH2 = E(:,7); % mVolts
STS2_GyroX = E(:,15); % deg/sec*
STS2_GyroY = E(:,17); % deg/sec*
STS2_GyroZ = E(:,19); % deg/sec*
STS2_AccelX = E(:,21); % m/(sec^2)*
STS2_AccelY = E(:,23); % m/(sec^2)*
STS2_AccelZ = E(:,25); % m/(sec^2)*
STS2_time = E(:,39)/1000; % secs
%% Read Data from Walking.csv
F = csvread('Walking.csv',4,0);
walk_CH1 = F(:,5); % mVolts
walk_CH2 = F(:,7); % mVolts
walk_GyroX = F(:,15); % deg/sec*
walk_GyroY = F(:,17); % deg/sec*
walk_GyroZ = F(:,19); % deg/sec*
walk_AccelX = F(:,21); % m/(sec^2)*
walk_AccelY = F(:,23); % m/(sec^2)*
walk_AccelZ = F(:,25); % m/(sec^2)*
walk_time = F(:,39)/1000; % secs
%% Accelerometer Data
figure (1);

subplot(2,3,1);
plot(sit_time,sit_AccelX,sit_time,sit_AccelY,sit_time,sit_AccelZ);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Sitting - Accelerometer Data');
legend('AccelX','AccelY','AccelZ');

subplot(2,3,2);
plot(stand_time,stand_AccelX,stand_time,stand_AccelY,stand_time,stand_AccelZ);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Standing - Accelerometer Data');
legend('AccelX','AccelY','AccelZ');

subplot(2,3,3);
plot(sitkick_time,sitkick_AccelX,sitkick_time,sitkick_AccelY,sitkick_time,sitkick_AccelZ);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Sitting w/ Kicking - Accelerometer Data');
legend('AccelX','AccelY','AccelZ');

subplot(2,3,4);
plot(STS_time,STS_AccelX,STS_time,STS_AccelY,STS_time,STS_AccelZ);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('STS - Accelerometer Data');
legend('AccelX','AccelY','AccelZ');

subplot(2,3,5);
plot(STS2_time,STS2_AccelX,STS2_time,STS2_AccelY,STS2_time,STS2_AccelZ);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('STS2 - Accelerometer Data');
legend('AccelX','AccelY','AccelZ');

subplot(2,3,6);
plot(walk_time,walk_AccelX,walk_time,walk_AccelY,walk_time,walk_AccelZ);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Walking - Accelerometer Data');
legend('AccelX','AccelY','AccelZ');

%% Gyro Data 
figure (2);

% Sitting
subplot(6,3,1);
plot(sit_time,sit_GyroX);
ylabel('Speed (deg/sec)');
title('Sitting - Gyro X');

subplot(6,3,4);
plot(sit_time,sit_GyroY);
ylabel('Speed (deg/sec)');
title ('Gyro Y');

subplot(6,3,7);
plot(sit_time,sit_GyroZ);
ylabel('Speed (deg/sec)');
title('Gyro Z');

% Standing
subplot(6,3,2);
plot(stand_time,stand_GyroX);
ylabel('Speed (deg/sec)');
title('Standing - Gyro X');

subplot(6,3,5);
plot(stand_time,stand_GyroY);
ylabel('Speed (deg/sec)');
title ('Gyro Y');

subplot(6,3,8);
plot(stand_time,stand_GyroZ);
ylabel('Speed (deg/sec)');
title('Gyro Z');

% Sitting w/ Kicking
subplot(6,3,3);
plot(sitkick_time,sitkick_GyroX);
ylabel('Speed (deg/sec)');
title('Sitting w/ kicking- Gyro X');

subplot(6,3,6);
plot(sitkick_time,sitkick_GyroY);
ylabel('Speed (deg/sec)');
title ('Gyro Y');

subplot(6,3,9);
plot(sitkick_time,sitkick_GyroZ);
ylabel('Speed (deg/sec)');
title('Gyro Z');

% STS 1
subplot(6,3,10);
plot(STS_time,STS_GyroX);
ylabel('Speed (deg/sec)');
title('STS - Gyro X');

subplot(6,3,13);
plot(STS_time,STS_GyroY);
ylabel('Speed (deg/sec)');
title ('Gyro Y');

subplot(6,3,16);
plot(STS_time,STS_GyroZ);
ylabel('Speed (deg/sec)');
title('Gyro Z');

% STS 2
subplot(6,3,11);
plot(STS2_time,STS2_GyroX);
ylabel('Speed (deg/sec)');
title('STS2 - Gyro X');

subplot(6,3,14);
plot(STS2_time,STS2_GyroY);
ylabel('Speed (deg/sec)');
title ('Gyro Y');

subplot(6,3,17);
plot(STS2_time,STS2_GyroZ);
ylabel('Speed (deg/sec)');
title('Gyro Z');

% Walking
subplot(6,3,12);
plot(walk_time,walk_GyroX);
ylabel('Speed (deg/sec)');
title('Walking - Gyro X');

subplot(6,3,15);
plot(walk_time,walk_GyroY);
ylabel('Speed (deg/sec)');
title ('Gyro Y');

subplot(6,3,18);
plot(walk_time,walk_GyroZ);
ylabel('Speed (deg/sec)');
title('Gyro Z');

%% EMG Channel 1 (High Pass Filter Rectified)
sampling_frequency = 1024/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; % 200 Hz
[b,a] = butter(4,low_cutoff,'high');
sit_CH1filt = abs(filtfilt(b,a,sit_CH1));
stand_CH1filt = abs(filtfilt(b,a,stand_CH1));
sitkick_CH1filt = abs(filtfilt(b,a,sitkick_CH1));
STS_CH1filt = abs(filtfilt(b,a,STS_CH1));
STS2_CH1filt = abs(filtfilt(b,a,STS2_CH1));
walk_CH1filt = abs(filtfilt(b,a,walk_CH1));

figure (3);

subplot(2,3,1);
plot(sit_time,sit_CH1filt);
title('Sitting - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,2);
plot(stand_time,stand_CH1filt);
title('Standing - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,3);
plot(sitkick_time,sitkick_CH1filt);
title('Sit w/ Kicking - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,4);
plot(STS_time,STS_CH1filt);
title('STS - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,5);
plot(STS2_time,STS2_CH1filt);
title('STS2 - Bicep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,6);
plot(walk_time,walk_CH1filt);
title('Walking - Bicep Femoris EMG Data');
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
STS2_CH2filt = abs(filtfilt(b,a,STS2_CH2));
walk_CH2filt = abs(filtfilt(b,a,walk_CH2));

figure (4);

subplot(2,3,1);
plot(sit_time,sit_CH2filt);
title('Sitting - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,2);
plot(stand_time,stand_CH2filt);
title('Standing - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,3);
plot(sitkick_time,sitkick_CH2filt);
title('Sit w/ Kicking - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,4);
plot(STS_time,STS_CH2filt);
title('STS - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,5);
plot(STS2_time,STS2_CH2filt);
title('STS2 - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');

subplot(2,3,6);
plot(walk_time,walk_CH2filt);
title('Walking - Quadricep Femoris EMG Data');
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
