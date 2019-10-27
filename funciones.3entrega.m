function [ e_l ] = escalaLogaritmica( A )
% A= señal de entrada = respuesta al impulso
% e_l =Conversion a escala logaritmica normalizada
e_l = 20*log10(x/max(x))

end
function [ mm ] = filtroMediaMovil( h )
% Función de suavizado con filtro de media movil.
% h = señal pasada por transformada de Hilbert
% A mayor ventana de integración , mayor va a ser el suavizado  
ventana= 5000;
% k = coeficiente del filtro
k = ones ( ventana,1)/ventana ;
mm= filter(k,1,r);
% mm= señal suavizada con el filtro de media móvil
end
function [ s ] = Schroeder( mm )
% s = señal

end
