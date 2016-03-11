#ifndef LTEQOP__H
#define LTEQOP__H

#include "RelationalOp.h"

/// class LtEqOp - 
class LtEqOp : public RelationalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
