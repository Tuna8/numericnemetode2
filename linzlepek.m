function zx = linzlepek(X,Y,x)
% Opis:
%  Funkcija linzlepek vrne vrednosti zveznega linearnega zlepka, ki
%  interpolira dane vrednosti v sticnih tockah definicijskega intervala.
%
% Definicija:
%  zx = linzlepek(X,Y,x)
%
% Vhod:
%  X    vrstica, ki predstavlja sticne tocke definicijskega intervala
%       zlepka,
%  Y    interpolacijske vrednosti,
%  x    vrstica tock na definicijskem intervalu.
%
% Izhod:
%  zx   vrstica vrednosti linearnega zlepka v tockah iz x.

m = length(X) - 1;

% izracun koeficientov lokalnih predpisov
Z = zeros(m,2);
for i = 1:m
    Z(i,1) = Y(i);
    Z(i,2) = (Y(i+1) - Y(i))/(X(i+1) - X(i));
end

zx = zeros(size(x));
for l = 1:length(x)
    % indeks i, pri katerem je x(k) na intervalu (X(i), X(i+1)]
    i = 1;
    while x(l) > X(i+1)
        i = i+1;
    end
    
    % lokalni predpis za zlepek
    zx(l) = Z(i,1) + Z(i,2)*(x(l)-X(i));
end

end