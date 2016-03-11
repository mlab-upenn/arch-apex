#ifndef EXECUTABLEPLATFORM__H
#define EXECUTABLEPLATFORM__H

#include "Executable.h"

/// class ExecutablePlatform - An abstract class for a platform that executes programs.
class ExecutablePlatform {
  // Associations
  Executable unnamed_1;
  // Operations
public:
  virtual Variable& lookupVariable (VariableRef ) = 0;
};

#endif
