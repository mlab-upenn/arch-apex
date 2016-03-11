#ifndef OROP__H
#define OROP__H

#include "LogicalOp.h"

/// class OrOp - 
class OrOp : public LogicalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
