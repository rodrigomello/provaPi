clear all;
close all;

l = imread("4.2.04.jpg");
b = imread("4.2.03.jpg");

colormap(gray(256));

[x, y] = size(l);

%n1 recebe a lena e n2 o babuino
n1 = l;
n2 = b;

%cria as imagens alteradas
n1([1:x],[y/2:y]) = zeros;
n2([1:x],[1:y/2]) = zeros;

#DFT
n1fft = fft2(n1);
n2fft = fft2(n2);

#soma
n3 = n1fft  .+ n2fft;

n1fft([1:3],[1:3])
n2fft([1:3],[1:3])
n3([1:3],[1:3])

#inversa
n3ifft = ifft2(n3);
#O que você pode dizer sobre a parte imaginária da imagem resultante da transformada inversa? Esta de acordo com o esperado?
#R: Eu aprendi a jamais esperar nada das pessoas, e nem das transformadas de fourrier!

#mostra as imagens
colormap(gray(256));
figure(1), image(l),title("Lena");
colormap(gray(256));
figure(2), image(b),title("Babuino");
colormap(gray(256));
figure(3), image(n1),title("lena");
colormap(gray(256));
figure(4), image(n2),title("babuino");
colormap(gray(256));
figure(5), image(real(n3)),title("FFT Lena+Babuino");
colormap(gray(256));
figure(6), image(real(n3ifft)),title("IFFT Lena+Babuino");

#O que você conclui dos resultados? A que propriedade da transformada de Fourier você atribui esse resultado?
