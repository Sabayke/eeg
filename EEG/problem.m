%partie 1
clc
clear all
close all
load EEG1_1c31;% chargé les données dans le fichier EEG1_1c31
Ts=2;% ma periode =2
Fs=500;% ma frequence
[N,nu]=size(data);%stocker les donnés dans un tableau
t=(1:N)*Ts;%generer un vecteur 
h=figure
plot(t,data,'r');% afficher les 16 canaux qui se trouve dans le cerveau
title('Donnee EEG ') le titre %faire attention avec l'encodage utf-8 
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
legend('Canal 1', 'Canal 5', 'Canal 10', 'Canal 15','canal 16');

% partie 2
y=fft(data);% transformé de fourier rapide des données voir (fast fourier transformation)
ps1=abs(y).^2;% spectre de puissance pour la TFF
freq=(1:N)*Fs/N;%vecteur de frequence
h2=figure
plot(freq,20*log(ps1),'b')
title('SPECTRE DE PUISSANCE UTILISANT LA METHODE FFT')
[ps2,freq]=pwelch(data,chebwin(128,100),[],N,Fs);% afficher les données on autilisé la methode de pwelch 
h3=figure 
plot(freq,10*log10(ps2),'r')
title('spectre de puissance methode de pwelch')


% part-5
%SPECTROGRAME de la canal 1
[S1,F,T] = spectrogram(data(:,1),chebwin(128,100),0,Fs);
S1=abs(S1);
h5=figure;
mesh(T,F,S1);
xlabel('Temps (sec)','FontSize',14);
ylabel('Frequence (Hz)','FontSize',14);
zlabel('S1','FontSize',14);
h6=figure;
contour(T,F,S1);
xlabel('Temps (sec)');
ylabel('Frequence (Hz)');
title('canal 1');


% spectrograme canal 10
[S10,F,T] = spectrogram(data(:,10),chebwin(128,100),0,Fs);
S10=abs(S10);
h7=figure;
mesh(T,F,S10);
xlabel('Temps (sec)','FontSize',14);
ylabel('Frequence (Hz)','FontSize',14);
zlabel('S10','FontSize',14);
h8=figure;
contour(T,F,S10);
xlabel('Temps (sec)');
ylabel('Frequence (Hz)');
title('canal 10');


% parie 3

%REMARQUE: filtres conçus à l'aide de la boîte à outils FDA
% en raison de zéro remplissage plus de points sont observés
%DELTA

