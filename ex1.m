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

soma = n1 + n2;
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
# com a parte imaginária, a soma das inversas nao é igual a inversa da soma, ao contrário do que acontece com a parte real.

#mostra as imagens

figure(1),colormap(gray(256)), image(l),title("Lena");

figure(2),colormap(gray(256)), image(b),title("Babuino");

figure(3),colormap(gray(256)), image(n1),title("lena");

figure(4),colormap(gray(256)), image(n2),title("babuino");

figure(5),colormap(gray(256)), image(real(n3)),title("FFT Lena+Babuino");

figure(6),colormap(gray(256)), image(real(n3ifft)),title("IFFT Lena+Babuino");

figure(7),colormap(gray(256)), image(soma),title("soma");

#O que você conclui dos resultados? A que propriedade da transformada de Fourier você atribui esse resultado?
# a inversa da soma dos sinais no domínio de Fourier é igual a soma dos sinais no domínio contínuo
# ifft2( fft(n1) + fft(n2) ) = n1 + n2
# ou seja,
# ifft2( fft(n1) + fft(n2) ) = ifft2( fft2( n1 + n2 ) )
# logo,
# fft(n1) + fft(n2) = fft2( n1 + n2 )
# isto se deve à distributividade da transformada de Fourier.
