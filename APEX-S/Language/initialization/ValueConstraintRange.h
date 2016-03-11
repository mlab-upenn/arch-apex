#ifndef VALUECONSTRAINTRANGE__H
#define VALUECONSTRAINTRANGE__H

#include "ValueConstraint.h"

/// class ValueConstraintRange - A range of values, e.g. a real number between 0 and 1.
template < T>
class ValueConstraintRange : public ValueConstraint {
  // Attributes
public:
  /// From value.
  T beginValue;
  /// To value.
  T endValue;
};

#endif
