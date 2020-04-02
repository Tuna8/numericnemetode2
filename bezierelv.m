function Be = bezierelv(B,k)
% Opis:
%  bezierelv izvede visanje stopnje dane Bezierjeve krivulje
%
% Definicija:
%  Be = bezierelv(B,k)
%
% Vhodna podatka:
%  B    matrika velikosti (n+1) x d, v kateri vsaka vrstica predstavlja
%       d-dimenzionalno kontrolno tocko Bezierjeve krivulje stopnje n,
%  k    stevilo, ki doloca, za koliko zelimo zvisati stopnjo dane
%       Bezierjeve krivulje
%
% Izhodni podatek:
%  Be   matrika velikosti (n+k+1) x d, v kateri vsaka vrstica predstavlja
%       d-dimenzionalno kontrolno tocko Bezierjeve krvulje stopnje n+k, ki
%       ustreza dani Bezierjevi krivulji
M = B;
for j = 1:k
n = length(M);
C=zeros(n+1,2);
c1= M(1,:);
C(1,:) = c1;
for i = 2:n
    c = ((i-1)/(n)).* M(i-1,:) + (1- (i-1)/(n)).* M(i,:);
    C(i,:)= c;
end
C(n+1,:) = M(n,:);
M = C;
end
Be = M;
end