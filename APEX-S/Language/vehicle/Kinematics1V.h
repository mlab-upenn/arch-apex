#ifndef KINEMATICS1V__H
#define KINEMATICS1V__H

#include "VehicleDynamics.h"

/// class Kinematics1V - Simple 1-D kinematics, with velocity being controlled (i.e. v can be written).
class Kinematics1V : public VehicleDynamics {
  // Attributes
public:
  /// Maximum allowed velocity.
  TPVVelo maxV;
  /// Minimum allowed velocity.
  TPVVelo minV;
};

#endif
