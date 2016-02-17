%% Simulation Parameters Ego Vehicle
% Vehicle Constants
m =2273;
Iz= 4423;
Cf= 108000;
Cr =108000;
lf =1.292;
lr =1.515;
k1 =2;
k2 =12;
k3 =4;
k4 =2;
k5 =1;
k6 =10;
cl=(Cr*lr-Cf*lf);

%% State Vector
beta = x(1);
psi=x(2);
psidot=x(3);
v=x(4);
sx=x(5);
sy=x(6);
delta=x(7);
Psid=x(8);
sxd=x(9);
syd=x(10);

%% Simulation Parameters
vd =2;
w =3.7;
tfinal= 10;
t=[0:0.1:tfinal];
sx_0 = 0;
sy_0 = 0;

%% Goal point is in Quadrant I.
% Init Goal Pair
waypointx = sx_0+4;
waypointy= sy_0+7;
% Pure Pursuit Calculations
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
r = abs(l*l/(2*(waypointx - sx_0)));
cx=sx_0+r;
cy=sy_0;

% Plot
xQ1=cx-r*cos(v_d*t/r);
yQ1=cy+r*sin(v_d*t/r);

% Compute orientation
normQ1 = sqrt(xQ1.^2+yQ1.^2);
psiQ1 = asin(yQ1./normQ1);

figure 
subplot(5,1,2); plot(t,psiQ1)
axis([0 tfinal 0 2*pi])
legend('psiQ1')
hold on


subplot(5,1,1); plot(xQ1,yQ1)
axis([sx_0-10 sx_0+10 sy_0-10 sy_0+10])
hold on

%% Goal point is in Quadrant II.

% Init Goal Pair
waypointx = sx_0-4;
waypointy= sy_0+7;


% Pure Pursuit Calculations
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
r = abs(l*l/(2*(waypointx - sx_0)));
cx=sx_0-r;
cy=sy_0;



% Plot
xQ2=cx+r*cos(v_d*t/r);
yQ2=cy+r*sin(v_d*t/r);

% Compute orientation
normQ2 = sqrt(xQ2.^2+yQ2.^2);
psiQ2 = pi-asin(yQ2./normQ2);

subplot(5,1,3); plot(t,psiQ2)
axis([0 tfinal 0 2*pi])
legend('psiQ2')
hold on

subplot(5,1,1);
plot(xQ2,yQ2)

%% Goal point is in Quadrant III.

% Init Goal Pair
waypointx =sx_0 -4;
waypointy=sy_0 -7;

% Pure Pursuit Calculations
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
r = abs((l*l/(2*(sx_0-waypointx))));
cx=(sx_0 - r);
cy=sy_0;

% Plot
xQ3=(cx+r*cos(v_d*t/r));
yQ3=(cy-r*sin(v_d*t/r));

% Compute orientation
normQ3 = sqrt(xQ3.^2+yQ3.^2);
psiQ3 = pi- asin(yQ3./normQ3);

subplot(5,1,4); plot(t,psiQ3)
axis([0 tfinal 0 2*pi])
legend('psiQ3')
hold on

subplot(5,1,1);
plot(xQ3,yQ3)



%% Goal point is in Quadrant IV.

% Init Goal Pair
waypointx =sx_0 +4;
waypointy=sy_0 -7;

% Pure Pursuit Calculations
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
r = abs((l*l/(2*(sx_0-waypointx))));
cx=(sx_0 + r);
cy=sy_0;

% Plot
xQ4=(cx-r*cos(v_d*t/r));
yQ4=(cy-r*sin(v_d*t/r));

% Compute orientation
normQ4 = sqrt(xQ4.^2+yQ4.^2);
psiQ4 = 2*pi+asin(yQ4./normQ4);

subplot(5,1,5); plot(t,psiQ4)
axis([0 tfinal 0 2*pi])
legend('psiQ4')
hold on

subplot(5,1,1);
plot(xQ4,yQ4)

legend('Q1', 'Q2', 'Q3', 'Q4')
