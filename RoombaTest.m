%%create a serial port object
[serialObject] = RoombaInit(1);
 %Read distance sensor
 InitDistance = DistanceSensorRoomba(serialObject);
 
 %sets forward velocity at .5 m/s and turning radius 2 m
 SetFwdVelRadiusRoomba(serialObject, .5, 2);
 
 %wait 1 second
 pause(1);
 
 %stop the robot
 SetFwdVelRadiusRoomba(serialObject, 0, 1);
 
 %read distance sensor
 %returns dist since last reading in m
 Distance = DistanceSensorRoomba(serialObject);
 
 %% move the roomba straight using inf
 SetFwdVelRadiusRoomba(serialObject, .5, inf);
 pause(1);
 SetFwdVelRadiusRoomba(serialObject, 0, 0);
 
 %% see what travelDist does
 travelDist(serialObject, .5, 1);
 
 %% turn 90 deg to right
 turnAngle(serialObject, .1, -90);