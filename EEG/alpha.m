function Hd = alpha
%ALPHA Renvoie un objet filtre à temps discret.

%
% M-File généré par MATLAB (R) 7.5 et la Signal Processing Toolbox 6.8.


%Filtre
% Equiripple Bandpass conçu avec la fonction FIRPM.

% Toutes les valeurs de fréquence sont en Hz.
Fs = 500;  % frequence d'echantillognage

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

%Calculez les coefficients à l'aide de la fonction FIRPM.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
