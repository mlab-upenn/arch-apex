#ifndef VALUECONSTRAINTSINGLETON__H
#define VALUECONSTRAINTSINGLETON__H

#include "ValueConstraint.h"

/// class ValueConstraintSingleton - A scalar (singleton).
template < T>
class ValueConstraintSingleton : public ValueConstraint {
  // Attributes
public:
  /// The specific value.
  T value;
};

#endif
