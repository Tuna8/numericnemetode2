function Bf = bernpoly(f,n,x)
% bernpoly vrne vrednosti Bernsteinovega polinoma stopnje n za funkcijo f v
% tockah x.
%
% Bf = bernpoly(f,n,x)
%
% Vhod:
%  f    funkcija: @(x) f(x),
%  n    stopnja Bernsteinovega polinoma,
%  x    seznam abscis.
%
% Izhod:
%  Bf   seznam vrednosti Bernsteinovega polinoma stopnje n za funkcijo f v
%       tockah iz seznama x.

Bf = zeros(size(x));
for i = 0:n
    Bf = Bf + bernstein(n,i,x)*f(i/n);       
end

end