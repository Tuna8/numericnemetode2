function b = bernstein(n,i,x)
% bernstein vrne vrednosti Bernsteinovega baznega polinoma
%
% b = bernstein(n,i,x)
%
% Vhodni podatki:
%  n    stopnja Bernsteinovega baznega polinoma,
%  i    indeks Bernsteinovega baznega polinoma (med 0 in n),
%  x    seznam parametrov, v katerih racunamo vrednost polinoma.
%
% Izhodni podatek:
%  b    seznam vrednosti i-tega Bernsteinovega baznega polinoma stopnje n
%       pri parametrih iz seznama x.

b = nchoosek(n,i)*x.^i.*(1-x).^(n-i);

end