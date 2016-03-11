#ifndef LTOP__H
#define LTOP__H

#include "RelationalOp.h"

/// class LtOp - 
class LtOp : public RelationalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
