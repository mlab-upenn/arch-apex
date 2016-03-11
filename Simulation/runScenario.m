global tlookahead
global time

while tlookahead<4

tlookahead= time+0.2;
% Compute the Next Waypoint
computation_state = [0,0,0,0,0,0,0,0,0,0]';
g1=ode45(@computation,[0,tlookahead],computation_state);
g1=ode45(@traj_dynamics,[0,tlookahead],[0,0,0,0,0]);
deltax=g1.y(3,end);
deltay=g1.y(4,end);
waypointx = 0+deltax;
waypointy = 0+deltay;

% Update Ego Vehicle State
scenario_state=[s1.y(1,end),s1.y(2,end),s1.y(3,end),s1.y(4,end),s1.y(5,end),s1.y(6,end), s1.y(7,end), s1.y(8,end), s1.y(9,end), s1.y(10,end), s1.y(11,end), s1.y(12,end), s1.y(13,end), s1.y(14,end)]'
s1=ode45(@scenario,[0,0.1],scenario_state);

time=time+tsched;

end