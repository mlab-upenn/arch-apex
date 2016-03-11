#ifndef EXPRESSION__H
#define EXPRESSION__H

#include "Statement.h"
#include "DataType.h"

/// class Expression - An expression in a program, which must have a return type (e.g. bool, double, int).
class Expression : public Statement {
  // Associations
  DataType unnamed_1;
  // Attributes
public:
  /// The data type of the expression.
   type;
};

#endif
