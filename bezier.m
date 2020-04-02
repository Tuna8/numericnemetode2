function b = bezier(B,t)
% Opis:
%  bezier vrne tocke na Bezierjevi krivulji pri danih parametrih
%
% Definicija:
%  b = bezier(B,t)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne tocke
%       Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
%  t    seznam parametrov dolzine k, pri katerih racunamo vrednost
%       Bezierjeve krivulje
%
% Izhodni podatek:
%  b    matrika velikosti k x d, kjer i-ta vrstica predstavlja tocko na
%       Bezierjevi krivulji pri parametru iz t na i-tem mestu

n = size(B,1) - 1;
d = size(B,2);
k = length(t);

b = zeros(k,d);
for j = 1:d
    Bj = B(:,j);
    for i = 1:k
        D = decasteljau(Bj,t(i));
        b(i,j) = D(1,n+1);
    end
end

end