clear all
%% Define Global Simulation Parameters
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
global psi_0

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

%% Set Pure Pursuit Lookahead Time and the Schedule Time
tlookahead=0.2;
tsched=0.1;

%% Define Parameters for Road Centerline
s = (33.831636);
kappa_0 =(0.000000);
kappa_1 = (0.006046);
kappa_2 = (-0.000322);
kappa_3 = (0.000000);

a = kappa_0;
b = ((-0.50)*(-2*kappa_3 + 11*kappa_0 - 18*kappa_1 + 9*kappa_2)/s);
c = ((4.50)*(-kappa_3 + 2*kappa_0 - 5*kappa_1 +4*kappa_2)/(s*s));
e = ((-4.50)*(-kappa_3 + kappa_0 - 3*kappa_1 + 3*kappa_2)/(s*s*s));

%% Compute The Initial Waypoint
g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end)
deltay=g1.y(4,end)
waypointx = sx_0+deltax
waypointy = sy_0+deltay
psi_0=0;

%% Simulate the First Schedule Period
s1=ode45(@cardynamics_snider,[0,tsched],[0,0,0,init_v,0,0,0,0]);
tprev=tfinal;

%% Call Plotting Routine
subplot(2,1,2); 
plot(s1.x,s1.y)
legend('beta','psi','psidot','v','sx','sy', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State')
xlabel('Time (s)')
ylabel('x(t)')

subplot(2,1,1); 
plot(s1.y(5,:), s1.y(6,:))
hold on

subplot(2,1,1); 
hold on
plot(waypointx,waypointy, 'd')


title('Trajectory of Ego Vehicle in X-Y Plane')
xlabel('x (m)')
ylabel('y (m)')
time=tsched
%% Follow the Road Centerline
while tlookahead<5

tlookahead= time+0.2

% Compute the Next Waypoint
g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end)
deltay=g1.y(4,end)
waypointx = 0+deltax
waypointy = 0+deltay

% Compute Pure Pursuit Geometry
l = sqrt((waypointx - s1.y(5,end))*(waypointx - s1.y(5,end)) + (waypointy - s1.y(6,end))*(waypointy - s1.y(6,end)));
r = (l*l/(2*(waypointx - s1.y(5,end))));

% Update Ego Vehicle State
sx_0 = s1.y(5,end)
sy_0 = s1.y(6,end)
psi_0= s1.y(2,end)

s1=ode45(@cardynamics_snider,[0,0.1],[s1.y(1,end),s1.y(2,end),s1.y(3,end),s1.y(4,end),s1.y(5,end),s1.y(6,end),s1.y(7,end),s1.y(8,end)]);


subplot(2,1,2); 
plot(s1.x,s1.y)
legend('beta','psi','psidot','v','sx','sy', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State')

subplot(2,1,1); 
plot(s1.y(5,:), s1.y(6,:))

subplot(2,1,1); 
plot(waypointx, waypointy, 'd')

time=time+tsched


end