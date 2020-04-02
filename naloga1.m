x= 1/2;
f = @(x)sin(5*x);
n = 4;

k4= kantorjev(n,f,x);

x2 = linspace(0,1,80);
y2= kantorjev(2,f,x2);
y4= kantorjev(4,f,x2);
y6=kantorjev(6,f,x2);
y8=kantorjev(8,f,x2);
y10=kantorjev(10,f,x2);

plot(x2,y2,x2,y4,x2,y6,x2,y8,x2,y10)
hold on 

z2=bernpoly(f,2,x2);
z4=bernpoly(f,4,x2);
z6=bernpoly(f,6,x2);
z8=bernpoly(f,8,x2);
z10=bernpoly(f,10,x2);
p1= plot(x2,z2,"--",x2,z4, "--" ,x2,z6,"--", x2,z8,"--", x2,z10,"--");

x3 = [0:1:100].* 1/100;

Bf = bernpoly(f,4,x3);
Kf = kantorjev(4,f,x3);

pov = mean(abs(Kf-Bf))
K_4 = kantorjev(4,f,1/2)
n = 0;
while norm(f(x3)-kantorjev(n,f,x3),Inf)>0.1
  n = n+1;
end
st = n 
  
   

