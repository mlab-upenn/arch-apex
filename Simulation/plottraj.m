clear all
%% Simulation Parameters
global waypointx 
global waypointy 
global a
global b
global c
global e
global v_d
global init_psi
global sx_0
global sy_0

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
% Goal offset x (m)
deltax=4;
% Goal offset y (m)
deltay=7;
% Initial velocity (m/s)
init_v = 3;
tlookahead=0.4

%% Path
s = (33.831636);
kappa_0 =(0.000000);
kappa_1 = (0.006046);
kappa_2 = (-0.000322);
kappa_3 = (0.000000);

a = kappa_0;
b = ((-0.50)*(-2*kappa_3 + 11*kappa_0 - 18*kappa_1 + 9*kappa_2)/s);
c = ((4.50)*(-kappa_3 + 2*kappa_0 - 5*kappa_1 +4*kappa_2)/(s*s));
e = ((-4.50)*(-kappa_3 + kappa_0 - 3*kappa_1 + 3*kappa_2)/(s*s*s));

g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end)
deltay=g1.y(4,end)
waypointx = sx_0+deltax
waypointy = sy_0+deltay
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
r = abs(l*l/(2*(waypointx - sx_0)));
tfinal=0.1
s1=ode45(@cardynamics_pp,[0,tfinal],[0,0,0,init_v,0,0,0,pi/2,0,0]);
tprev=tfinal;
subplot(2,1,2); 
plot(s1.x,s1.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant I')
xlabel('Time (s)')
ylabel('x(t)')
subplot(2,1,1); 
plot(s1.y(5,:), s1.y(6,:))
hold on
subplot(2,1,1); 
plot(s1.y(9,:), s1.y(10,:))
plot(g1.y(3,:),g1.y(4,:))
plot(deltax,deltay, 'd')
plot(waypointx,waypointy, 'd')
legend('desired', 'actual')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant I')
xlabel('x (m)')
ylabel('y (m)')

while tlookahead<3.6
tlookahead= tfinal +0.1
s = (33.831636);
kappa_0 =(0.000000);
kappa_1 = (0.006046);
kappa_2 = (-0.000322);
kappa_3 = (0.000000);

a = kappa_0;
b = ((-0.50)*(-2*kappa_3 + 11*kappa_0 - 18*kappa_1 + 9*kappa_2)/s);
c = ((4.50)*(-kappa_3 + 2*kappa_0 - 5*kappa_1 +4*kappa_2)/(s*s));
e = ((-4.50)*(-kappa_3 + kappa_0 - 3*kappa_1 + 3*kappa_2)/(s*s*s));
%kappa, psi, sx, sy, psidot
% [dbeta,dpsi,dpsidot,dv,dsx,dsy,ddelta,dPsid,dsxd,dsyd]';
g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end)
deltay=g1.y(4,end)



%% Quadrant I

waypointx = 0+deltax
waypointy = 0+deltay
l = sqrt((waypointx - s1.y(5,end))*(waypointx - s1.y(5,end)) + (waypointy - s1.y(6,end))*(waypointy - s1.y(6,end)));
r = abs(l*l/(2*(waypointx - s1.y(5,end))));
tfinal=tfinal+tprev
sx_0 = s1.y(5,end)
sy_0 = s1.y(6,end)

s1=ode45(@cardynamics_pp,[tprev,tfinal],[s1.y(1,end),s1.y(2,end),s1.y(3,end),s1.y(4,end),s1.y(5,end),s1.y(6,end),s1.y(7,end),s1.y(8,end),s1.y(9,end),s1.y(10,end)]);
tprev=tfinal
subplot(2,1,2); 
plot(s1.x,s1.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant I')
xlabel('Time (s)')
ylabel('x(t)')
subplot(2,1,1); 
plot(s1.y(5,:), s1.y(6,:))
hold on
subplot(2,1,1); 
plot(s1.y(9,:), s1.y(10,:))
plot(g1.y(3,:),g1.y(4,:))
plot(deltax,deltay, 'd')
plot(waypointx,waypointy, 'd')
legend('desired', 'actual')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant I')
xlabel('x (m)')
ylabel('y (m)')

end