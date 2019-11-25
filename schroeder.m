function y = schroeder(x)
%% Calcula la integral de Schroeder de la señal recibida
% desde inicio al fin, y convierte a dB
    y = fliplr(cumsum(fliplr(x'.^2))); 
    y = 10*log10(y'./max(abs(y)));  
end