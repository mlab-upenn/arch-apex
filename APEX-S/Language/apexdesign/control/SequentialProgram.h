#ifndef SEQUENTIALPROGRAM__H
#define SEQUENTIALPROGRAM__H

#include "Executable.h"
#include "StatementList.h"

/// class SequentialProgram - A sequence of statements that is executed periodically. The local variables are retained between executions.
class SequentialProgram : public Executable {
  // Associations
  StatementList unnamed_8;
  // Attributes
public:
   statements;
};

#endif
