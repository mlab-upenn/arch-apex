function d = scenario(t,x)
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
global v_env1
global v_env2

%% Define constants for vehicle
m =2273;
Iz= 4423;
Cf= 108000;
Cr =108000;
lf =1.292;
lr =1.515;
k1 =12;
k2 =2;
k3 =4;
k4 =2;
k5 =1;
k6 =10;
A = Cr*lr-Cf*lf;

%% State Vector
% Ego vehicle
beta = x(1);
psi = x(2);
psidot = x(3);
v = x(4);
sx = x(5);
sy = x(6);
%Env vehicle 1
kappa_env1 = x(7);
Psi_env1 = x(8);
sx_env1= x(9);
sy_env1 = x(10);
%Env vehicle 2
kappa_env2 = x(11);
Psi_env2 = x(12);
sx_env2 = x(13);
sy_env2 = x(14);


%% Simulate ego-vehicle
% Controller as defined by J. Snider
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
% Angle between robot heading and the line connecting robot and the carrot point
slope = atan2(waypointy-sy_0, waypointx-sx_0);
alpha = angdiff(psi_0,slope);
% Angular velocity command
delta= 2*sin(alpha)/l;
% Vehicle Dynamics
% Beta
dbeta = ((A/(m*v^2))-1)*psidot + Cf*delta/(m*v) - (Cf+Cr)*beta/(m*v);
% Psi
dpsi = psidot;
% Psi_dot
dpsidot = A*beta/Iz - ((lf^2*Cf+lr^2*Cr)/Iz)*(psidot/v) + (lf*Cf)*delta/Iz;
% Velocity Tracking 
ax = k6*(v_d-v);
% Velocity
dv = ax;
% X and Y position
dsx = v*cos(beta+psi);
dsy = v*sin(beta+psi);

%% Simulate env-vehicle #1
dkappa_env1 = b*v_env1 + 2*c*v_env1*v_env1*t + 3*e*v_env1*v_env1*v_env1*t*t ;
dPsi_env1 = v_env1*kappa_env1;
dsx_env1 = v_env1*cos(Psi_env1);
dsy_env1 = v_env1*sin(Psi_env1);


%% Simulate env-vehicle #2
dkappa_env2 = b*v_env2 + 2*c*v_env2*v_env2*t + 3*e*v_env2*v_env2*v_env2*t*t ;
dPsi_env2 = v_env2*kappa_env2;
dsx_env2 = v_env2*cos(Psi_env2);
dsy_env2 = v_env2*sin(Psi_env2);

    
%% Return to ODE solver
d = [dbeta, dpsi, dpsidot, dv, dsx, dsy, dkappa_env1, dPsi_env1, dsx_env1, dsy_env1, dkappa_env2, dPsi_env2, dsx_env2, dsy_env2]';

