f =@(x) 1/2 - 1./(1+(pi.*x -1).^2);
x = linspace(0,1000,1001)./1000;
fx = f(x);

X = [ 0 1/7 1/3 1/2 3/4 1];

Ifx = linzlepek(X,f(X),x);

linzlepeknapaka = norm(fx-Ifx,Inf)

plot(x,fx, x,Ifx);

kvadzlep = kvadzlepek(X,f(X),x);
napaka = norm(fx-kvadzlep,Inf);
for i = 1:length(x)
    napaka2 = norm(f(x(i))-kvadzlepek(X,f(X),x(i)));
    if napaka2 == napaka
        y = x(i)
        break
    end
end

df = @(x) (2.*pi.*(pi.*x -1))./((pi.*x -1).^2 +1).^2;
Ifx1 = kubzlepek(X,f(X),df(X),x);
Ifx2 = kubzlepek(X,f(X),[df(0) df(1)],x);
stevec = 0 ;
for i = 1: length(Ifx1)
    norm1 = norm(fx(i)-Ifx1(i));
    norm2 = norm(fx(i)-Ifx2(i));
    if norm1>norm2
        stevec = stevec +1;
    end
end
stevec
