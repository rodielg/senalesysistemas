function [ e_l ] = escalaLogaritmica( A )
% A= se�al de entrada = respuesta al impulso
% e_l =Conversion a escala logaritmica normalizada
e_l = 20*log10(x/max(x))

end
function [ mm ] = filtroMediaMovil( h )
% Funci�n de suavizado con filtro de media movil.
% h = se�al pasada por transformada de Hilbert
% A mayor ventana de integraci�n , mayor va a ser el suavizado  
ventana= 5000;
% k = coeficiente del filtro
k = ones ( ventana,1)/ventana ;
mm= filter(k,1,r);
% mm= se�al suavizada con el filtro de media m�vil
end
function [ s ] = Schroeder( mm )
% s = se�al

end
