function d = initEnv2(t,x)
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
kappa_env2 = x(1);
Psi_env2 = x(2);
sx_env2= x(3);
sy_env2 = x(4);

%% Simulate env-vehicle #1
dkappa_env2 = b*v_env2 + 2*c*v_env2*v_env2*t + 3*e*v_env2*v_env2*v_env2*t*t ;
dPsi_env2= v_env2*kappa_env2;
dsx_env2= v_env2*cos(Psi_env2);
dsy_env2 = v_env2*sin(Psi_env2);

d=[dkappa_env2, dPsi_env2, dsx_env2, dsy_env2]';