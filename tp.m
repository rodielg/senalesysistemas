function x= sineSweep(T,Fs,f1,f2);
%T duracion del Sine. Fs: Cantidad de muestras por segundo. f1: frecuencia
%inferior, f2: frecuencia superior
N = T*Fs;
y = 0:1/Fs:T;
% y = linspace(0,T,N);
w1 = 2*pi*f1;
w2 = 2*pi*f2;
K = (T*w1)/(log(w2/w1));
L = T/(log(w2/w1));
x = sin(K*((exp(y/L))-1));
end

%OTRO ARCHIVO
Sine = sineSweep(10,44100,20,20000);
filename = 'SineSweep1.wav';
audiowrite(filename,Sine,44100);
clear Sine Fs;
