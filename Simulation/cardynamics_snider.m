function d = cardynamics_snider(t,x)
%% Simulation Parameters Ego Vehicle
% Vehicle Constants
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
beta = x(1);
psi=x(2);
psidot=x(3);
v=x(4);
sx=x(5);
sy=x(6);
delta=x(7);
Psid=x(8);
sxd=x(9);
syd=x(10);

%% Simulation Parameters
v_d =2;
sx_0 = 0;
sy_0 = 0;

%% Pure Pursuit Computations
% Init Goal Pair
global waypointx
global waypointy
% Pure Pursuit Calculations
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
r = abs(l*l/(2*(waypointx - sx_0)));

%% Vehicle Dynamics

% Desired Psi
if waypointx>sx_0 && waypointy>=sy_0
    dPsid=-(-((sy_0 + r*sin((t*v_d)/r))*(-2*v_d*(r + sx_0 + r*cos((t*v_d)/r))*sin((t*v_d)/r) + 2*v_d*cos((t*v_d)/r)*(sy_0 + r*sin((t*v_d)/r))))/(2*((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2)^(3/2)) + (v_d*cos((t*v_d)/r))/sqrt((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2))/sqrt(1 - (sy_0 + r*sin((t*v_d)/r))^2/((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2));
elseif waypointx<sx_0 && waypointy>=sy_0
    dPsid=(-((sy_0 + r*sin((t*v_d)/r))*(-2*v_d*(r + sx_0 + r*cos((t*v_d)/r))*sin((t*v_d)/r) + 2*v_d*cos((t*v_d)/r)*(sy_0 + r*sin((t*v_d)/r))))/(2*((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2)^(3/2)) + (v_d*cos((t*v_d)/r))/sqrt((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2))/sqrt(1 - (sy_0 + r*sin((t*v_d)/r))^2/((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2));
elseif waypointx<sx_0 && waypointy<=sy_0
    dPsid=-(-((sy_0 + r*sin((t*v_d)/r))*(-2*v_d*(r + sx_0 + r*cos((t*v_d)/r))*sin((t*v_d)/r) + 2*v_d*cos((t*v_d)/r)*(sy_0 + r*sin((t*v_d)/r))))/(2*((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2)^(3/2)) + (v_d*cos((t*v_d)/r))/sqrt((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2))/sqrt(1 - (sy_0 + r*sin((t*v_d)/r))^2/((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2));
elseif waypointx>sx_0 && waypointy<=sy_0
    dPsid=(-((sy_0 + r*sin((t*v_d)/r))*(-2*v_d*(r + sx_0 + r*cos((t*v_d)/r))*sin((t*v_d)/r) + 2*v_d*cos((t*v_d)/r)*(sy_0 + r*sin((t*v_d)/r))))/(2*((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2)^(3/2)) + (v_d*cos((t*v_d)/r))/sqrt((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2))/sqrt(1 - (sy_0 + r*sin((t*v_d)/r))^2/((r + sx_0 + r*cos((t*v_d)/r))^2 + (sy_0 + r*sin((t*v_d)/r))^2));
end

% Beta
dbeta = ((A/(m*v^2))-1)*psidot + Cf*delta/(m*v) - (Cf+Cr)*beta/(m*v);

% Psi
dpsi = psidot;

% Psi_dot
dpsidot = A*beta/Iz - ((lf^2*Cf+lr^2*Cr)/Iz)*(psidot/v) + (lf*Cf)*delta/Iz;

% Steering Tracking
%vw = k1*(cos(Psid)*(syd - sy) - sin(Psid)*(sxd - sx)) ...
%    +k2*(Psid - psi)...
%    +k3*(dPsid - dpsi)...
%    -k4*(delta);

% Velocity Tracking 
ax = k6*(v_d-v);

% Velocity
dv = ax;

% X and Y position
dsx = v*cos(beta+psi);
dsy = v*sin(beta+psi);

% Desired X and Y Positions
if waypointx>sx_0 && waypointy>=sy_0
    dsxd = v_d*sin(v_d*t/r);
    dsyd = v_d*cos(v_d*t/r);
elseif waypointx<sx_0 && waypointy>=sy_0
    dsxd= -v_d*sin(v_d*t/r);
    dsyd= v_d*cos(v_d*t/r);
elseif waypointx<sx_0 && waypointy<=sy_0
    dsxd= -v_d*sin(v_d*t/r);
    dsyd= -v_d*cos(v_d*t/r);
elseif waypointx>sx_0 && waypointy<=sy_0
    dsxd= v_d*sin(v_d*t/r);
    dsyd= -v_d*cos(v_d*t/r);
end

% Steering angle
ddelta = vw;

%% Return to ODE solver
d = [dbeta,dpsi,dpsidot,dv,dsx,dsy,ddelta,dPsid,dsxd,dsyd]';