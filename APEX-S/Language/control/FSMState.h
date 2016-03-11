#ifndef FSMSTATE__H
#define FSMSTATE__H

/// class FSMState - 
class FSMState {
  // Attributes
public:
  /// Name of the state.
  string name;
  /// An FSM never settles on an intermediate state.
  bool intermediate;
  /// Initial state? An FSM must have exactly one initial state, which is not an intermediate one.
  bool initial;
};

#endif
