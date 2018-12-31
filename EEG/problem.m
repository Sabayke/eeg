%part-1
clc
clear all
close all
load EEG1_1c31;% loading data
Ts=2;% sampling period
Fs=500;%sampling frequency
[N,nu]=size(data);%obtain size of data
t=(1:N)*Ts;%generates time vector
h=figure
plot(t,data,'r');% plot of 16 channels together
title('EEG DATA')
grid on
h1=figure
plot(t,data(:,1), 'b-')
figure(h1);hold on
plot(t,data(:,5),  'r-')
figure(h1);hold on
plot(t,data(:,10), 'm-')
figure(h1);hold on
plot(t,data(:,15), 'c-')
figure(h1);hold on
plot(t,data(:,16), 'k-')
legend('Channel 1', 'Channel 5', 'Channel 10', 'Channel 15','channel 16');

% part-2
y=fft(data);% fft of data
ps1=abs(y).^2;% power spectrum using fft
freq=(1:N)*Fs/N;%frequency vector
h2=figure
plot(freq,20*log(ps1),'b')
title('POWER SPECTRUM USING FFT METHOD')
[ps2,freq]=pwelch(data,chebwin(128,100),[],N,Fs);% plotting half of the power spectrum with 50% overlap and chebwin window of length 128
h3=figure 
plot(freq,10*log10(ps2),'r')
title('POWER SPECTRUM USING PWELCH METHOD')


% part-5
%SPECTROGRAM of channel 1
[S1,F,T] = spectrogram(data(:,1),chebwin(128,100),0,Fs);
S1=abs(S1);
h5=figure;
mesh(T,F,S1);
xlabel('Time (sec)','FontSize',14);
ylabel('Frequency (Hz)','FontSize',14);
zlabel('S1','FontSize',14);
h6=figure;
contour(T,F,S1);
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
title('channel 1');


% spectrogram of channel 10
[S10,F,T] = spectrogram(data(:,10),chebwin(128,100),0,Fs);
S10=abs(S10);
h7=figure;
mesh(T,F,S10);
xlabel('Time (sec)','FontSize',14);
ylabel('Frequency (Hz)','FontSize',14);
zlabel('S10','FontSize',14);
h8=figure;
contour(T,F,S10);
xlabel('Time (sec)');
ylabel('Frequency (Hz)');
title('channel 10');


% part -3

% NOTE: filters designed using FDA tool box
% because of zero padding more points are observed
%DELTA

Fs = 500;  % Sampling Frequency
Fpass = 0;               % Passband Frequency
Fstop = 4;               % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor
% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);
% Calculate the coefficients using the FIRPM function.
b1 = firpm(N, Fo, Ao, W, {dens});
Hd1 = dfilt.dffir(b1);
x1=filter(Hd1,data);
h9=figure
plot(t,x1,'r')
title('waveform for DELTA band')
%frequency spectrum of DELTA
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Next power of 2 from length of x1
Y1 = fft(x1,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% Plot single-sided amplitude spectrum
h10=figure
plot(f,2*abs(Y1(1:NFFT/2))) 
title('Single-Sided Amplitude Spectrum of DELTA x1(t)')
xlabel('Frequency (Hz)')
ylabel('|Y1(f)|')




%THETA- BAND PASS FILTER (4-7)

Fs = 500;  % Sampling Frequency
Fstop1 = 3.5;             % First Stopband Frequency
Fpass1 = 4;               % First Passband Frequency
Fpass2 = 7;               % Second Passband Frequency
Fstop2 = 7.5;             % Second Stopband Frequency
Dstop1 = 0.001;           % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.0001;          % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);
% Calculate the coefficients using the FIRPM function.
b2 = firpm(N, Fo, Ao, W, {dens});
Hd2 = dfilt.dffir(b2);
x2=filter(Hd2,data);
h11=figure
plot(t,x2,'r')
title('waveform for THETA band')
%FREQUENCY SPECTRUM OF THETA 
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Next power of 2 from length of x2
Y2 = fft(x2,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% Plot single-sided amplitude spectrum THETA 
h12=figure
plot(f,2*abs(Y2(1:NFFT/2))) 
title('Single-Sided Amplitude Spectrum of THETA x2(t)')
xlabel('Frequency (Hz)')
ylabel('|Y2(f)|')



%ALPHA BAND PASS FILTER (8-12)

Fs = 500;  % Sampling Frequency
Fstop1 = 7.5;             % First Stopband Frequency
Fpass1 = 8;               % First Passband Frequency
Fpass2 = 12;              % Second Passband Frequency
Fstop2 = 12.5;            % Second Stopband Frequency
Dstop1 = 0.0001;          % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.0001;          % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);
% Calculate the coefficients using the FIRPM function.
b3  = firpm(N, Fo, Ao, W, {dens});
Hd3 = dfilt.dffir(b3);
x3=filter(Hd3,data);
h13=figure
plot(t,x3,'r')
title('waveform for ALPHA band')
%FREQUENCY SPECTRUM OF ALPHA BAND
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Next power of 2 from length of x3
Y3 = fft(x3,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% Plot single-sided amplitude spectrum ALPHA
h14=figure
plot(f,2*abs(Y3(1:NFFT/2))) 
title('Single-Sided Amplitude Spectrum of ALPHA x3(t)')
xlabel('Frequency (Hz)')
ylabel('|Y3(f)|')


%BETA  BAND PASS FILTER (12-30)

Fs = 500;  % Sampling Frequency

Fstop1 = 11.5;            % First Stopband Frequency
Fpass1 = 12;              % First Passband Frequency
Fpass2 = 30;              % Second Passband Frequency
Fstop2 = 30.5;            % Second Stopband Frequency
Dstop1 = 0.0001;          % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 0.0001;          % Second Stopband Attenuation
dens   = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function
b4   = firpm(N, Fo, Ao, W, {dens});
Hd4 = dfilt.dffir(b4);
x4=filter(Hd4,data);
h15=figure
plot(t,x4,'r')
title('waveform for BETA band')
%Frequency spectrum of BETA band
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Next power of 2 from length of x4
Y4 = fft(x4,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% Plot single-sided amplitude spectrum BETA
h16=figure
plot(f,2*abs(Y4(1:NFFT/2))) 
title('Single-Sided Amplitude Spectrum of BETA x4(t)')
xlabel('Frequency (Hz)')
ylabel('|Y4(f)|')
















