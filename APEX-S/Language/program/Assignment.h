#ifndef ASSIGNMENT__H
#define ASSIGNMENT__H

#include "VariableRef.h"
#include "Expression.h"

/// class Assignment - 
class Assignment : public Expression {
  // Attributes
public:
  /// Reference to the variable which will be assigned to the value on the right hand side. It must be a writable variable.
  VariableRef variable;
  Expression value;
};

#endif
