#ifndef SENSORDISTANCEVEHICLE__H
#define SENSORDISTANCEVEHICLE__H

#include "SensorDistance.h"

/// class SensorDistanceVehicle - A sensor that returns the distance from the vehicle to another vehicle.
class SensorDistanceVehicle : public SensorDistance {
  // Attributes
public:
  /// If false, the distance can only be measured if the vehicle is on the same road segment as is the other vehicle. If true, the distance is measured across segments, as long as the other vehicle is on the same path as this vehicle. This setting can be overridden by acrossLanes.
  bool entirePath;
  /// If the vehicle is further than this threshold from the other, it can't measure the distance (return NaN if the measurement is polled).
  TPVLength threshold;
  /// Whether the distance can be measured across lanes. If false, the vehicles must be in the same lane in the same road segment (entirePath is overridden by this attribute). If true, the lanes do not matter (entirePath takes effect).
  bool acrossLanes;
  /// Reference to the other vehicle.
  Vehicle& to;
};

#endif
