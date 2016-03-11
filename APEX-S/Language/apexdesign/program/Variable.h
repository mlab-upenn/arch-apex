#ifndef VARIABLE__H
#define VARIABLE__H

#include "DataType.h"

/// class Variable - A variable, which can be read and/or write.
class Variable {
  // Associations
  DataType unnamed_6;
  // Attributes
public:
  /// Data type of the variable.
   type;
  /// Initial literal value.
  string initValue;
  /// true if the variable can only be read by programs, e.g. a sensor's output. If false, it can also be written, e.g. a control input to the vehicle.
  bool readOnly;
  /// Description (text) of the variable.
  string description;
};

#endif
