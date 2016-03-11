function d = computation(t,x)

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

%% Define state vector
% Road Lane 1
kappa_d_spline_1 = x(1);
Psi_d_spline_1 = x(2);
sx_d_spline_1 = x(3);
sy_d_spline_1 = x(4);
Psi_dot_d_spline_1 =x(5);

% Road Lane 2
kappa_d_spline_2 = x(6);
Psi_d_spline_2 = x(7);
sx_d_spline_2 = x(8);
sy_d_spline_2 = x(9);
Psi_dot_d_spline_2 =x(10);

%% Simulate lane 1
dkappa_d_spline_1 = b*v_d + 2*c*v_d*v_d*t + 3*e*v_d*v_d*v_d*t*t ;
dPsi_d_spline_1 = v_d*kappa_d_spline_1;
dsx_d_spline_1 = v_d*cos(Psi_d_spline_1);
dsy_d_spline_1 = v_d*sin(Psi_d_spline_1);
dPsi_dot_d_spline_1 = v_d*(b*v_d + 2*c*v_d*v_d*t + 3*e*v_d*v_d*v_d*t*t); 

%% Simulate lane 2
dkappa_d_spline_2 = b*v_d + 2*c*v_d*v_d*t + 3*e*v_d*v_d*v_d*t*t ;
dPsi_d_spline_2 = v_d*kappa_d_spline_2;
dsx_d_spline_2 = v_d*cos(Psi_d_spline_2);
dsy_d_spline_2 = v_d*sin(Psi_d_spline_2);
dPsi_dot_d_spline_2 = v_d*(b*v_d + 2*c*v_d*v_d*t + 3*e*v_d*v_d*v_d*t*t);

%% Return to ODE solver
d = [dkappa_d_spline_1, dPsi_d_spline_1, dsx_d_spline_1, dsy_d_spline_1, dPsi_dot_d_spline_1, dkappa_d_spline_2, dPsi_d_spline_2, dsx_d_spline_2, dsy_d_spline_2, dPsi_dot_d_spline_2]';

