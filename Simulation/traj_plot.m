global waypointx 
global waypointy 
global a
global b
global c
global e
global sx_0
global sy_0
global psi_0
global delta

global s
global kappa_0
global kappa_1
global kappa_2
global kappa_3

tlookahead=0.2;
tsched=0.1;

a = kappa_0;
b = ((-0.50)*(-2*kappa_3 + 11*kappa_0 - 18*kappa_1 + 9*kappa_2)/s);
c = ((4.50)*(-kappa_3 + 2*kappa_0 - 5*kappa_1 +4*kappa_2)/(s*s));
e = ((-4.50)*(-kappa_3 + kappa_0 - 3*kappa_1 + 3*kappa_2)/(s*s*s));

%% Set Initial Ego Vehicle State.
init_psi=0;
% Desired velocity (m/s)
v_d =11.1;
% Time horizon (s)
tfinal= 0.1;
% Time series
t=[0:0.1:tfinal];
% Initial position x (m)
sx_0 = 0;
% Initial position y (m)
sy_0 = 0;
% Initial velocity (m/s)
init_v = 11.1;

%% Compute The Initial Waypoint
g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end);
deltay=g1.y(4,end);
waypointx = sx_0+deltax;
waypointy = sy_0+deltay;
psi_0=0;

s1=ode45(@cardynamics_snider,[0,tsched],[0,0,0,init_v,0,0]);
tprev=tfinal;
hold on
plot(waypointx,waypointy, 'd')
title('Trajectory of Ego Vehicle in X-Y Plane')
xlabel('x (m)')
ylabel('y (m)')
pbaspect([40 7 1])
gleft=ode45(@traj_dynamics,[0:0.0001:4],[0,0,0,0,0]);
plot(gleft.y(3,:),gleft.y(4,:)+1, 'black')
plot(gleft.y(3,:),gleft.y(4,:)-1, 'black')
axis([sx_0 sx_0+(4*11.1) sy_0-2 sy_0+5])