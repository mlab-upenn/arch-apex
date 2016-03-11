#ifndef LOCALVARREF__H
#define LOCALVARREF__H

#include "VariableRef.h"

/// class LocalVarRef - Reference to a local variable defined in the current program.
class LocalVarRef : public VariableRef {
  // Attributes
public:
  /// The name of the local variable.
  string varName;
};

#endif
