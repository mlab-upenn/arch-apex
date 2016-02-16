clear all
%% Simulation Parameters
v_d =2;
tfinal= 4;
t=[0:0.1:tfinal];
sx_0 = 0;
sy_0 = 0;

%% Quadrant I
global waypointx 
global waypointy 
waypointx = sx_0+4;
waypointy = sy_0+7;

s1=ode45(@cardynamics_pp,[0,tfinal],[0,pi/2,0,2,0,0,0,pi/2,0,0]);
figure
subplot(2,1,1); 
plot(s1.x,s1.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant I')
xlabel('Time (s)')
ylabel('x(t)')
subplot(2,1,2); 
plot(s1.y(5,:), s1.y(6,:))
hold on
subplot(2,1,2); 
plot(s1.y(9,:), s1.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant I')
xlabel('x (m)')
ylabel('y (m)')
hold off

%% Quadrant II
waypointx = sx_0-4;
waypointy = sy_0+7;

s2=ode45(@cardynamics_pp,[0,tfinal],[0,pi/2,0,2,0,0,0,pi/2,0,0]);
figure
subplot(2,1,1); 
plot(s2.x,s2.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant II')
xlabel('Time (s)')
ylabel('x(t)')

subplot(2,1,2); 
plot(s2.y(5,:), s2.y(6,:))
hold on
subplot(2,1,2); 
plot(s2.y(9,:), s2.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant II')
xlabel('x (m)')
ylabel('y (m)')
hold off

%% Quadrant III
waypointx = sx_0-4;
waypointy = sy_0-7;

% Note initial orientation and Psid init are both -pi/2 rather than pi/2
s3=ode45(@cardynamics_pp,[0,tfinal],[0,-pi/2,0,2,0,0,0,-pi/2,0,0]);
figure
subplot(2,1,1); 
plot(s3.x,s3.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant II')
xlabel('Time (s)')
ylabel('x(t)')
subplot(2,1,2); 
plot(s3.y(5,:), s3.y(6,:))
hold on
subplot(2,1,2); 
plot(s3.y(9,:), s3.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant III')
xlabel('x (m)')
ylabel('y (m)')
hold off

%% Quadrant IV
waypointx = sx_0+4;
waypointy = sy_0-7;

s4=ode45(@cardynamics_pp,[0,tfinal],[0,-pi/2,0,2,0,0,0,-pi/2,0,0]);
figure
subplot(2,1,1); 
plot(s4.x,s4.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
title('Evolution of Ego-Vehicle State Quadrant IV')
xlabel('Time (s)')
ylabel('x(t)')
subplot(2,1,2); 
plot(s4.y(5,:), s4.y(6,:))
hold on
subplot(2,1,2); 
plot(s4.y(9,:), s4.y(10,:))
legend('sim', 'ref')
title('Trajectory of Ego Vehicle in X-Y Plane Quadrant IV')
xlabel('x (m)')
ylabel('y (m)')
hold off




    
