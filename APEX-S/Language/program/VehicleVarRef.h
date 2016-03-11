#ifndef VEHICLEVARREF__H
#define VEHICLEVARREF__H

#include "VariableRef.h"

/// class VehicleVarRef - Reference to a vehicle variable defined in the current vehicle.
class VehicleVarRef : public VariableRef {
  // Attributes
public:
  /// The name of the local variable.
  string varName;
};

#endif
