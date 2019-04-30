function Hd = beta
%BETA Renvoie un objet filtre à temps discret.

Fs = 500;  % Sampling Frequency

Fstop1 = 11.5;            % Première fréquence de bande d'arrêt
Fpass1 = 12;              % Première fréquence de bande passante
Fpass2 = 30;              % Deuxième fréquence de bande passante
Fstop2 = 30.5;            % Deuxième fréquence de bande d'arrêt
Dstop1 = 0.0001;          % Première atténuation de la bande d'arrêt
Dpass  = 0.057501127785;  % Ondulation de la bande passante
Dstop2 = 0.0001;          % Atténuation de la seconde bande d'arrêt
dens   = 20;              % Facteur de densité

%Calculez l'ordre à partir des paramètres à l'aide de FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% 
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
