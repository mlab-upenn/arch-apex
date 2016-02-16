%% Plot
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
    plot(s1.x,s1.y(8,:))
    title('Psi Desired Quadrant I')

elseif waypointx<sx_0 && waypointy>=sy_0
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
    plot(s2.x,s2.y(8,:))
     title('Psi Desired Quadrant II')
end

% Pure Pursuit Calculations
l = sqrt((waypointx - sx_0)*(waypointx - sx_0) + (waypointy - sy_0)*(waypointy - sy_0));
r = abs((l*l/(2*(sx_0-waypointx))));
cx=(sx_0 - r);
cy=sy_0;

% Plot
xQ3=(cx+r*cos(v_d*t/r));
yQ3=(cy-r*sin(v_d*t/r));
% Compute orientation
normQ3 = sqrt(xQ3.^2+yQ3.^2);
psiQ3 = pi- asin(yQ3./normQ3);

figure
plot(t,psiQ3)
axis([0 tfinal 0 2*pi])
legend('psiQ3')
hold on
plot(s3.x,s3.y(8,:))
title('Psi Desired Quadrant III')
legend('Reference', 'Actual')
