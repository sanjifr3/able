A = csvread('STSwoWeight.csv',4,0);
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

STS = zeros(length(Time),2);
STS(:,1) = Time;



sampling_frequency = 512/2;
low_cutoff = 2/sampling_frequency; % 2 Hz
high_cutoff = 200/sampling_frequency; %200 Hz
[b,a]=butter(4,[low_cutoff,high_cutoff]); 
% [b,a]=butter(4,[low_cutoff,'high'); 
% %using emg1 as data to be filtered
% emg1_filtered = filtfilt(b,a,CH1);
emg_filteredCH1 = filtfilt(b,a,CH1);
emg_filteredCH2 = filtfilt(b,a,CH2);
% threshold = ones(25419,1);
% threshold = threshold*0.3;

% hold on
% STSMap(:,2)=STSMap(:,2)*0.4/2;
% plot(Time,emg_filteredCH1);
% 

subplot(2,1,1);
plot(Time,emg_filteredCH1,test(:,1)-1,0.5*test(:,2));
xlabel('Time (s)');
ylabel('EMG Signal');
title('Biceps Femoris');
subplot(2,1,2)
plot(Time,emg_filteredCH2,test(:,1)-1,0.2*test(:,2));
xlabel('Time (s)');
ylabel('EMG Signal');
title('Quadriceps Femoris');

figure;
plot(Time, AccelX,Time,AccelY,test(:,1)-1,0.5*test(:,2)-1.85);
xlabel('Time (s)');
ylabel('Acceleration (m/(sec^2))');
title('Accelerometer Data');
legend('AccelX','AccelY','STS');

figure;
subplot(3,1,1);
plot(Time, GyroX,test(:,1)-1,50*test(:,2));
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
title('Gyro X');
subplot(3,1,2);
plot(Time,GyroY,test(:,1)-1,50*test(:,2));
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
subplot(3,1,3);
plot(Time,GyroZ,test(:,1)-1,50*test(:,2));
xlabel('Time (s)');
ylabel('Speed (deg/sec)');
title('Gyro Z');

% legend('AccelX','AccelY');
% plot(Time,emg_filteredCH2,STSMap(:,2),0.5*STSMap(:,2));
% CH1_filter_rectified = abs(emg_filteredCH1);
% CH2_filter_rectified = abs(emg_filteredCH2);
% plot(Time,CH1_filter_rectified,STSMap(:,1),STSMap(:,2));
% plot(Time,CH2_filter_rectified,STSMap(:,1),0.5*STSMap(:,2));
% 
% 
% hold off
% % hold off
% hold on
% plot(STSMap(:,1),STSMap2);

% rectifiction
% emg1_filtered_rectified = abs(emg_filteredCH1);
% % hold on
% % plot(emg1_filtered_rectified+0.2, 'g')
% plot(Time,emg1_filtered_rectified,STSMap(:,1),0.5*STSMap(:,2));
% % hold off
% % print('plot.jpg');
% % use low-pass filter to clean up filtered, rectified signal
% 
% % plot threshold
% % hold on;
% % plot(threshold);
% % hold off;
% 
% STSMap(:,2) = STSMap(:,2)*-1.4/0.4;
% for i = 1:120;
%     if STSMap(i,2)==0
%         STSMap(i,2)= -1.8;
%     end
% end

% plot(Time, AccelX, Time, AccelY,STSMap(:,1),STSMap(:,2));
% legend('AccelX','AccelY');
% 
% plot(Time,GyroX,Time,GyroY,Time,GyroZ);
% legend('GyroX','GyroY','GyroZ');