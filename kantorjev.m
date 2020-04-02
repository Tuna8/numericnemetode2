%Kantorjev polinom
function kantorjev = Kantorjev(n, f, x)
kantorjev = zeros(size(x));
for i = 0:n
  kantorjev= kantorjev + Alpha(n,i,f)*bernstein(n,i,x);
end
end