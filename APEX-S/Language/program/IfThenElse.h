#ifndef IFTHENELSE__H
#define IFTHENELSE__H

#include "BranchStatement.h"
#include "StatementList.h"
#include "Expression.h"

/// class IfThenElse - 
class IfThenElse : public BranchStatement {
  // Associations
  StatementList unnamed_4;
  StatementList unnamed_3;
  Expression unnamed_2;
  // Attributes
public:
   condition;
   thenCode;
   elseCode;
};

#endif
