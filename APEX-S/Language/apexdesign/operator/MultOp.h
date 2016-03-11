#ifndef MULTOP__H
#define MULTOP__H

#include "ArithmeticOp.h"

/// class MultOp - 
class MultOp : public ArithmeticOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
