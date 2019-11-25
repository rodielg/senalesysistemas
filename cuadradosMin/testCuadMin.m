%Comparo ploteo de nuestra funcion de cuadrados minimos con polyfit de
%matlab
x_i = [0,1,3,4,5,6]
y_i = [1,2,4,6,9,10]

[b,m,Se] = cuad_min(x_i,y_i)
cuadMin = x_i.*m+b     %recta de cuadrados minimos propia
plot(x_i,cuadMin,'g')      %ploteo recta cuadrados minimo propia
hold on

[p,S,Mu] = polyfit(x_i,y_i,1)   %funcion polyfit de matlab
pend = p(1)              
ord = p(2)
poly = x_i.*pend+ord     
plot(x_i,poly,'r*')      %ploteo funcion polyfit

