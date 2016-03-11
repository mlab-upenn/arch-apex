#ifndef FSMTRANSITION__H
#define FSMTRANSITION__H

#include "StatementList.h"
#include "Expression.h"
#include "FSMState.h"

/// class FSMTransition - 
class FSMTransition {
  // Associations
  StatementList unnamed_7;
  Expression unnamed_6;
  FSMState unnamed_4;
  FSMState unnamed_3;
  // Attributes
public:
  /// Source state.
   from;
  /// Destination state.
   to;
  /// The condition on which the transition may take place. It must be a boolean expression.
   condition;
  /// Action taken right after the transition takes place.
   action;
};

#endif
