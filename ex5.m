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

#Aplique novamente um filtro passa-alta, mas agora na estimativa sem ruído. 
#Visualize os resultados (tome cuidado para visualizar o resultado da aplicação do filtro passa-alta. Dica: visualize o valor absoluto). 
f_passAlta2 = conv2(f_passBaixa, h0, 'same'); 

#---------Plots---------#
colormap(gray(256));
figure(1), image(f), title('Imagem Ruidosa');
colormap(gray(256));
figure(2), image(abs(f_passAlta)), title('Imagem Ruidosa com passa alta');
colormap(gray(256));
figure(3), image(f_passBaixa), title('Imagem Ruidosa com passa baixa');
colormap(gray(256));
figure(4), image(f_passAlta2), title('Imagem passa baixa/passa alta');

#---------Questoes---------#
#1-Qual a função do filtro passa-alta nesse exercício?
#R:Quando aplicado sobre a imagem com ruído, sua função acaba por ser a de realçar ainda mais esse ruído.
#Quando aplicado sobre uma imagem suavizada ou sem ruídos, sua função é de realçar as bordas da imagem. 
#2-Explique o porquê da necessidade da aplicação do filtro passa-baixa para se obter o resultado esperado.
#R: O filtro passa-baixa tem a função de suavizar a imagem, já o filtro passa-alta tem a funçãao realçar as altas frequências(bordas ou ruídos).
#Por isso devemos antes de realçar as bordas tentar eliminar o ruido (filtro passa-baixa).
