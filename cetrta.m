B = [-1 0; 0 3; 3 -2; 5 2];
bez = bezier(B,1/2);
norme = zeros(1,length(B));
for i = 1:length(B)
    norme(i) = norm(B(i,:)-bez);
end
minimal_razdalja = min(norme)

t = linspace(0,1,101);
maksim = zeros(1,length(t));
for j = 1:length(t)
    bez = bezier(B,t(j));
norme = zeros(1,length(B));
for i = 1:length(B)
    norme(i) = norm(B(i,:)-bez);
end
maksim(j) = min(norme);
end
maksimal_razd = max(maksim)


B2 = bezierelv(B,4)
t2 = linspace(0,1,101);
maksim2 = zeros(1,length(t2));
for j2 = 1:length(t2)
    bez2 = bezier(B2,t2(j2));
norme2 = zeros(1,length(B2));
for i2 = 1:length(B2)
    norme2(i2) = norm(B2(i2,:)-bez2);
end
maksim2(j2) = min(norme2);
end
max(maksim2)
