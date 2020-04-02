format long
syms x
f = @(x)exp(x);
n = 4;

taylor = 1./(factorial(6:-1:0)); %faktorji
T = zeros(7)  ;
for i = 6:-1:0
ceb = chebyshevT(i, x);
koefceb = coeffs(ceb,'All');
nic = zeros(6-i,1);
vtabelo = [nic' koefceb]';
T(:,7-i)= vtabelo;
end
b = (T\taylor')' %resen sistem enacb
p1= b(3:length(b))%prve 2 nas ne zanimajo??
T1 = inv(T) ; %inverz T
a = T1\[0 0 p1]'; %nevem zakaj nas ne zanimajo prve 2
p = a(3:end)';
polyval(p,0)
p(1)

px = @(y)polyval(p, y);
x = (linspace(0,200,201)-100)/100;
norm(f(x)-px(x), 'inf')