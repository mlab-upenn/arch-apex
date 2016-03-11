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
global delta
global init_v
global tlookahead
global tsched

%% Compute The Initial Waypoint
g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end);
deltay=g1.y(4,end);
waypointx = sx_0+deltax;
waypointy = sy_0+deltay;
psi_0=0;

%% Simulate the First Schedule Period
s1=ode45(@cardynamics_snider,[0,tsched],[0,0,0,init_v,0,0]);
tprev=tfinal;

%% Update Variables
time=tsched;
delta_old=delta;

%% Loop
while tlookahead<4

tlookahead= time+0.2;
% Compute the Next Waypoint
g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end);
deltay=g1.y(4,end);
waypointx = 0+deltax;
waypointy = 0+deltay;

% Compute Pure Pursuit Geometry
l = sqrt((waypointx - s1.y(5,end))*(waypointx - s1.y(5,end)) + (waypointy - s1.y(6,end))*(waypointy - s1.y(6,end)));
r = (l*l/(2*(waypointx - s1.y(5,end))));

% Update Ego Vehicle State
sx_0 = s1.y(5,end);
sy_0 = s1.y(6,end);
psi_0= s1.y(2,end);

s1=ode45(@cardynamics_snider,[0,0.1],[s1.y(1,end),s1.y(2,end),s1.y(3,end),s1.y(4,end),s1.y(5,end),s1.y(6,end)]);
time=time+tsched;
end