clear all;
close all;

lena = imread("4.2.04.jpg");

colormap(gray(256));

#Cropping Fourier
fft_f=fft2(lena);
aux1 = fftshift(fft_f);
aux2 = aux1([128:1:383], [128:1:383]); #regiao central (baixa frequencia)
aux3 = fftshift(aux2);
cropping = ifft2(aux3);
cropping = abs(cropping);

%calcula o máximo e o mínimo da imagem resultante
fmaxi = max(max(cropping));
fmini = min(min(cropping));
aux = fmaxi - fmini;

%normaliza os valores para o intervalo 0~255
normal = 255 * ((cropping .- fmini)/(aux));

colormap(gray(256));
figure(1), image(lena),title("original");
colormap(gray(256));
figure(2), image(cropping),title("cropping");
colormap(gray(256));
figure(3), image(normal),title("normalizado");

%Um dos efeitos colateriais do Cropping de Fourrier é a perda das informaçoes de alta fequência[bordas].
% Um dos efeitos colateral da normalização  é que perdemos alguns níveis de intensidade na coloração da imagem resultante.
