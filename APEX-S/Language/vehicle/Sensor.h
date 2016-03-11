#ifndef SENSOR__H
#define SENSOR__H

#include "APEXObject.h"

/// class Sensor - A sensor. Its variables are the sensor outputs that the controller can read from, typically the measurement.
class Sensor : public APEXObject {
  // Attributes
public:
  /// Name of the sensor.
  string name;
};

#endif
