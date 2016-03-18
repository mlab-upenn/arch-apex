%% TaLiRo Monitor
% Computing the robustness estimate of timed state
% sequences of Metric Temporal Logic formulas in Simulink
%
%% Compatibility
% Moniroting tool box is compatible with Matlab version R2012a or later 
%
%% INPUTS
%  The TaLiRo monitor has a single input port for the input signal. If 
%  multi-dimensional input is required, then use a "Vector Concatenate" or
%  a "Bus Creator" or a "Mux" block.
%  
%% Function Block Parameters
%  -SampleTime is the sampling time of monitoring block (real value).
%  -SpecificationName is a string of the form "phi" or "phi{i}" (where i>0). 
%   The string is the name of MTL formula in the Matlab Workspace.
%  -PredicateMap is a string like "pred" which corresponds to predicate map 
%   in the Matlab Workspace.
%
%% PARAMETERS ( Define in Matlab Workspace )
%
%
%  'phi' and 'pred' are default name of parameters that should be set in 
%   Matlab workspace before simulation:
%   phi,phi{i} - Metric Temporal Logic formula
%              Any name can be used instead of "phi" like "spec","formula"
%              as long as it is provided for SpecificationName as Block 
%              Parameters.
%
%    Syntax: 
%       phi{i} := p | (phi) | !phi | phi \/ phi | phi /\ phi |
%                 phi -> phi | phi <-> phi | 
%                 X phi | phi U_[a,b] phi | phi R_[a,b] phi | 
%                 <>_[a,b] phi | []_[a,b] phi
%                 P phi | phi S_[a,b} phi | phi T_[a,b} phi | 
%                 <.>_[a,b} phi | [.]_[a,b} phi
%        where:  
%            i     is a positive integer value. i is index of formula if it
%                  is cell. If formula is not cell then use without {i}.
%            p     is a predicate. Its first character must be a lowercase 
%                  letter and it may contain numeric digits.
%                  Examples: 
%                         pred1, isGateOpen2  
%
%            !     is not 
%
%            \/    is 'or'
%
%            /\    is 'and'
%
%            ->    is 'implies'
%
%            <->   if 'if and only if'
%
%            [a,b} where a and b are non-negative integer values and
%                  } is ) when b is inf and } is ] when b is integer.
%
%            X     is the 'next' operator. It is equivalent to <>_[1,1].
%
%            U_[a,b] is the 'until' operator with time bounds [a,b]. 
%
%            R_[a,b] is the 'release' operator with time bounds [a,b].
%
%            <>_[a,b] is the 'eventually' operator with time bounds [a,b].
%
%            []_[a,b] is the 'always' operator with time bounds [a,b].   
%
%            P    is the 'previous' operator. It is equivalent to <.>_[1,1].
%
%            S_[a,b} is the 'since' operator with time bounds [a,b}. 
%                  If no time bounds are required, then use S.
%
%            T_[a,b} is the 'trigger' operator (past time version of 
%                  'release') with time bounds [a,b}. If no time bounds are
%                  required, then use T.
%
%            <.>_[a,b} is the 'eventually in past' operator with time bounds [a,b}.
%                  If no timing constraints are required, then simply use <.>.
%
%            [.]_[a,b} is the 'always in past' operator with time bounds [a,b}.  
%                  If no timing constraints are required, then simply use [.].
%
%          Examples:
%             * Always between 3 to 5 time unit in the past 'p1' implies 
%                      eventually 'p2' within 1 time unit
%                   phi{1} = '[.]_[3,5](p1 -> <>_[0,1] p2)';
%               (Bounded response)
%             * 'p1' is true until 'p2' becomes true after 4 and before 7  
%               time units
%                   phi{2} = 'p1 U_[4,7] p2';
%             * 'p1' eventually will become true between 1 and 6 
%               time units 
%                   phi{3} = '<>_[1,6] p1';
%             * 'p2' must always be true between 2 and 9 time units 
%               unless 'p1' becomes true before that
%                   phi{4} = 'p1 R_[2,9] p2';
%   pred - The mapping of the predicates to their respective states.
%            Any name can be used instead of "pred" like "predicate",
%            "predmap" as long as it is provided as PredicateMap in Block 
%            Parameters.
%
%          pred(i).str : the predicate name as a string 
%          pred(i).A, pred(i).b : a constraint of the form Ax<=b
%              Setting A and b to [] implies no constraints. That is, the set
%              is R^n.
%
%          Examples:
%             * 'p1' indicates that x>=-2:
%                pred(1).str = 'p1';
%                pred(1).A = -1.0;
%                pred(1).b = 2.0;
%             
%             * 'p2' indicates that x<=2:
%                pred(2).str = 'p2';
%                pred(2).A = 1.0;
%                pred(2).b = 2.0;
%
%
%% OUTPUT
%
%
%  The robustness estimate at each simulation step.
%
%
%
