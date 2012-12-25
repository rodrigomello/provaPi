clear all;
close all;

t = 0:0.01:2;
w = 2*pi;

% a) s (t)=sen (wt )
sa = sin(w*t);

%b) sen(wt )+ 1/3 * sen (3wt)+ 1/5 * sen(5wt )

sb = sin(w*t) + (1/3) * sin(3*w*t) + (1/5) * sin(5*w*t);

%c) s (t)=sen (wt )+ 1/3 sen (3wt)+ 1/5 sen(5wt )+  1/7 sen(7wt )+ 1/9 sen(9wt)

sc = sin(w*t) + (1/3) * sin(3*w*t) + (1/5) * sin(5*w*t) + (1/7) * sin(7*w*t) + (1/9) * sin(9*w*t);

%d) s (t)=sen (wt )+ 1/3 sen (3wt)+ 1/5 sen(5wt )+ ...+ 1/17 sen(17wt )

sd = sin(w*t) + (1/3) * sin(3*w*t) + (1/5) * sin(5*w*t) + (1/7) * sin(7*w*t) + (1/9) * sin(9*w*t) + (1/11) * sin(11*w*t) + (1/13) * sin(13*w*t) + (1/15) * sin(15*w*t) + (1/17) * sin(17*w*t);

%Mostra as imagens
subplot(2,2,1), plot(sa) ,title("s (t)=sen (wt )");
subplot(2,2,2), plot(sb) ,title("sen(wt )+ 1/3 * sen (3wt)+ 1/5 * sen(5wt )");
subplot(2,2,3), plot(sc) ,title("s (t)=sen (wt )+ 1/3 sen (3wt)+ 1/5 sen(5wt )+  1/7 sen(7wt )+ 1/9 sen(9wt)");
subplot(2,2,4), plot(sd) ,title("s (t)=sen (wt )+ 1/3 sen (3wt)+ 1/5 sen(5wt )+ ...+ 1/17 sen(17wt )");

%Conforme consideramos componentes de frequências mais altas na composição das funçõesacima, o gráfico se aproxima de uma determinada forma de onda. Que onda é essa? Qual conclusão podemos extrair dessa observação?

% O gráfico se aparenta com a forma de uma onda quadrada, sendo representado por uma série de fourrier

%link de apoio:
%http://www.searadaciencia.ufc.br/tintim/matematica/fourier/fourier5.htm
