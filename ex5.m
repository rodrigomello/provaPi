clear all
close all

#le as imagens
f = imread("lenaRuidosa.jpg");
colormap(gray(256));

#mascara
h0 = ([-1 -1 -1; -1 8 -1; -1 -1 -1]);
h1 = 1/9*([1 1 1;1 1 1; 1 1 1]);

#filtro passa alta
f_passAlta = conv2(f, h0, 'same');

#ache uma estimativa para a imagem da Lena com uma melhor relação sinal-ruído.
f_passBaixa = conv2(f, h1, 'same');

#Aplique novamente um filtro passa-alta, mas agora na estimativa sem ruído. Visualize os resultados (tome cuidado para visualizar o resultado da aplicação do filtro passa-alta. Dica: visualize o valor absoluto). 
f_passAlta2 = conv2(f_passBaixa, h0, 'same'); 

#---------Plots---------#
subplot(2, 2, 1), image(f), title('Imagem Ruidosa');
subplot(2, 2, 2), image(abs(f_passAlta)), title('Imagem Ruidosa com passa alta');
subplot(2, 2, 3), image(f_passBaixa), title('Imagem Ruidosa com passa baixa');
subplot(2, 2, 4), image(f_passAlta2), title('Imagem passa baixa/passa alta');

#---------Questoes---------#
#	Qual a função do filtro passa-alta nesse exercício. 
#	Explique o porquê da necessidade da aplicação do filtro passa-baixa para se obter o resultado esperado.
#O filtro passa tem a funcao de suavizar a imagem, já o filtro passa alta tem realça as boras, por isso devemos antes de realçar as bordas tentar eliminar o ruido (filtro passa baixa)
