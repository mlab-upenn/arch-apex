options = odeset('Refine', 5);
r = ode45(@road_generate,[0,32],[0,0,0,0,0]);
figure
plot(r.y(3,:),r.y(4,:))