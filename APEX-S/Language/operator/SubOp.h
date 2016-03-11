#ifndef SUBOP__H
#define SUBOP__H

#include "ArithmeticOp.h"

/// class SubOp - 
class SubOp : public ArithmeticOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
