clear all
%% Simulation Parameters
v_d =2;
tfinal= 4;
t=[0:0.1:tfinal];
sx_0 = 0;
sy_0 = 0;

%% DON'T FORGET TO UPDATE WAYPOINTX AND WAYPOINTY IN CAR DYNAMICS
waypointx = sx_0-4;
waypointy= sy_0+7;

%%
s=ode45(@cardynamics_pp,[0,tfinal],[0,pi/2,0,2,0,0,0,pi/2,0,0]);
figure
plot(s.x,s.y)
legend('beta','psi','psidot','v','sx','sy', 'delta','Psid', 'sxd', 'syd')
figure
plot(s.y(5,:), s.y(6,:))
hold on
plot(s.y(9,:), s.y(10,:))
legend('sim', 'ref')
hold off


%%
if waypointx>sx_0 && waypointy>=sy_0
    % Pure Pursuit Calculations
    l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
    r = abs(l*l/(2*(waypointx - sx_0)));
    cx=sx_0+r;
    cy=sy_0;
    
    % Plot
    xQ1=cx-r*cos(v_d*t/r);
    yQ1=cy+r*sin(v_d*t/r);
    
    % Compute orientation
    normQ1 = sqrt(xQ1.^2+yQ1.^2);
    psiQ1 = asin(yQ1./normQ1);
    figure
    plot(t,psiQ1)
    hold on
    plot(s.x,s.y(8,:))

elseif waypointx<sx_0 && waypointy>=sx_0
    % Pure Pursuit Calculations
    l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
    r = abs(l*l/(2*(waypointx - sx_0)));
    cx=sx_0-r;
    cy=sy_0;
    
    % Plot
    xQ2=cx+r*cos(v_d*t/r);
    yQ2=cy+r*sin(v_d*t/r);
    
    % Compute orientation
    normQ2 = sqrt(xQ2.^2+yQ2.^2);
    psiQ2 = pi-asin(yQ2./normQ2);
    figure
    plot(t,psiQ2)
    hold on
    plot(s.x,s.y(8,:))
end
    
