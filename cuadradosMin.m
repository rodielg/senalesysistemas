%x = [0 1 3 4 5 6]    %valores de prueba 
%y = [1 2 4 6 9 10]   %valores de prueba
function [h,b,m] = cuadradosMin (x,y)
%Funcion cuadrados minimos. Ingrese un vector "x" y su imagen "y"
Y = transpose(y)

X = transpose(x)
unos = ones(length(X),1)
A = [unos X]
U = ((transpose(A)*A)^(-1))*transpose(A)*Y   
% "U" es la formula de cuadrados minimos matricial, nos entrega un vector de dos componentes
%componente 1,1(ordenada al origen) componente 1,2 (pendiente)
% fuente: https://www.academia.edu/11647187/M%C3%8DNIMOS_CUADRADOS_UTILIZANDO_MATRICES

b = U(1,1)
m = U(2,1)
h = m*x+b      %recta de cuadrados minimos
end

