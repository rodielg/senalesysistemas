function [y] = sintetizacionRI(f,T60,A,t)
%sintetizacion RI para una sola frecuencia central
%Ingrese la frecuencia central, el t60, la amplitud y el tiempo deseado
%para la sintetizacion de la respuesta al impulso
%frecuencias centrales de octava y tercio de octava en pagina 23 UNE-EN
%61260
%   Detailed explanation goes here
t=t:-1/96000:0;
t=t(1:end-1);
centralesOctava = [31.5,63,125,250,500,1000,2000,4000,8000,16000];
pi1=(-log(10^(-3)))/T60;
y=A*(exp(pi1*t)).*cos(2*pi*centralesOctava(1)*t);

end
