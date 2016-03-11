#ifndef CONSTVALUE__H
#define CONSTVALUE__H

#include "Expression.h"

/// class ConstValue - A constant value.
class ConstValue : public Expression {
  // Attributes
public:
  /// A literal string that represents the constant value, e.g. '3.14'
  string value;
};

#endif
