function [b , m , Se] = cuad_min(t_plot_shroeder,shroeder)
%   Inputs: 
%       t_plot_shroeder = Vector de valores en la abscisa x
%       shroeder = Vector de valores en la abscisa y
%   Outputs:
%       b = ordenada al origen de la regresión lineal
%       m = pendiente de la regresión lineal
%       Se = Error cuadratico medio     fuente=https://www.academia.edu/11647187/M%C3%8DNIMOS_CUADRADOS_UTILIZANDO_MATRICES
% Referencia: Clase sobre Cuadrados Minimos - Miryam Sassano

x_i = t_plot_shroeder ;
y_i = shroeder;

if size(x_i) ~= size(y_i)    %traspone vector y_i si no tiene la misma dimension que x_i
    y_i = y_i';
end

A = ones(length(x_i),2) ;   % matriz numero de filas de x_i y 2 columnas (todo unos)
A (:,2) = (x_i)';           % a la columna 2 le pongo los valores de x_i   
B = (y_i)' ;
vector = ((inv((A')*A)*(A'))*B)' ;
b = vector(1);
m = vector(2);

Q = (y_i(1) - (x_i(1) *m + b))^2 
for n = 2:length(x_i)
Q = (Q + (y_i(n) - (x_i(n) *m + b)))^2      %sumatoria de los cuadrados de las diferencias
end
Se=sqrt(Q/(length(x_i)-3))
end