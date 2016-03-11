#ifndef VEHICLE__H
#define VEHICLE__H

#include "VehicleController.h"
#include "Sensor.h"
#include "VehicleDynamics.h"

/// class Vehicle - This is a vehicle object.
class Vehicle {
  // Associations
  VehicleController unnamed_7;
  Sensor unnamed_3;
  VehicleDynamics unnamed_2;
  // Attributes
public:
  /// Length of the vehicle, in case it matters. For now, we can assume the vehicle is just a point, with length 0.
  TPVLength length;
};

#endif