Fs = 500;  % la frequence
Fpass = 0;               % Passband Frequence
Fstop = 4;               % Stopband Frequence
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Densite de facteur
% Calculez l'ordre à partir des paramètres à l'aide de FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);
% Calculez les coefficients à l'aide de la fonction FIRPM.
b1 = firpm(N, Fo, Ao, W, {dens});
Hd1 = dfilt.dffir(b1);
x1=filter(Hd1,data);
h9=figure
plot(t,x1,'r')
title('waveform de la bande DELTA')
%spectre de fréquence de DELTA
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Prochaine puissance de 2 de longueur de x1
Y1 = fft(x1,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
%Tracer le spectre d'amplitude unilatéral
h10=figure
plot(f,2*abs(Y1(1:NFFT/2))) 
title("Spectre d'amplitude simple face d'ALPHA x1 (t)")
xlabel('Frequence (Hz)')
ylabel('|Y1(f)|')




%THETA- filtre pass-bande(4-7)

Fs = 500;  % Sampling Frequency
Fstop1 = 3.5;             % Première fréquence de bande d'arrêt
Fpass1 = 4;               % Première fréquence de bande passante
Fpass2 = 7;               % Deuxième fréquence de bande passante
Fstop2 = 7.5;             % Deuxième fréquence de bande d'arrêt
Dstop1 = 0.001;           % Première atténuation de la bande d'arrêt
Dpass  = 0.057501127785;  % Ondulation de la bande passante
Dstop2 = 0.0001;          % Atténuation de la seconde bande d'arrêt
dens   = 20;              % Facteur de densité

% Calculez l'ordre à partir des paramètres à l'aide de FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);
% Calculez les coefficients à l'aide de la fonction FIRPM.
b2 = firpm(N, Fo, Ao, W, {dens});
Hd2 = dfilt.dffir(b2);
x2=filter(Hd2,data);
h11=figure
plot(t,x2,'r')
title('waveform de la bande THETA')
%SPECTRE DE FREQUENCE DE THETA
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Prochaine puissance de 2 de longueur de x2
Y2 = fft(x2,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% Tracé du spectre d'amplitude unilatéral THETA 
h12=figure
plot(f,2*abs(Y2(1:NFFT/2))) 
title("l'amplitude du Spectre  THETA x2(t)")
xlabel('Frequence (Hz)')
ylabel('|Y2(f)|')



%ALPHA BAND PASS FILTER (8-12)

Fs = 500;  % Fréquence d'échantillonnage
Fstop1 = 7.5;             % Première fréquence de bande d'arrêt
Fpass1 = 8;               % Première fréquence de bande passante
Fpass2 = 12;              % Deuxième fréquence de bande passante
Fstop2 = 12.5;            % Deuxième fréquence de bande d'arrêt
Dstop1 = 0.0001;          % Première atténuation de la bande d'arrêt
Dpass  = 0.057501127785;  % Ondulation de la bande passante
Dstop2 = 0.0001;          % Atténuation de la seconde bande d'arrêt
dens   = 20;              % Facteur de densité

% Calculez l'ordre à partir des paramètres à l'aide de FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);
% Calculez les coefficients à l'aide de la fonction FIRPM.
b3  = firpm(N, Fo, Ao, W, {dens});
Hd3 = dfilt.dffir(b3);
x3=filter(Hd3,data);
h13=figure
plot(t,x3,'r')
title('waveform de la bande ALPHA')
%SPECTRE DE FREQUENCE DE LA BANDE ALPHA
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Prochaine puissance de 2 de longueur de x3
Y3 = fft(x3,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% Tracé du spectre d'amplitude unilatéral ALPHA
h14=figure
plot(f,2*abs(Y3(1:NFFT/2))) 
title("Spectre d'amplitude simple face d'ALPHA x3 (t)")
xlabel('Frequence (Hz)')
ylabel('|Y3(f)|')


%FILTRE DE PASSAGE DE BANDE BANDE (12-30)

Fs = 500;  % Fréquence d'échantillonnage

Fstop1 = 11.5;            % Première fréquence de bande d'arrêt
Fpass1 = 12;              % Première fréquence de bande passante
Fpass2 = 30;              % Deuxième fréquence de bande passante
Fstop2 = 30.5;            % Deuxième fréquence de bande d'arrêt
Dstop1 = 0.0001;          % Première atténuation de la bande d'arrêt
Dpass  = 0.057501127785;  % Ondulation de la bande passante
Dstop2 = 0.0001;          % Atténuation de la seconde bande d'arrêt
dens   = 20;              % Facteur de densité

% Calculez l'ordre à partir des paramètres à l'aide de FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

%Calculer les coefficients à l'aide de la fonction FIRPM
b4   = firpm(N, Fo, Ao, W, {dens});
Hd4 = dfilt.dffir(b4);
x4=filter(Hd4,data);
h15=figure
plot(t,x4,'r')
title('waveform de lan bande BETA')
%Spectre de fréquence de la bande bêta
L=10;
Fs=500;
NFFT = 2^nextpow2(L); % Prochaine puissance de 2 de longueur de x4
Y4 = fft(x4,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% Tracé du spectre d'amplitude sur un seul côté BETA
h16=figure
plot(f,2*abs(Y4(1:NFFT/2))) 
title("Spectre d'amplitude simple face de BETA x4 (t)")
xlabel('Frequence (Hz)')
ylabel('|Y4(f)|')
















