#ifndef SENSORSTATE__H
#define SENSORSTATE__H

#include "Sensor.h"

/// class SensorState - Sensor that can measure the state of a state static object (e.g. traffic light). It has one output variable 's' which is an integer that returns the state of the observed object.
class SensorState : public Sensor {
  // Attributes
public:
  /// If false, the state can only be observed if the vehicle is on the road segment to which the object is attached at the end. If true, the object can be observed across segments, as long as the object is on the same path of the vehicle.
  bool entirePath;
  /// If the vehicle is further than this threshold from the object, it can't observe the state (return -1 if the measurement is polled).
  TPVLength threshold;
};

#endif
