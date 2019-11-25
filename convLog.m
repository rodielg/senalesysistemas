function [y] = convLog(a)
%Normalizacion de la senal y paso de la misma a escala logaritmica
y = 20*log10(abs(a)/max(abs(a));
end
