#ifndef EXECUTABLE__H
#define EXECUTABLE__H

#include "APEXObject.h"

/// class Executable - A program that describes an algorithm, e.g. a control algorithm for a vehicle, the behavior of a driver, etc. The attribute 'variabels' is a list of local variables.
class Executable : public APEXObject {
  // Attributes
public:
  /// Sampling time of the periodic task, in seconds.
  double samplingTime;
  // Operations
public:
  Variable& lookupVariable (VariableRef );
};

#endif
