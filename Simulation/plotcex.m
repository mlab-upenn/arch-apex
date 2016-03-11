%% Read in Counterexample
% Convert JSON to .mat... takes forever. In real software we can implement
% more efficiently
%data = loadjson('data.json');

% Load .mat parsed from json file...
cex = load('cex.mat')

%% Choose a value within the interval at each time step

for i=1:length(cex.data.traces{1,1}{1,8}.values)
% Read in first value sx:
sx1(i)=cex.data.traces{1,1}{1,8}.values{1,i}.enclosure(1,1);
% Read in the second value sx:
sx2(i)=cex.data.traces{1,1}{1,8}.values{1,i}.enclosure(1,2);
% Read in first value sy:
sy1(i)=cex.data.traces{1,1}{1,10}.values{1,i}.enclosure(1,1);
% Read in the second value sy:
sy2(i)=cex.data.traces{1,1}{1,10}.values{1,i}.enclosure(1,2);
% Read in first value Psi:
psi1(i)=cex.data.traces{1,1}{1,2}.values{1,i}.enclosure(1,1);
% Read in second value Psi:
psi2(i)=cex.data.traces{1,1}{1,2}.values{1,i}.enclosure(1,2);
end

for i=1:length(cex.data.traces{1,1}{1,14}.values)
    sx_env1(i)=cex.data.traces{1,1}{1,14}.values{1,i}.enclosure(1,1);
    sx_env2(i)=cex.data.traces{1,1}{1,14}.values{1,i}.enclosure(1,2);
end
    

sx(1)=0;
sy(1)=0;
psi(1)=0;
for i=2:length(sy1)
    % Pick a value for sx
    sx(i)=(sx2(i)-sx(i-1)).*rand(1,1) + sx(i-1);
    sxmin(i)=min(sx2(i),sx1(i));
    sxmax(i)=max(sx2(i),sx1(i));
    sxavg(i)=(sxmin(i)+sxmax(i))/2;
    % Pick a value for sy
    sy(i)=(sy2(i)-sy(i-1)).*rand(1,1) + sy(i-1);
    symin(i)=min(sy2(i),sy1(i));
    symax(i)=max(sy2(i),sy1(i));
    syavg(i)=(symin(i)+symax(i))/2;
    % Pick a value for Psi
    psi(i)=(psi2(i)-psi(i-1)).*rand(1,1) + psi(i-1);
end


%% Animate Scenario 
% Get current position ready to draw
figure
title('Trajectory of Ego Vehicle in X-Y Plane')
xlabel('x (m)')
ylabel('y (m)')
pbaspect([40 7 1])
axis([0 50 -2 10])

x=[sx_env1(1)-1.5  sx_env1(1)+1.5 sx_env1(1)+1.5 sx_env1(1)-1.5];
y=[-1 -1 +1 +1];
direction = [0 0 1];
origin=[sx(i) 0 0];
obj3 =patch(x,y,'blue');
drawnow

% Erase previous postion
% Draw current position 
for i=1:15:length(sx)-1
    % Update Vehicle Body 1 (Random)
    x=[sxmin(i)-1.5  sxmax(i)+1.5 sxmax(i)+1.5 sxmin(i)-1.5];
    y=[symin(i)-1 symin(i)-1 symax(i)+1 symax(i)+1];
    direction = [0 0 1];
    origin=[sx(i) sy(i) 0];
    obj2 =patch(x,y,'red');
    rotate(obj2, direction, rad2deg(psi(i)), origin);
    
    % Update Vehicle Body 1 (Random)
    x=[sxavg(i)-1.5  sxavg(i)+1.5 sxavg(i)+1.5 sxavg(i)-1.5];
    y=[syavg(i)-1 syavg(i)-1 syavg(i)+1 syavg(i)+1];
    direction = [0 0 1];
    origin=[sx(i) sy(i) 0];
    obj1 =patch(x,y,'green');
    rotate(obj1, direction, rad2deg(psi(i)), origin);
    

    
    % Update Vehicle Body 2 (sxmax,symin)
    % x=[sxmin(i)-1.5  sxmax(i)+1.5 sxmax(i)+1.5 sxmin(i)-1.5];
    % y=[symin(i)-1 symin(i)-1 symax(i)+1 symax(i)+1];
    % direction = [0 0 1];
    % origin=[sxmax(i) symin(i) 0];
    % obj2 =patch(x,y,'red');
    % rotate(obj2, direction, rad2deg(psi(i)), origin); 
    drawnow
    hidem(obj1)
    hidem(obj2)
end
