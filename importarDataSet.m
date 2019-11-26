function [dataset] = importarDataSet()
%Introduci un array con todos los nombres de los archivos que quieras
%importar. Los nombres deben ser strings aclarando la extension del archivo segun corresponda.
 dataset=struct([]);
%     for i = 1:length(nombres);
%        [x,Fs]=audioread(nombres(i)); 
%        dataset(i)=x;
%     end
% 
% end
i=1;
reply='Y';
while (reply=='Y')
    archivo= input('Que archivo wav queres importar:', 's');
    archivo=char(archivo);
    [x,fs]=audioread(archivo);
    info = audioinfo(archivo);
    dataset{i,2} = struct('amplitudvector',x','SampleRate',fs,'Duracion', info.Duration);
    reply = input('Queres importar otro archivo? Y/N [N]:','s');
       if isempty(reply)
          reply = 'N';
       end
    i=i+1;
end