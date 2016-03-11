#ifndef STATEFULTRAFFICCONTROL__H
#define STATEFULTRAFFICCONTROL__H

#include "TrafficControl.h"

/// class StatefulTrafficControl - A static object with discrete state (represented by an integer).
class StatefulTrafficControl : public TrafficControl {
  // Attributes
public:
  /// List of initial values for parameters of the object. For example, initial state of a traffic light, and its timing parameters.
  map<string,Parameter> initialParams;
  // Operations
public:
  /// Return the number of discrete states.
  virtual size_t getNumberOfStates () = 0;
};

#endif
