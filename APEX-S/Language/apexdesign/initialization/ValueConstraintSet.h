#ifndef VALUECONSTRAINTSET__H
#define VALUECONSTRAINTSET__H

#include "ValueConstraint.h"

/// class ValueConstraintSet - A set of values, e.g. an integer in {0, 1, 4, 6}.
template < T>
class ValueConstraintSet : public ValueConstraint {
  // Attributes
public:
  /// A set of values. Each member of the set must be unique.
  set<T> valueSet;
};

#endif
