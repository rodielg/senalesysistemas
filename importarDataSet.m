function [dataset] = importarDataSet(nombres)
%Introduci un array con todos los nombres de los archivos que quieras
%importar. Los nombres deben ser strings aclarando la extension del archivo segun corresponda.
 dataset=[];
    for i = 1:length(nombres);
       [x,Fs]=audioread(nombres(i)); 
       dataset(i)=x;
    end

end

