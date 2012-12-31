clear all
close all

#le as imagens
lena = imread("4.2.04.jpg");
ruidosa = imread("lenaRuidosa.jpg");

colormap(gray(256));

#Faz a DFT
lenafft = fft2(lena);
ruidosafft = fft2(ruidosa);

#Ajusta o resultado para 256
#fmaxi = max(max(real(lenafft)));
#fmini = min(min(real(lenafft)));
#aux = fmaxi - fmini

#lenaNormal = 255 * ((real(lenafft).- fmini)/(aux));

#fmaxi = max(max(real(ruidosafft)));
#fmini = min(min(real(ruidosafft)));
#aux = fmaxi - fmini

#ruidosaNormal = 255 * ((real(ruidosafft).- fmini)/(aux));

#---Ajusta Lena---#
[x, y] = size(lenafft);
visualizaLena = lenafft;
visualizaLena = (visualizaLena([1:x], [1:y]) .- min(min(visualizaLena))) ./(max(max(visualizaLena)) -min(min(visualizaLena)));
visualizaLena = visualizaLena .* 255;

#---Ajusta Lena Ruidosa---#
[x, y] = size(ruidosafft);
visualizaRuidosa = ruidosafft;
visualizaRuidosa = (visualizaRuidosa([1:x], [1:y]) .- min(min(visualizaRuidosa))) ./(max(max(visualizaRuidosa)) -min(min(visualizaRuidosa)));
visualizaRuidosa = visualizaRuidosa .* 255;

#---para conferir se o intervalo foi ajustado para 0 e 256---#
min(min(visualizaRuidosa))
max(max(visualizaRuidosa))

min(min(visualizaLena))
max(max(visualizaLena))

#---Artifio do Log  (altera intervalo)---#
visualizaRuidosa = 1000 * log( 1+ abs(visualizaRuidosa));
visualizaLena = 1000 * log( 1+ abs(visualizaLena));

#---imprime tudo---#

figure(1),colormap(gray(256)), image(lena),title("Lena original");

figure(2),colormap(gray(256)), image(ruidosa),title("Lena ruidosa");

figure(3),colormap(gray(256)), image(visualizaLena),title("fft lena");

figure(4),colormap(gray(256)), image(visualizaRuidosa),title("fft lenaRuidosa");

#Visualize as imagens das transformadas de Fourier utilizando o artifício do logaritmo,como uma segunda operação pontual, apenas para a visualização. Observando os espectros para as imagens com e sem ruído, o que você conclui?

#------------OFF---------#
# o que seria a abordagem do logaritmo?
#--Linhas 44 e 45
#Ao inves de diminuir i intervalo logaritmo como fizemos em outro exercicio, eu aumentei ele, não faço ideia se está certo, mas é o que eu sei fazer... =/
#Mello comentei o seu jeito de colocar entre 0 e 256 porque eu não entendi direito, desculpa.
