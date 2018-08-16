%% Clear/close all
clc;
close all;
clear;

%% Read Data
A = csvread('2sts.csv',4,0);
AxisAngleA = A(:,1); % local
AxisAngleX = A(:,2); % local
AxisAngleY = A(:,3); % local
AxisAngleZ = A(:,4); % local
CH1 = A(:,5); % mVolts
CH2 = A(:,7); % mVolts
GyroX = A(:,15); % deg/sec*
GyroY = A(:,17); % deg/sec*
GyroZ = A(:,19); % deg/sec*
AccelX = A(:,21); % m/(sec^2)*
AccelY = A(:,23); % m/(sec^2)*
AccelZ = A(:,25); % m/(sec^2)*
t = A(:,39)/1000; % sec
CH3 = A(:,45); % mVolts
CH4 = A(:,47); % mVolts

%% Axis Data
figure (1);
plot(t,AxisAngleA,t,AxisAngleX,t,AxisAngleY,t,AxisAngleZ);
xlabel('Time (s)');
ylabel('Angle (local)');
title('Axis Angle');
legend('A','X','Y','Z');

%% Accelerometer Data
figure (2);
plot(t, AccelX,t,AccelY,t,AccelZ);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Accelerometer Data');
legend('AccelX','AccelY','AccelZ');

%% Gyro Data
figure (3);
subplot(3,1,1);
plot(t, GyroX);
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
title('Gyro X');
subplot(3,1,2);
plot(t,GyroY);
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
subplot(3,1,3);
plot(t,GyroZ);
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
title('Gyro Z');

%% Accelerometer Data w/ GyroX Overlaid
figure (4);
plot(t, AccelX,t,AccelY,t,0.01*GyroX-1.8);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Accelerometer Data');
legend('AccelX','AccelY','GyroX');

%% Filter EMG Data (High Pass)

sampling_frequency = 512/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; % 200 Hz
[b,a]=butter(4,[low_cutoff,high_cutoff]); 
%[b,a]=butter(4,low_cutoff,'high');
emg_filteredCH1 = filtfilt(b,a,CH1);
emg_filteredCH2 = filtfilt(b,a,CH2);
emg_filteredCH3 = filtfilt(b,a,CH3);
emg_filteredCH4 = filtfilt(b,a,CH4);


% EMG Channel 1
figure (5);
subplot(2,2,1);
plot(t,emg_filteredCH1,t,2+0.5*AccelZ);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Quadricep Femoris');
legend('EMG','AccelZ');

% EMG Channel 2
subplot(2,2,2)
plot(t,emg_filteredCH2,t,2+0.5*AccelZ);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Bicep Femoris');

% EMG Channel 3
subplot(2,2,3)
plot(t,emg_filteredCH3,t,2+0.5*AccelZ);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Anterior Tibialis');

% EMG Channel 4
subplot(2,2,4);
plot(t,emg_filteredCH4,t,2+0.5*AccelZ);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Vastus Medialis');

%% Mean Frequency
figure(6);
f = 1000/4;
p = CH1;
mf = sum(f.*p)/sum(p);
plot(t,mf);

%% Median Frequency
figure (7);
N = length(f)