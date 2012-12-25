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

subplot(2,2,1), image(lena),title("original");
subplot(2,2,2), image(cropping),title("cropping");
subplot(2,2,3), image(normal),title("normalizado");

% o efeito colateral dessa abordagem é que perdemos alguns níveis de intensidade na coloração da imagem resultante
