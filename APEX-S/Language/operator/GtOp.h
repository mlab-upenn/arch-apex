#ifndef GTOP__H
#define GTOP__H

#include "RelationalOp.h"

/// class GtOp - 
class GtOp : public RelationalOp {
  // Attributes
public:
  Expression op1;
  Expression op2;
};

#endif
