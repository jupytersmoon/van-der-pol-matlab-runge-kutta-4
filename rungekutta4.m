clc
f = @(y) y;
g = @(m,x,y) m*(1-x^2)*y - x;

h = 0.1;
s = h/2;
t0 = 0; tn= 35;
n = (tn-t0)/h;
x = zeros(1,n); y = zeros(1,n);
x(1)=1;y(1)=1;
myu = [0.01, 0.05, 0.1, 1, 2, 2.5, 3, 3.5, 4, 4.5, 5];

for j=1:length(myu)
    m = myu(j);
    x0 = 1; y0 = 1;
    k = 1;
    for i=t0:h:tn
        f1 = f(y0);g1 = g(m,x0,y0);
        f2 = f(y0+s*g1);g2 = g(m,x0+s*f1,y0+s*g1);
        f3 = f(y0+s*g2);g3 = g(m,x0+s*f2,y0+s*g2);
        f4 = f(y0+h*g3);g4 = g(m,x0+h*f3,y0+h*g3);
    
        x0 = x0 + h*(f1+f2+f3+f4)/6; 
        x(k+1) = x0;
        y0 = y0 + h*(g1+g2+g3+g4)/6; 
        y(k+1) = y0;
        k = k +1;
    end
    plot(x,y);
    hold on
end
title("Van der Pol Equation's Limit Cycles for Varying myu")
hold off