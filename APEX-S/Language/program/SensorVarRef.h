#ifndef SENSORVARREF__H
#define SENSORVARREF__H

#include "VariableRef.h"

/// class SensorVarRef - Reference to a sensor variable defined in the current vehicle.
class SensorVarRef : public VariableRef {
  // Attributes
public:
  /// The name of the local variable.
  string varName;
  string sensorName;
};

#endif
