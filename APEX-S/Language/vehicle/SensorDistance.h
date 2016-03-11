#ifndef SENSORDISTANCE__H
#define SENSORDISTANCE__H

#include "Sensor.h"

/// class SensorDistance - An abstract distance sensor. There is only one output variable 'd' in the dictionary, which is the measured distance in the specified unit.
class SensorDistance : public Sensor {
  // Attributes
public:
  /// Desired unit for distance measurement. Must be a valid length unit, e.g. 'm', 'km', 'yd', 'ft', 'mi'
  string lengthUnit;
};

#endif
