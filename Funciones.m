function [funcion] = Funciones()
%Funcion para guardar todas las funciones que hicimos en un struct
    funcion.sineSweep=@SineSweep;
    funcion.ruidoRosa=@ruidoRosa;
    funcion.filtroInverso=@filtroInverso;
    funcion.filtroInvertido=@filtroInvertido;
    funcion.filtroNormaIEC=@filtroNormaIEC;
    funcion.RI=@RI;
    funcion.sintetizacionRI=@sintetizacionRI;]
    funcion.rtaAlImpulso=@rtaAlImpulso;
    funcion.convLog=@convLog
    
end

function x = ruidoRosa(duracion,fs);
%Duracion en segundos. fs en Hertz
%Genera un Ruido Rosa sintetizado
%%
Nx = duracion*fs; %Obtengo cantidad de muestras del audio
B = [0.049922035 -0.095993537 0.050612699 -0.004408786];
A = [1 -2.494956002 2.017265875 -0.522189400];
nT60 = round(log(1000)/(1-max(abs(roots(A)))));
v = randn(1,Nx+nT60);
x = filter(B,A,v);
x = x(nT60+1:end);
end
function k = filtroInverso(T,Fs,f1,f2);
%% Obtencion del Filtro Inverso del SineSweep
%Inputs:
% T = Tiempo en [s]
% Fs = Frecuencia de muestreo en [Hz]
% f1,f2 = Frecuencias limite inferior y superior del SineSweep [Hz]
x = filtroInvertido(T,Fs,f1,f2);
y = sineSweep(T,Fs,f1,f2);
w1 = 2*pi*f1;
w2 = 2*pi*f2;
K = (T*w1)/(log(w2/w1));
L = T/(log(w2/w1));
w = (K/L)*exp(y/L);
m = w1./(2*pi*w);
k = m.*x;
end
function [h] = RI(k,y)
%% Obtencion de la respuesta al impulso a traves de la grabacion y el filtro
%inverso
K=fft(k);
H=Y.*K;
h=ifft(H);
end
function [suma] = sintetizacionRI(f,T60,A,t)
%UN
t=t:-1/44100:0;
t=t(1:end-1);
pi1=(-log(10^(-3)))/T60;
y=A*(exp(pi1*t)).*cos(2*pi*f*t);
suma=sum(y);
end
function [audioFilt] = filtroNormaIEC(audio)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Fc=1000;
f1 = Fc/2^(1/2);
f2=Fc*2^(1/2);
filter=designfilt('bandpassiir','FilterOrder',7,'HalfPowerFrequency1',f1,'HalfPowerFrequency2',f2,'SampleRate',44100);
fvtool(filter);
audioFilt=filtfilt(filter,audio);
end
function x= filtroInvertido(T,Fs,f1,f2)
N = T*Fs;
%y = T:(-1)/Fs:0;
y = linspace(0,T,N);
w1 = 2*pi*f1;
w2 = 2*pi*f2;
K = (T*w1)/(log(w2/w1));
L = T/(log(w2/w1));
x = sin(K*((exp(y/L))-1));
end
function x= sineSweep(T,Fs,f1,f2);
%T duracion del Sine. Fs: Cantidad de muestras por segundo. f1: frecuencia
%inferior, f2: frecuencia superior
N = T*Fs;
%y = 0:1/Fs:(T-1/Fs);
y = linspace(0,T,N);
w1 = 2*pi*f1;
w2 = 2*pi*f2;
K = (T*w1)/(log(w2/w1));
L = T/(log(w2/w1));
x = sin(K*((exp(y/L))-1));
x = x*0.9;
%audiowrite('SineSweep2.wav',x,44100)
end
function j = rtaAlImpulso(archivoLeer,archivoEscribir,Device)

%1ra Parte
%Creo un archivo para que lea (SineSweep), otro para que escriba (Respuesta
%al impulso) y creo el objeto audioPlayerRecorder
fileReader = dsp.AudioFileReader(archivoLeer,'SamplesPerFrame',512)
fs = fileReader.SampleRate;

fileWriter = dsp.AudioFileWriter(archivoEscribir,'SampleRate',fs);

aPR = audioPlayerRecorder('SampleRate',fs,'Device',Device)



%2da Parte
%Leo la senal del SineSweep, lo reproduzco y grabo a la vez en el archivo
%de respuesta al impulso


while ~isDone(fileReader)
    audioToPlay = fileReader();
   
    [audioRecorded,nUnderruns,nOverruns] = aPR(audioToPlay);
   
    fileWriter(audioRecorded)
   
    if nUnderruns > 0
        fprintf('Audio player queue was underrun by %d samples.\n',nUnderruns);
    end
    if nOverruns > 0
        fprintf('Audio recorder queue was overrun by %d samples.\n',nOverruns);
    end
end

release(fileReader)
release(fileWriter)
release(aPR)
end

function [conLog] = convlog(a)

convlog = 20*log(a/(max(a)))
end
