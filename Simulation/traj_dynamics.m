function d = traj_dynamics(t,x)

global a
global b
global c
global e
global v_d

kappa_d_spline_1 = x(1);
Psi_d_spline_1 = x(2);
sx_d_spline_1 = x(3);
sy_d_spline_1 = x(4);
Psi_dot_d_spline_1 =x(5);

dkappa_d_spline_1 = b*v_d + 2*c*v_d*v_d*t + 3*e*v_d*v_d*v_d*t*t ;
dPsi_d_spline_1 = v_d*kappa_d_spline_1;
dsx_d_spline_1 = v_d*cos(Psi_d_spline_1);
dsy_d_spline_1 = v_d*sin(Psi_d_spline_1);
dPsi_dot_d_spline_1 = v_d*(b*v_d + 2*c*v_d*v_d*t + 3*e*v_d*v_d*v_d*t*t);

%% Return to ODE solver
d = [dkappa_d_spline_1, dPsi_d_spline_1, dsx_d_spline_1, dsy_d_spline_1, dPsi_dot_d_spline_1]';