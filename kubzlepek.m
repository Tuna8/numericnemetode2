function zx = kubzlepek(X,Y,dY,x)
% Opis:
%  Funkcija kubzlepek vrne vrednosti (dvakrat) zvezno odvedljivega
%  kubicnega zlepka, ki interpolira dane vrednosti v delilnih tockah
%  definicijskega intervala.
%
% Definicija:
%  zx = kubzlepek(X,Y,dY,x)
%
% Vhod:
%  X    vrstica, ki predstavlja delilne tocke definicijskega intervala
%       zlepka,
%  Y    interpolacijske vrednosti,
%  dY   interpolacijske vrednosti odvoda:
%        * ce je length(Y) = length(dY), metoda izracuna vrednosti zvezno
%          odvedljivega zlepka, ki interpolira vrednosti v Y in dY,
%        * ce je length(dY) = 2, metoda izracuna vrednosti dvakrat zvezno
%          odvedljivega zlepka, ki interpolira vrednosti v Y in vrednosti v
%          dY v X(1) in X(end),
%        * ce je length(dY) = 0 (dY = []), metoda izracuna vrednosti
%          dvakrat zvezno odvedljivega zlepka, ki interpolira vrednosti v
%          Y, vrednosti odvodov v X(1) in X(end) pa sta aproksimirani z
%          deljeno diferenco.
%  x    vrstica tock na definicijskem intervalu.
%
% Izhod:
%  zx   vrstica vrednosti kubicnega zlepka v tockah iz x.

% razlike med zaporednimi sticnimi tockami
dX = diff(X);

% deljene diference na dveh zaporednih sticnih tockah
D = diff(Y)./dX;

% dolocanje vrednosti odvodov
lY = length(Y);
ldY = length(dY);
if ldY ~= lY
    % vrednosti odvodov niso (v celoti) podane
    
    if ldY == 2
        % podane so vrednosti odvodov v robovih
        dY = [dY(1) zeros(1,lY-2) dY(2)];
    else
        % vrednosti odvodov niso podane, na robovih ju aproksimiramo
        dY = [D(1) zeros(1,lY-2) D(end)];
    end
    
    % vrednosti odvodov v notranjih sticnih tockah nastavimo tako, da je
    % zlepek dvakrat zvezno odvedljiv (resevanje sistema enacb)
    
    A = diag(1./dX(2:end-1),-1) + ...
        2*diag(1./dX(1:end-1) + 1./dX(2:end)) + ...
        diag(1./dX(2:end-1),1);
    
    b = 3*(D(1:end-1)./dX(1:end-1) + D(2:end)./dX(2:end))';
    b(1) = b(1) - dY(1)/dX(1);
    b(end) = b(end) - dY(end)/dX(end);
    
    dY(2:end-1) = (A\b)';
end

% koeficienti kubicnih polinomov na vsakem odseku posebej
Z = [Y(1:end-1); ...
    dY(1:end-1); ...
    (D-dY(1:end-1))./dX; ...    
    (dY(1:end-1)+dY(2:end)-2*D)./dX.^2]';

% izracun vrednosti zlepka pri podanih abscisah
zx = zeros(size(x));
for l = 1:length(x)
    % dolocimo i, da je x(l) > X(1) na intervalu (X(i) X(i+1)]
    i = 1;
    while x(l) > X(i+1)
        i = i+1;
    end
    
    % izracunamo vrednost zlepka v tocki x(l)
    zx(l) = Z(i,1) + ...
        Z(i,2)*(x(l)-X(i)) + ...
        Z(i,3)*(x(l)-X(i))^2 + ...        
        Z(i,4)*(x(l)-X(i))^2*(x(l)-X(i+1));
end

end