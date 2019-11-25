[BandasOct,BandasTer] = filtros('Sine Sweep.wav');
% [k,j] = sintetizacionFinal(0.4,0.00000000000000001,2);
% l = audioread('x00y07.wav');
% 
% Fs=96000; %Defino Fs como la frecuencia de muestreo
% Ts = 1/Fs;
% t = 0:Ts:2;
% t = t(1:end-1);
% e = lundeby(t,k,Fs)
% [t_plot,w,h_t_MAF,t_plot_shroeder,z] = suavizadoconlim(l,Fs);
% aplico los 3 suavizados con lundeby para obtener el extremo de schroeder
% plot(t,l)
% hold on
% plot(t,k,'r')
% [EDT,T10,T20,T30,C80,D50] = calc_parametros(z,t_plot_shroeder,l,Fs)
% calculados todos los parametros
