clc
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
global s
global kappa_0
global kappa_1
global kappa_2
global kappa_3

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
%s = (33.831636);
%kappa_0 =(0.000000);
%kappa_1 = (0.006046);
%kappa_2 = (-0.000322);
%kappa_3 = (0.000000);

a = kappa_0;
b = ((-0.50)*(-2*kappa_3 + 11*kappa_0 - 18*kappa_1 + 9*kappa_2)/s);
c = ((4.50)*(-kappa_3 + 2*kappa_0 - 5*kappa_1 +4*kappa_2)/(s*s));
e = ((-4.50)*(-kappa_3 + kappa_0 - 3*kappa_1 + 3*kappa_2)/(s*s*s));

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

%% Call Plotting Routine
% Plot Trajectory and Waypoints
hold on
plot(waypointx,waypointy, 'd')
title('Trajectory of Ego Vehicle in X-Y Plane')
xlabel('x (m)')
ylabel('y (m)')
pbaspect([40 7 1])
gleft=ode45(@traj_dynamics,[0:0.0001:4],[0,0,0,0,0]);
plot(gleft.y(3,:),gleft.y(4,:)+1, 'black')
plot(gleft.y(3,:),gleft.y(4,:)-1, 'black')
axis([sx_0 sx_0+(4*11.1) sy_0-2 sy_0+5])

%% Update Variables
time=tsched;
delta_old=delta;

%% Follow the Road Centerline
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
plot(s1.y(5,:), s1.y(6,:))
hold on
plot(waypointx, waypointy, 'd')

for i=1:length(s1.y(5,:))
    deltadelta=delta-delta_old;
    % Update Vehicle Body
    x=[s1.y(5,i)-1  s1.y(5,i)+1 s1.y(5,i)+1 s1.y(5,i)-1];
    y=[s1.y(6,i)-0.5 s1.y(6,i)-0.5 s1.y(6,i)+0.5 s1.y(6,i)+0.5];
    direction = [0 0 1];
    origin=[s1.y(5,i) s1.y(6,i) 0];
    obj =patch(x,y,'red');
    rotate(obj, direction, rad2deg(s1.y(2,i)), origin);
    
    % Update Left Front Wheel
	wheel1origin = [s1.y(5,i)+0.75, s1.y(6,i)+0.4, 0];
	wheel1x = [(s1.y(5,i)+.6)  (s1.y(5,i)+.9)  (s1.y(5,i)+.9) (s1.y(5,i)+.6)];
	wheel1y = [(s1.y(6,i)+.35) (s1.y(6,i)+.35) (s1.y(6,i)+.45) (s1.y(6,i)+.45)];
	wheel1 =patch(wheel1x,wheel1y,'black');
    rotate(wheel1, direction, rad2deg(s1.y(2,i)), origin);
	rotate(wheel1, direction, rad2deg(deltadelta), wheel1origin);
   
    % Update Right Front Wheel
    wheel2origin = [s1.y(5,i)+0.75, s1.y(6,i)-0.4, 0];
	wheel2x = [(s1.y(5,i)+.6)  (s1.y(5,i)+.9)  (s1.y(5,i)+.9) (s1.y(5,i)+.6)];
	wheel2y = [(s1.y(6,i)-.35) (s1.y(6,i)-.35) (s1.y(6,i)-.45) (s1.y(6,i)-.45)];
	wheel2 =patch(wheel2x,wheel2y,'black');
    rotate(wheel2, direction, rad2deg(s1.y(2,i)), origin);
	rotate(wheel2, direction, rad2deg(deltadelta), wheel2origin);
    
    % Update Rear Right Wheel
    wheel3origin = [s1.y(5,i)-0.75, s1.y(6,i)-0.4, 0];
	wheel3x = [(s1.y(5,i)-.6)  (s1.y(5,i)-.9)  (s1.y(5,i)-.9) (s1.y(5,i)-.6)];
	wheel3y = [(s1.y(6,i)-.35) (s1.y(6,i)-.35) (s1.y(6,i)-.45) (s1.y(6,i)-.45)];
	wheel3 =patch(wheel3x,wheel3y,'black');
    rotate(wheel3, direction, rad2deg(s1.y(2,i)), origin);
    
    % Update Rear Left Wheel
    wheel4origin = [s1.y(5,i)-0.75, s1.y(6,i)+0.4, 0];
	wheel4x = [(s1.y(5,i)-.6)  (s1.y(5,i)-.9)  (s1.y(5,i)-.9) (s1.y(5,i)-.6)];
	wheel4y = [(s1.y(6,i)+.35) (s1.y(6,i)+.35) (s1.y(6,i)+.45) (s1.y(6,i)+.45)];
	wheel4 =patch(wheel4x,wheel4y,'black');
    rotate(wheel4, direction, rad2deg(s1.y(2,i)), origin);
   
    drawnow
    hidem(obj)
    hidem(wheel1)
    hidem(wheel2)
    hidem(wheel3)
    hidem(wheel4)

 	delta_old = delta;
end


time=time+tsched;


end

