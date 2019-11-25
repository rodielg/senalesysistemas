function [EDT,T10,T20,T30,C80,D50] = calc_parametros(h_t_suavizada,t_plot_schroeder,Resp_imp,Fs)
%Inputs:
%   h_t_suavizada = Vector de valores de la senal suavizada
%   t_plot_schroeder = Vector tiempo de Schroeder
%Output:
%   EDT = Early Decay Time en [s]
%   T10 = Parametro T10 en [s]
%   T20 = Parametro T20 en [s]
%   T30 = Parametro T30 en [s]
%   C80 = Parametro C80
%   D50 = Parametro D50
%   Calcula los tiempos de reverberacion segun la norma ISO-3382
%   y los parametros energeticos de Claridad (C80) y Definicion (D50).

global b m;
x_i = t_plot_schroeder;
y_i = h_t_suavizada;
[C80,D50] = energia(Resp_imp,Fs); %Llamo a la subfunción para calcular los parámetros energeticos
%% EDT
%Busco cuando la amplitud es maxima y cuando disminuye 10 db
x1_EDT = find(y_i < max(y_i),1,'first');
x2_EDT = find(y_i < (max(y_i)-10),1,'first');
y_i_EDT = (y_i(x1_EDT:x2_EDT));
x_i_EDT = (x_i(x1_EDT:x2_EDT));%Recorto ambos arrays
[b.EDT,m.EDT] = cuad_min(x_i_EDT,y_i_EDT); %aplico cuadrados minimos
EDT = (-60-b.EDT)/m.EDT;%despejo la variable independiente

%% T10
x1_T10 = find(y_i < (max(y_i)-5),1,'first');%Busco el decaimiento   
x2_T10 = find(y_i < (max(y_i)-15),1,'first');    %Recorto la señal desde y=-5 hasta y=-15
x_i_T10 = (x_i(x1_T10:x2_T10));%Recorto
y_i_T10 = (y_i(x1_T10:x2_T10));
[b.T10,m.T10] = cuad_min(x_i_T10,y_i_T10);%Cuadrados Min
T10 = (-60-b.T10)/m.T10;%Despejo el tiempo 

%% T20
x1_T20 = find(y_i < (max(y_i)-5),1,'first');
x2_T20 = find(y_i < (max(y_i)-25),1,'first');
x_i_T20 = (x_i(x1_T20:x2_T20));
y_i_T20 = (y_i(x1_T20:x2_T20));
[b.T20,m.T20] = cuad_min(x_i_T20,y_i_T20);
T20 = (-60-b.T20)/m.T20;

%% T30
x1_T30 = find(y_i < (max(y_i)-5),1,'first');
x2_T30 = find(y_i < (max(y_i)-35),1,'first');
x_i_T30 = (x_i(x1_T30:x2_T30));
y_i_T30 = (y_i(x1_T30:x2_T30));
[b.T30,m.T30] = cuad_min(x_i_T30,y_i_T30);
T30 = (-60-b.T30)/m.T30;

end
%% C80 y D50
function [C80,D50] = energia(Resp_imp,Fs)
%       Parametros de energia
%       Calcula los parametros energeticos de claridad y definicion
%       segun la norma ISO-3382.
    
    
    p = Resp_imp.^2;      %Respuesta al Impulso al Cuadrado
    limit50 = (0.05*Fs);  %Cantidad de muestras en 50ms 
    limit80 = (0.08*Fs);  %Cantidad de muestras en 80ms
    
    C80 = 10*log10(trapz(p(1:limit80))/trapz(p(limit80:end)));    
    D50 = 100*(sum(p(1:limit50))/sum(p(1:end))); 
end

