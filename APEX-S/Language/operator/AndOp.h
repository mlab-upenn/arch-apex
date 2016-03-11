#ifndef ANDOP__H
#define ANDOP__H

#include "LogicalOp.h"

/// class AndOp - 
class AndOp : public LogicalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
