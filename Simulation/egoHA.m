%   init - initial continuous set. 
%       A structure with fileds: loc and cube
%           loc : the initial locations
%           cube : A hyper cube of the form 
%                   [x1_m x1_M; ... ; xn_m xn_M]
%               where n is the size of the continuous state vector, m
%               stands for min and M stands for Max.
%
%   loc - The dynamics in each location, which is the following structure:
%       loc(i).dyn: A boolean value:
%           0 - for linear with a constant drift, then loc must contain the
%               following fields as well:
%               loc(i).A : The matrix A_i of location i in eq. (2) 
%               loc(i).b : The vector b_i of location i in eq. (2) 
%           1 - for any function providing the derivative of the system,
%               then loc must contain the following field as well:
%               loc(i).f : The function pointer for eq. (1)
%                   Example: loc(1).f = @(t,x) 2*x(1)^2+x(1)*x(2);
%
%   adjList - The adjacency list, which is a cell array 
%       adjList{i} : The adjacency list for each location i
%           Example: location 1 has transitions to locations 2 and 3
%                    then adjList{1} = [2 3];
%
%   guards - The guard set, which is the following structure:
%       guards(i,j).A; guards(i,j).b;
%           The guard for the transition from location i to j.      
%           The guards are defined using a finite number of unions and 
%           intersections of halfspaces: a*x<=b. 
%           Example 1:
%               Gij = {x|([a_11 a_12]*x<=b_1 /\ [a_21 a_22]*x<=b_2)}
%           then
%               guards(i,j).A = [a_11 a_12; a_21 a_22];
%               guards(i,j).b = [b_1; b_2];
%           Example 2:
%               Gij = {x|(a_1*x<=b_1 /\ a_2*x<=b_2) \/ [a_31 a_32]*x<=b_3}
%           then
%               guards(i,j).A{1} = [a_11 a_12; a_21 a_22];
%               guards(i,j).b{1} = [b_1; b_2];
%               guards(i,j).A{2} = [a_31 a_32];
%               guards(i,j).b{2} = b_3;
%           In detail, A is either a matrix noc*nos where noc is the number
%           of conjunctions and nos is the number of continuous states or
%           cell list of length nod (nod is the number of disjunctions) 
%           where each entry is a matrix as before. 
%
%   unsafe - (optional) The unsafe set, which is the following structure:
%       unsafe.A; unsafe.b; 
%           The data structure is the same as for the guards above.
%
%   target - (optional) The target set, which is the following structure:
%       target.A; target.b; 
%           The data structure is the same as for the guards above.
% 
%% Define the ego-vehicle agent inital state "ego.init"

%% Define the ego-vehicle agent HA locations "ego.loc"
% This is where we define the dynamics for the ego-vehicle
%       loc(i).dyn: A boolean value:
%           0 - for linear with a constant drift, then loc must contain the
%               following fields as well:
%               loc(i).A : The matrix A_i of location i in eq. (2) 
%               loc(i).b : The vector b_i of location i in eq. (2) 
%           1 - for any function providing the derivative of the system,
%               then loc must contain the following field as well:
%               loc(i).f : The function pointer for eq. (1)
%                   Example: loc(1).f = @(t,x) 2*x(1)^2+x(1)*x(2);

ego.loc(1).f=@cardynamics_snider;
ego.loc(2).f=@

%% Define the ego-vehicle agent HA adjacency list "ego.adjList"

%% Define the ego-vehicle agent HA guards "ego.guards"

%% Define the ego-vehicle agent HA unsafe set "ego.unsafe"

%% Define the ego-vehicle agent HA target set "ego.target"

