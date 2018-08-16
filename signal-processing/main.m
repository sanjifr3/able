%% Clear/close all
% clc;
% %close all;
% clear;

%% Read Data from Everything
B = csvread('TotalData.csv',2,0);
CH1 = B(:,2); % mVolts
CH2 = B(:,3); % mVolts
CH3 = B(:,4); % mVolts
CH4 = B(:,5); % mVolts
AccelZ = B(:,6); % m/(sec^2)
time = B(:,1); % mSecs
%% Filter EMG Data (High Pass)

sampling_frequency = 1024; % Hz
low_cutoff = 5; % Hz
high_cutoff = 15; % Hz
norder = 4;
twindow = 100; % mS

%% Plot Parameters
Font = 20;
FontT = 28;

%% Tibialis Anterior
EMG = CH3;
t = time;
a = AccelZ;
t2 = time;
[EMG] = highpf(EMG,sampling_frequency,high_cutoff,norder); % High Pass Butterworth Filter
[EMG] = rect(EMG); % Rectify Signal
[EMG] = lowpf(EMG,sampling_frequency,low_cutoff,norder); % Low Pass Butterworth Filter
[EMG] = normal(EMG); % Normalize Signal
EMG(15000:16000) = EMG(14000:15000);
EMG(23038:23309) = EMG(22766:23037);
EMG(30640:31132) = EMG(30147:30639);

[a] = detrend2(a);
[a,t2] = avg(t,a,100);
a(961:1000) = a(920:959);
a(1001:1041) = a(920:960);
a(901:1200)=a(901:1200)-0.2;

figure(1);
clf;
plot(t/1000,EMG);
axis([0 190 -40 100]);
P1T = title('Tibialis Anterior EMG Data');
xlabel('Time(s)');
ylabel('% MVC');
hold on;
plot(t2/1000,-10+10*a,'r');
legend('EMG','Accel');

fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',Font)
T1 = findobj(P1T,'type','text');
set(T1,'FontSize',FontT);
set(findall(fig,'-property','LineWidth'),'LineWidth',1);

hold on;
plot([15 15],[-40 100],'k--');
hold on;
plot([30 30],[-40 100],'k--');
hold on;
plot([60 60],[-40 100],'k--');
hold on;
plot([90 90],[-40 100],'k--');
hold on;
plot([120 120],[-40 100],'k--');

figure(2);
clf;
plot(t/1000-120.5,EMG);
axis([0 3.5 -4 10]);
P2T = title('Tibialis Anterior - One STS Cycle');
P2X = xlabel('Time(s)');
P2Y = ylabel('% MVC');
hold on;
plot(t2/1000-120.5,5+20*a,'r');
P2L = legend('EMG','Accel');

fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',Font)
T2 = findobj(P2T,'type','text');
set(T2,'FontSize',FontT);
set(findall(fig,'-property','LineWidth'),'LineWidth',2);

hold on;
plot([0.9678 0.9678],[-4 10],'b--',[1.855 1.855],[-4 10],'r--',[0 124-120.5],[2.5 2.5],'k--');


figure(3);
clf;
subplot(2,2,3);
plot(t-(120.5*1000),EMG);
axis([0 3000 -4 10]);
P3T3 = title('Tibialis Anterior - STS');
xlabel('Time (mS)');
ylabel('% MVC');
hold on;
plot(t2-(120.5*1000),5+17*a,'r');

%% Quadriceps Femoris
EMG = CH1;
t = time;
a = AccelZ;
t2 = time;
[EMG] = highpf(EMG,sampling_frequency,high_cutoff,norder); % High Pass Butterworth Filter
[EMG] = rect(EMG); % Rectify Signal
[EMG] = lowpf(EMG,sampling_frequency,low_cutoff,norder); % Low Pass Butterworth Filter
[EMG] = normal(EMG); % Normalize Signal
EMG(15000:16000) = EMG(14000:15000);
EMG(23038:23309) = EMG(22766:23037);
EMG(30640:31132) = EMG(30147:30639);
[a] = detrend2(a);
[a,t2] = avg(t,a,100);
a(961:1000) = a(920:959);
a(1001:1041) = a(920:960);
a(901:1200)=a(901:1200)-0.2;

