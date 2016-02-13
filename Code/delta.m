clear all
alpha =[(-pi/2) :0.01:(pi/2)]
deltaplot = atan(2*3*sin(alpha)./(0.28*11.1))
plot(alpha, deltaplot)