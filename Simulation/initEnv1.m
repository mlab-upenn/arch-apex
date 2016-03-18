function d = initEnv1(t,x)
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

%Env vehicle 1
kappa_env1 = x(1);
Psi_env1 = x(2);
sx_env1= x(3);
sy_env1 = x(4);

%% Simulate env-vehicle #1
dkappa_env1 = b*v_env1 + 2*c*v_env1*v_env1*t + 3*e*v_env1*v_env1*v_env1*t*t ;
dPsi_env1 = v_env1*kappa_env1;
dsx_env1 = v_env1*cos(Psi_env1);
dsy_env1 = v_env1*sin(Psi_env1);

d=[dkappa_env1, dPsi_env1, dsx_env1, dsy_env1]';