subplot(2,2,1);
plot(t-(120.5*1000),EMG);
axis([0 3000 -10 65]);
P3T1 = title('Quadriceps Femoris - One STS Cycle');
xlabel('Time (mS)');
ylabel('% MVC');
hold on;
plot(t2-(120.5*1000),25+75*a,'r');

%% Bicep Femoris
EMG = CH2;
t = time;
a = AccelZ;
t2 = time;
[EMG] = highpf(EMG,sampling_frequency,high_cutoff,norder); % High Pass Butterworth Filter
[EMG] = rect(EMG); % Rectify Signal
[EMG] = lowpf(EMG,sampling_frequency,low_cutoff,norder); % Low Pass Butterworth Filter
[EMG] = normal(EMG); % Normalize Signal
EMG(15000:16000) = EMG(14000:15000);
EMG(23038:23309) = EMG(22766:23037);
EMG(30640:31132) = EMG(30147:30639);
[a] = detrend2(a);
[a,t2] = avg(t,a,100);
a(961:1000) = a(920:959);
a(1001:1041) = a(920:960);
a(901:1200)=a(901:1200)-0.2;

subplot(2,2,2);
plot(t-(120.5*1000),EMG);
axis([0 3000 -10 65]);
P3T2 = title('Bicep Femoris - One STS Cycle');
xlabel('Time (mS)');
ylabel('% MVC');
hold on;
%plot(t2-(120.5*1000),25+75*a,'r');

%% Vastus Medialis
EMG = CH4;
t = time;
a = AccelZ;
t2 = time;
[EMG] = highpf(EMG,sampling_frequency,high_cutoff,norder); % High Pass Butterworth Filter
[EMG] = rect(EMG); % Rectify Signal
[EMG] = lowpf(EMG,sampling_frequency,low_cutoff,norder); % Low Pass Butterworth Filter
[EMG] = normal(EMG); % Normalize Signal
EMG(15000:16000) = EMG(14000:15000);
EMG(23038:23309) = EMG(22766:23037);
EMG(30640:31132) = EMG(30147:30639);
[a] = detrend2(a);
[a,t2] = avg(t,a,100);
a(961:1000) = a(920:959);
a(1001:1041) = a(920:960);
a(901:1200)=a(901:1200)-0.2;

subplot(2,2,4);
plot(t-(120.5*1000),EMG);
axis([0 3000 -10 5]);
P3T2 = title('Vastus Medialis - One STS Cycle');
xlabel('Time (mS)');
ylabel('% MVC');
hold on;
%plot(t2-(120.5*1000),25+75*a,'r');





fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',Font)
T2 = findobj(P2T,'type','text');
set(T2,'FontSize',FontT);
set(findall(fig,'-property','LineWidth'),'LineWidth',1);

hold on;
%plot([0.9678 0.9678],[-4 10],'b--',[1.855 1.855],[-4 10],'r--',[0 124-120.5],[2.5 2.5],'k--');


% figure(3);
% clf;
% plot(t/1000-120,EMG);
% axis([0 70 -2 15]);
% P3T = title('Tibialis Anterior - STS');
% P3X = xlabel('Time(s)');
% P3Y = ylabel('% MVC');
% hold on;
% plot(t2/1000-120,0.8+6*a,'r');
% P2L = legend('EMG','Accelerometer');
% 
% fig=gcf;
% set(findall(fig,'-property','FontSize'),'FontSize',Font)
% T3 = findobj(P3T,'type','text');
% set(T3,'FontSize',FontT);
% set(findall(fig,'-property','LineWidth'),'LineWidth',1);
