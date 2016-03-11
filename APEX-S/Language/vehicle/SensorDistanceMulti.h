#ifndef SENSORDISTANCEMULTI__H
#define SENSORDISTANCEMULTI__H

#include "SensorDistance.h"

/// class SensorDistanceMulti - Multiple distance sensors are used, and the minimum value is returned (or NaN if they all return NaN). All sub-sensors must have the same length unit, but can have different thresholds and other settings.
class SensorDistanceMulti : public SensorDistance {
  // Associations
  SensorDistance unnamed_5;
};

#endif
