clc 
clear all
%% Define Global Simulation Parameters
global waypointx 
global waypointy 
global a
global b
global c
global e
global v_d
global sx_0
global sy_0
global psi_0
global delta
global init_v
global tlookahead
global tsched
global v_env1
global v_env2
global time


%% Initialize scenario
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
v_env1=6;
v_env2=7;

init_scenario = [0,0,0,init_v,0,0,0,0,0,0,0,0,0,0]';
init_computation = [0,0,0,0,0,0,0,0,0,0]';


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
g1=ode45(@computation,[0,tlookahead],init_computation);
deltax=g1.y(3,end);
deltay=g1.y(4,end);
waypointx = sx_0+deltax;
waypointy = sy_0+deltay;
psi_0=0;

%% Simulate the First Schedule Period
s1=ode45(@scenario,[0,tsched],init_scenario);
tprev=tfinal;

%% Update Variables
time=tsched;
delta_old=delta;

