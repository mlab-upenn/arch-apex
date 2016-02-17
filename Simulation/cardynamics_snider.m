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

%% Pure Pursuit Computations
% Init Goal Pair
global waypointx
global waypointy
global sx_0
global sy_0
global psi_0
global v_d

% Pure Pursuit Calculations
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
slope = atan2(waypointy-sy_0, waypointx-sx_0);
alpha = angdiff(psi_0,slope);
delta= 2*sin(alpha)/l;

%%
            % Angle between robot heading and the line connecting robot and
            % the carrot point
            %slope = atan2((obj.LookaheadPoint(2) - curPose(2)), ...
            %    (obj.LookaheadPoint(1) - curPose(1)));
            %alpha = robotics.internal.angdiff(curPose(3), slope);
            
            % Angular velocity command for a differential drive robot is
            % equal to the desired curvature to be followed by the robot.
            
            % Using eq. (2) on page 11 of Reference [1].
            %w = (2*sin(alpha))/obj.LookaheadDistance;

%% Vehicle Dynamics

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


%% Return to ODE solver
d = [dbeta,dpsi,dpsidot,dv,dsx,dsy]';