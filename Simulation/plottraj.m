clear all
%% Simulation Parameters
global waypointx 
global waypointy 
% Desired velocity (m/s)
v_d =2;
% Time horizon (s)
tfinal= 4;
% Time series
t=[0:0.1:tfinal];
% Initial position x (m)
sx_0 = 0;
% Initial position y (m)
sy_0 = 0;
% Goal offset x (m)
deltax=4;
% Goal offset y (m)
deltay=7;
% Initial velocity (m/s)
init_v = 3;

%% Quadrant I

waypointx = sx_0+deltax;
waypointy = sy_0+deltay;

s1=ode45(@cardynamics_pp,[0,tfinal],[0,pi/2,0,init_v,0,0,0,pi/2,0,0]);
figure
subplot(4,2,2); 
plot(s1.x,s1.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant I')
xlabel('Time (s)')
ylabel('x(t)')
subplot(4,2,4); 
plot(s1.y(5,:), s1.y(6,:))
hold on
subplot(4,2,4); 
plot(s1.y(9,:), s1.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant I')
xlabel('x (m)')
ylabel('y (m)')
hold off

%% Quadrant II
waypointx = sx_0-deltax;
waypointy = sy_0+deltay;

s2=ode45(@cardynamics_pp,[0,tfinal],[0,pi/2,0,init_v,0,0,0,pi/2,0,0]);

subplot(4,2,1); 
plot(s2.x,s2.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant II')
xlabel('Time (s)')
ylabel('x(t)')

subplot(4,2,3); 
plot(s2.y(5,:), s2.y(6,:))
hold on
subplot(4,2,3); 
plot(s2.y(9,:), s2.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant II')
xlabel('x (m)')
ylabel('y (m)')
hold off

%% Quadrant III
waypointx = sx_0-deltax;
waypointy = sy_0-deltay;

% Note initial orientation and Psid init are both -pi/2 rather than pi/2
s3=ode45(@cardynamics_pp,[0,tfinal],[0,-pi/2,0,init_v,0,0,0,-pi/2,0,0]);

subplot(4,2,7); 
plot(s3.x,s3.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant II')
xlabel('Time (s)')
ylabel('x(t)')
subplot(4,2,5); 
plot(s3.y(5,:), s3.y(6,:))
hold on
subplot(4,2,5); 
plot(s3.y(9,:), s3.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant III')
xlabel('x (m)')
ylabel('y (m)')
hold off

%% Quadrant IV
waypointx = sx_0+deltax;
waypointy = sy_0-deltay;

s4=ode45(@cardynamics_pp,[0,tfinal],[0,-pi/2,0,init_v,0,0,0,-pi/2,0,0]);
subplot(4,2,8); 
plot(s4.x,s4.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant IV')
xlabel('Time (s)')
ylabel('x(t)')
subplot(4,2,6); 
plot(s4.y(5,:), s4.y(6,:))
hold on
subplot(4,2,6); 
plot(s4.y(9,:), s4.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant IV')
xlabel('x (m)')
ylabel('y (m)')
hold off




    
