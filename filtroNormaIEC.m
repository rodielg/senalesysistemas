function [audioFilt] = filtroNormaIEC(audio,Fc)
%Realizacion del filtro norma IEC segun la banda requerida
y =audioinfo(audio);
sR = y.SampleRate;   %frecuencia de muestreo del audio introducido
x = audioread(audio);
f1 = Fc/2^(1/2);
f2=Fc*2^(1/2);
if f2 > (sR/2)     % para no superar la frecuencia de Nyquist
    f2 = sR/2;
end
filter=designfilt('bandpassiir','FilterOrder',8,'HalfPowerFrequency1',f1,'HalfPowerFrequency2',f2,'SampleRate',sR);
fvtool(filter);
audioFilt=filtfilt(filter,x);

end