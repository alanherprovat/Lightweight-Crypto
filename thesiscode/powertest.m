syms x y z energy pow;
f=main();
f = symfun(eval(f), x);
f=f*conj(f);
f = matlabFunction(f);
y(t)=int(f,-t,t);
energy=limit(y(t),t,inf);
z(t)=y(t)/(2*t);
pow=limit(z(t),t,inf);