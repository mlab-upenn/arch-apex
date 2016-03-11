#ifndef EQOP__H
#define EQOP__H

#include "RelationalOp.h"

/// class EqOp - 
class EqOp : public RelationalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
