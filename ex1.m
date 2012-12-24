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

%mostra as imagens
subplot(1,2,1), image(n1),title("lena");
subplot(1,2,2), image(n2),title("babuino");

#alguem manja fazer dft no octave?

