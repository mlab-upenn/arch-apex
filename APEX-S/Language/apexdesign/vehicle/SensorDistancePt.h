#ifndef SENSORDISTANCEPT__H
#define SENSORDISTANCEPT__H

#include "SensorDistance.h"

/// class SensorDistancePt - A sensor that returns the distance from the vehicle to a static object such as a traffic light or a stop sign.
class SensorDistancePt : public SensorDistance {
  // Attributes
public:
  /// If false, the distance can only be measured if the vehicle is on the road segment to which the object is attached at the end. If true, the distance is measured across segments, as long as the object is on the same path of the vehicle.
  bool entirePath;
  /// If the vehicle is further than this threshold from the point, it can't measure the distance (return NaN if the measurement is polled).
  TPVLength threshold;
};

#endif
