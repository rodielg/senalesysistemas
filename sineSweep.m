function [SineSweep,Fs] = sineSweep(f1, f2, Time, SampleRate)
%SineSweep Summary of this function goes here
%   Detailed explanation goes here

w1 = 2*pi*f1;
w2 = 2*pi*f2;

T = Time*SampleRate;
S = linspace(0,Time,T);
K = (Time*w1)/(log(w2/w1));
L = (Time/(log(w2/w1)));

SineSweep = sin(K*(exp(S/L)-1));
SineSweep = SineSweep*0.9;  %Ajuste por clipeo
Fs = SampleRate;
%plot(SineSweep,T)
%audiowrite('Sine Sweep.wav',SineSweep,Fs);
end

