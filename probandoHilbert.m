h_t = audioread('x00y07.wav');
info = audioinfo('x00y07.wav');
Fs = info.SampleRate;
Ts = 1/Fs;
duracion = info.Duration;
t_plot = 0:Ts:duracion;
t_plot = t_plot(1:end-1);

% %% Hilbert 
% 
A_t = abs(hilbert(h_t));%A(t)
E_t = 20*log10(A_t/max(A_t)); %E(t) Envolvente de hilbert en log scale
plot(t_plot,E_t,'c')
hold on

%PLOTEO DE SENAL ORIGINAL
% Convh_t = 20*log10(abs(h_t)/max(abs(h_t)));
% plot(t_plot,Convh_t,'g');

% %% Moving Average Filter
windowWidth = 2000; %Ventana de integracion (A mayor valor, mayor suavisado)
kernel = ones(windowWidth,1) / windowWidth;
h_t_MAF = filter(kernel, 1, E_t);
plot(t_plot,h_t_MAF,'r')