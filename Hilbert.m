function [ s ] = Hilbert(x)
%El argumento de entrada es la se�al que se quiere suavizar.
%El argumento de salida es la transformada de Hilbert de dicha se�al
t=linspace(1,length(x));
c=1/(t*pi);
s=conv(x,c);
end

