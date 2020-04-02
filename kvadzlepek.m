function zx = kvadzlepek(X,Y,x)
% Opis:
%  Funkcija kvadzlepek vrne vrednosti zvezno odvedljivega kvadraticnega
%  zlepka, ki interpolira dane vrednosti v sticnih tockah definicijskega
%  intervala.
%
% Definicija:
%  zx = kvadzlepek(X,Y,x)
%
% Vhod:
%  X    vrstica, ki predstavlja sticne tocke definicijskega intervala
%       zlepka,
%  Y    interpolacijske vrednosti,
%  x    vrstica tock na definicijskem intervalu.
%
% Izhod:
%  zx   vrstica vrednosti kvadraticnega zlepka v tockah iz x.

m = length(X)-1;

% izracun 'odvodov' (parametrov s)
s = zeros(1,m);
s(1) = (Y(2)-Y(1))/(X(2)-X(1));
for i = 2:m
    s(i) = -s(i-1) + 2*(Y(i)-Y(i-1))/(X(i)-X(i-1));
end

% izracun koeficientov lokalnih predpisov
Z = zeros(m,3);
for i = 1:m
    Z(i,1) = Y(i);
    Z(i,2) = s(i);
    Z(i,3) = (Y(i+1)-Y(i)-s(i)*(X(i+1)-X(i)))/(X(i+1)-X(i))^2;
end

zx = zeros(size(x));
for l = 1:length(x)
    % indeks i, pri katerem je x(k) na intervalu (X(i), X(i+1)]
    i = 1;
    while x(l) > X(i+1)
        i = i+1;
    end
    
    % lokalni predpis za zlepek
    zx(l) = Z(i,1) + Z(i,2)*(x(l)-X(i)) + Z(i,3)*(x(l)-X(i))^2;
end

end