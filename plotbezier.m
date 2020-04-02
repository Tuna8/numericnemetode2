function plotbezier(B,t,c)
% Opis:
%  plotbezier narise Bezierjevo krivuljo za dane kontrolne tocke in seznam
%  parametrov
%
% Definicija:
%  plotbezier(B,t,c)
%
% Vhodni podatki:
%  B    matrika velikosti n+1 x 2, ki predstavlja kontrolne tocke
%       Bezierjeve krivulje stopnje n v ravnini,
%  t    seznam parametrov dolzine k, pri katerih racunamo vrednost
%       Bezierjeve krivulje,
%  c    parameter, ki doloca barvo Bezierjeve krivulje (privzeto je modra)

krivulja = bezier(B,t);
plot(B(:,1),B(:,2),'k-');
hold on 
plot(B(:,1),B(:,2),'ko');
hold on 
plot(krivulja(:,1),krivulja(:,2),c);
end
