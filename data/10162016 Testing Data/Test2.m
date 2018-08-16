%% Research Sites
% MatLab Files: http://www.sce.carleton.ca/faculty/chan/matlab/matlab_library.htm


%% Clear/close all
clc;
close all;
clear;
%% Read Data
% A = csvread('STSwoWeight.csv',4,0);
% A = csvread('STSwweight.csv',4,0);
% A = csvread('STSwHandAssist.csv',4,0);
A = csvread('STSCalves.csv',4,0);
% A = csvread('STSCalveswHandAssist.csv',4,0);
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
AccelY = A(:,25); % m/(sec^2)*
Time = A(:,39); % mSecs
Time = Time/1000; % Secs

%% Axis Data
figure (1);
plot(Time,AxisAngleA,Time,AxisAngleX,Time,AxisAngleY,Time,AxisAngleZ);
xlabel('Time (s)');
ylabel('Angle (local)');
title('Axis Angle');
legend('A','X','Y','Z');

%% Accelerometer Data
figure (2);
plot(Time, AccelX,Time,AccelY);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Accelerometer Data');
legend('AccelX','AccelY');

%% Gyro Data
figure (3);
subplot(3,1,1);
plot(Time, GyroX);
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
title('Gyro X');
subplot(3,1,2);
plot(Time,GyroY);
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
subplot(3,1,3);
plot(Time,GyroZ);
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
title('Gyro Z');

%% Accelerometer Data w/ GyroX Overlaid
figure (4);
plot(Time, AccelX,Time,AccelY,Time,0.01*GyroX-1.8);
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

% EMG Channel 1
figure (5);
subplot(2,1,1);
plot(Time,emg_filteredCH1);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Biceps Femoris High Pass');

% EMG Channel 2
subplot(2,1,2)
plot(Time,emg_filteredCH2);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Quadriceps Femoris High Pass');

%% Rectified EMG Data (High Pass)

sampling_frequency = 512/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; % 200 Hz
[b,a]=butter(4,[low_cutoff,high_cutoff]); 
% [b,a]=butter(4,[low_cutoff,'high');
emg_filteredCH1 = filtfilt(b,a,CH1);
emg_filteredCH2 = filtfilt(b,a,CH2);
CH1_filter_rectified = abs(emg_filteredCH1);
CH2_filter_rectified = abs(emg_filteredCH2);

% EMG Channel 1
figure (6);
subplot(2,1,1);
plot(Time,CH1_filter_rectified);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)')
title('Biceps Femoris High Pass Rectified');

% EMG Channel 2
subplot(2,1,2);
plot(Time,CH2_filter_rectified);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Quadriceps Femoris High Pass Rectified');


%% Filter EMG Data (Low Pass)

sampling_frequency = 512/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
[b,a]=butter(4,low_cutoff,'low');
CH1_2 = detrend(CH1);
CH2_2 = detrend(CH2);
rec_CH1 = abs(CH1_2);
rec_CH2 = abs(CH2_2);
CH1_filtered = filtfilt(b,a,rec_CH1);
CH2_filtered = filtfilt(b,a,rec_CH2);

% EMG Channel 1
figure (7);
subplot(2,1,1);
plot(Time,CH1_filtered);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Biceps Femoris Low Pass Rectified');

% EMG Channel 2
subplot(2,1,2)
plot(Time,CH2_filtered);
xlabel('Time (s)');
ylabel('EMG Signal (mVolts)');
title('Quadriceps Femoris Low Pass Rectified');

% onset time
%onset_time = onset(CH1_filtered,500,1000,1000,5000);

% Fourier Transform (FFT) of the EMG Signals
%mfCH1 = psanalyse(CH1_2,sampling_frequency);
%mfCH2 = psanalyse(CH2_2,sampling_frequency);

% Save
% save 'filteremg.dat' filter_y - ascii
%% GyroX Filtered
% 
% GX = zeros(length(GyroX),1);
% for i=1:length(GX)
%     
%     if GyroX(i) > 5
%         GX(i) = GyroX(i);
%     elseif GyroX(i) >= -5
%         GX(i) = 0;
%     else
%         GX(i) = GyroX(i);
%     end
% end

%% AccelX Filtered

% AX = zeros(length(AccelX),1);
% for i = 1:length(AX)
%     if AccelX(i)> -1.5
%         AX(i) = -1.475;
%     elseif AccelX(i)> -2.04
%         AX(i) = AccelX(i);
%     else
%         AX(i) = -2.09;
%     end
% end
% 
% plot(Time,AX);
% 
% i = 1;
% while i <= length(AX)
%     if AX(i)~= -2.09 && AX(i) ~= -1.475
%         y1 = AX(i-1);
%         y2 = 0;
%         j = i+1;
%         terminate = 0;
%         while y2 == 0 && terminate == 0;
%             if AX(j) == -2.09 && AX(j) == -1.475
%                 y2 = AX(j);
%             elseif j == length(AX)
%                 terminate = 1;
%             else
%                 j = j+1;
%             end
%         end
%         m = (y2-y1)/(j-i);
%         b = y1-m*i;
%         while i ~= j
%             AX(i) = m*i+b;
%             i = i+1;
%         end
%     else
%         i = i+1;
%     end
% end
% figure (8);
% plot(Time,AX);
        
