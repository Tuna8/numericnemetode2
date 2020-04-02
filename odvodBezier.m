function bt = odvodBezier(B, t)

vsota = 0;
n = length(B)-1;
for i = 1:n
    dolzina = B(i+1,:)-B(i,:);
    bin = nchoosek(n-1,i-1);
    td=(t.^(i-1)).*(1-t).^(n-i);
    toc =  dolzina*bin*td;
    vsota =vsota + toc;
end
bt = (n)*vsota;
