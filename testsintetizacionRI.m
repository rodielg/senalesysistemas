% respuesta al impulso de Great Hall sacada de internet, para plotearla y
% compararla con la nuestra sintetizada
[y,Fs] = audioread('x00y00.wav');
plot(y,'r')
hold on

[oct,ter] = sintetizacionFinal(1,0.00000001,2);

plot(oct,'c')
% hold on
% plot(ter,'m')