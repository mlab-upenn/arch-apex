#ifndef KINEMATICS1A__H
#define KINEMATICS1A__H

#include "VehicleDynamics.h"

/// class Kinematics1A - Simple 1-D kinematics, with acceleration being controlled (i.e. a can be written).
class Kinematics1A : public VehicleDynamics {
  // Attributes
public:
  /// Maximum allowed acceleration.
  TPVAccel maxA;
  /// Minimum allowed acceleration.
  TPVAccel minA;
  /// Maximum allowed velocity (could be inf in case none exists).
  TPVVelo maxV;
  /// Minimum allowed velocity (could be -inf in case none exists).
  TPVVelo minV;
};

#endif
