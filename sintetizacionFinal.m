% Sintetizacion RI final por banda de octavas: Sumatoria de RI por banda de octavas para distintos t60, amplitud y segundos
function [k,j] = sintetizacionFinal(t60,amplitud,segundos)


centralesOctava = [31.5,63,125,250,500,1000,2000,4000,8000,16000]; %frecuencias centrales por banda de octava;
%sintetizacionRI de la primera frecuencia central por banda de octava
k = sintetizacionRI(centralesOctava(1),t60,amplitud,segundos); %cambiar por t60,amplitud y segundos
 
%con ciclo for hago sumatoria de todas las frecuencias centrales por banda de octava 
for c=2:10
     k = k + sintetizacionRI(centralesOctava(c),t60,amplitud,segundos);
    
end

centralesTercio = [25,31.5,40,50,63,80,100,125,160,200,250,315,400,500,630,800,1000,1250,1600,2000,2500,3150,4000,5000,6300,8000,10000,12500,16000,20000];
%sintetizacionRI de la primera frecuencia central por banda de octava
j = sintetizacionRI(centralesTercio(1),t60,amplitud,segundos); 
 
%con ciclo for hago sumatoria de todas las frecuencias centrales por banda de tercio de octava 
for c=2:30
     j = j + sintetizacionRI(centralesTercio(c),t60,amplitud,segundos);
    
end


