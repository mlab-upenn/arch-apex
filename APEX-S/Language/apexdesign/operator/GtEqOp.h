#ifndef GTEQOP__H
#define GTEQOP__H

#include "RelationalOp.h"

/// class GtEqOp - 
class GtEqOp : public RelationalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
