clear all;
close all;

%lê as imagens
lena = imread("4.2.04.jpg");
ruidosa = imread("lenaRuidosa.jpg");

colormap(gray(256));

%Faz a DFT
lenafft = fft2(lena);
ruidosafft = fft2(ruidosa);

%Ajusta o resulpado para 256
fmaxi = max(max(real(lenafft)));
fmini = min(min(real(lenafft)));
aux = fmaxi - fmini

lenaNormal = 255 * ((real(lenafft).- fmini)/(aux));

fmaxi = max(max(real(ruidosafft)));
fmini = min(min(real(ruidosafft)));
aux = fmaxi - fmini

ruidosaNormal = 255 * ((real(ruidosafft).- fmini)/(aux));

%imprime tudo
subplot(2,3,1), image(lena),title("Lena original");
subplot(2,3,2), image(ruidosa),title("Lena ruidosa");
subplot(2,3,3), image(lenaNormal),title("fft lena");
subplot(2,3,4), image(ruidosaNormal),title("fft lenaRuidosa");

%Visualize as imagens das transformadas de Fourier utilizando o artifício do logaritmo,como uma segunda operação pontual, apenas para a visualização. Observando os espectros para as imagens com e sem ruído, o que você conclui?

% o que seria a abordagem do logaritmo?

