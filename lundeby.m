function [encuentro] = lundeby(t,h_t,Fs)
%Obtencion del extremo de integracion de Schroeder a traves del metodo de
%Lundeby

respImp = h_t;
total = length(h_t);
tail = round((total*90)/100);
colaRuido = (respImp(tail:end));
promRuido = mean(colaRuido);%Valor promedio de la cola de ruido

maximo = find(respImp == max(respImp),1,'first');
minimo = find(respImp < (promRuido+10),1,'first');
h_caida = (respImp(maximo:minimo))'; %corta señal de max a prom ruido
t_caida = t(maximo:minimo); %MISMO EN TIEMPO
[b_caida,m_caida] = cuad_min(t_caida,h_caida); %regresion lineal de eso
recta_caida = b_caida + m_caida .* t; %recta de regresion lineal

encuentro = find(recta_caida < promRuido,1,'first'); %punto de cruce regresion lineal y ruido

if encuentro == 0
   encuentro = respImp(end)
end

end