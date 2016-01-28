path = [2.00    1.00;
    1.25    1.75;
    5.25    8.25;
    7.25    8.75;
    11.75   10.75;
    12.00   10.00];
plot(path(:,1), path(:,2),'k--d')
xlim([0 13])
ylim([0 13])
robotCurrentLocation = path(1,:);
robotGoal = path(end,:);
initialOrientation = 0;
robotCurrentPose = [robotCurrentLocation initialOrientation];
robot = ExampleHelperDifferentialDriveRobot(robotCurrentPose);
controller = robotics.PurePursuit
controller.Waypoints = path;
controller.DesiredLinearVelocity = 0.3;
controller.MaxAngularVelocity = 2;
controller.LookaheadDistance = 0.5;
goalRadius = 0.1;
distanceToGoal = norm(robotCurrentLocation - robotGoal);
%%
while( distanceToGoal > goalRadius )

    % Compute the controller outputs, i.e., the inputs to the robot
    [v, omega] = step(controller, robot.CurrentPose);

    % Simulate the robot using the controller outputs.
    drive(robot, v, omega)

    % Extract current location information ([X,Y]) from the current pose of the
    % robot
    robotCurrentLocation = robot.CurrentPose(1:2);

    % Re-compute the distance to the goal
    distanceToGoal = norm(robotCurrentLocation - robotGoal);
end