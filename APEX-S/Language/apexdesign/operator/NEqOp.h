#ifndef NEQOP__H
#define NEQOP__H

#include "RelationalOp.h"

/// class NEqOp - 
class NEqOp : public RelationalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
