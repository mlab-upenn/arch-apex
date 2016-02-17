function d = road_generate(t,x)

v = 1;
s = 33.831636;
kappa_0 = 0.000000;
kappa_1 = 0.006046;
kappa_2 = -0.000322;
kappa_3 = 0.000000;

a =  kappa_0;
b = (-0.50*(-2*kappa_3 + 11*kappa_0 - 18*kappa_1 + 9*kappa_2)/s);
c = ((4.50)*(-kappa_3 + 2*kappa_0 - 5*kappa_1 +4*kappa_2)/(s*s));
e = ((-4.50)*(-kappa_3 + kappa_0 - 3*kappa_1 + 3*kappa_2)/(s*s*s));

kappa = x(1);
Psi = x(2);
sx = x(3);
sy = x(4);
Psi =x(5);

dkappadt = b*v + 2*c*v*v*t + 3*e*v*v*v*t*t ;
dPsidt = v*kappa;
dsxdt = v*cos(Psi);
dsydt = v*sin(Psi);
dPsidt = v*(b*v + 2*c*v*v*t + 3*e*v*v*v*t*t);

d = [dkappadt, dPsidt, dsxdt, dsydt, dPsidt]';


