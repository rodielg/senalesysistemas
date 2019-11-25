 function [BandasOct,BandasTer] = filtros(audio)
 %Input: audio
 %Output: Cell 'BandasOct' con todas las bandas por octava filtradas
 %        Cell 'BandasTer' con todas las bandas por tercio de octava filtradas
 
audio = 'Sine Sweep.wav'
fcOct=[31.5,63,125,250,500,1000,2000,4000,8000,16000];
fcTer = [25,31.5,40,50,63,80,100,125,160,200,250,315,400,500,630,800,1000,1250,1600,2000,2500,3150,4000,5000,6300,8000,10000,12500,16000,20000];
BandasOct = cell(1,length(fcOct));
BandasTer = cell(1,length(fcTer));

for i = 1:10
    BandasOct{i} = filtroNormaIEC(audio,fcOct(i));
end

for i = 1:30
    BandasTer{i} = filtroNormaIEC(audio,fcTer(i));
end
 end