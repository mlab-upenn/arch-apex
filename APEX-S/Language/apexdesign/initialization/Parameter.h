#ifndef PARAMETER__H
#define PARAMETER__H

#include "ValueConstraint.h"

/// class Parameter - A parameter that can be initialized, either to a scalar value or a range/constraint on the value.
class Parameter {
  // Associations
  ValueConstraint unnamed_1;
  // Attributes
public:
  /// Description (text) of the parameter.
  string description;
  /// What is the value or value range of the parameter?
  ValueConstraint value;
};

#endif
