classdef staliro_options < handle
% Class definition for the S-Taliro options
%
% opt = staliro_options
%
% The above function call sets the following default values for the class
% properties (along with a description of other possible choices). Each 
% property is initialized to the default value.
%
% opt.optimization_solver = 'SA_Taliro';
%   Current options:
%       1. 'SA_Taliro': Simulated Annealing with hit and run Monte Carlo
%                sampling
%       2. 'ACO_Taliro': Extended Ant Colony Optimization
%       3. 'GA_Taliro': Genetic Algorithms. The Genetic Algorithm
%                toolbox by Mathworks must be installed.
%       4. 'UR_Taliro': Uniform random sampling of the parameter
%                space
%       5. 'CE_Taliro' : Cross entropy method for sampling.
%
%   Each optimization algorithm has an accompanying parameters class
%	which is named X_parameters where X is the name of the m-file  
%	implementing the optimization algorithm. For example, type 
%		help SA_Taliro_parameters 
%   to see the available options for SA_Taliro.
%   In order to set the parameters for an optimization algorithm, then
%	you need to set the "optim_params" property of the staliro_options 
%	object.
%
%   Other optimization algorithms can be found in the dir "optimization".
%   See optimization\readme.txt for instructions on how to write a 
%   wrapper for your own optimization function.
%
% opt.optimization_solver = 'SA_Taliro';
%	Set the optimization parameters for the optimization algorithm. 
%	Each algorithm has its own class of parameters. 
%	See optimization_solver for further instructions.
%
% opt.ode_solver = 'default';
%   This option selects the ODE solver. The default option is 'ode45'.
%   It is recommended that the option is set to 'default' for Simulink
%   models. For Simulink models, the default option uses the default
%   solver inside the Simulink model.
%
% opt.falsification = 1;
%   If this option is set to true (1), then S-Taliro performs
%   falsification. That is, it stops executing when a trajectory of
%   negative robustness value is detected.
%   If this option is set to false (0), then S-Taliro performs
%   minimization. That is, even if a falsifying trajectory is found,
%   S-Taliro continues the search for the worst possible behavior.
%
% opt.interpolationtype = {'pchip'};
%   The options for interpolation functions are the same as the options
%   of the Matlab function interp1. Please type "help interp1" to see the
%   options. The additional options not supported in interp1 are 'pconst'
%   for piecewise constant signals and 'const' for constant signals.
%
%   One interpolation function must be provided for each input signal. For
%   example if input signal 1 is a piecewise constant signal and input
%   signal 2 is a piecewise linear signal. Then,
%           opt.interpolationtype={'pconst'; 'linear'};
%
%   Notes:
%   * If you select 'const', then only one control point must be provided
%     as option for the corresponding input signal.
%   * If there are multiple input signals and all of them are using the
%     same interpolation function, then only one interpolation function
%     need to be specified. For example, if there are 3 input signals all
%     of which are piecewise linear functions, then
%           opt.interpolationtype={'linear'};
%
% opt.SampTime = .05;
%	The sampling time rate for creating input signals using the 
%	interpolation function from opt.interpolationtype.
%
% opt.black_box = 0;
%   If the model is a function pointer and the 'black_box' is set to 0,
%   then the function is passed to the ODE solver indicated by the option
%   'ode_solver'.
%
%   If the model is a function pointer and the 'black_box' is set to 1,
%   then it is assumed that the model will be given the time stamps, the
%   initial conditions and input signals, and it will output the time
%   stamps, the state trajectory, the output trajectory and, optionally,
%   the graph and guards depending on the option 'taliro_metric'.
%   That is, S-Taliro will treat the input function as a black box.
%
%   A blackbox function should obey the following interface:
%
%   Interface:
%       [T X Y L CLG GRD] = function(X0,ET,TS,U)
%   Inputs:
%       X0 - the initial conditions as a column vector.
%       ET - the end time for the simulation. It is assumed that the start
%            time is zero.
%       TS - time stamps that correspond to the sampling instances for the
%            input signals in U. This is optional if no input signals
%            are required.
%       U  - the input signals. This is an array where each column
%            corresponds to a different signal and each row to time 
%            instance that corresponds to TS. This is optional if no input 
%            signals are required.
%   Outputs:
%       T  - the timestamps of the output trajectories.
%       X  - the state trajectory as an array where each column corresponds 
%			 to a different state variable. 
%       Y  - the output trajectory as an array where each column  
%		     corresponds to a different output variable. 
%       L  - the location/mode trajectory as an array where each column 
% 			 corresponds to a different stateflow chart or finite state 
%			 machine (FSM). 
%     CLG -  the graph that corresponds to the finite state machine of the 
%			 system. This should be a cell vector with the adjacency list 
%			 of the graph. 
%		     If there are multiple FSM, then G should be cell vector where 
%			 each entry is a cell vector with the adjacency list for each 
% 			 FSM. In this case, the length of G should match the number of 
%			 columns of L.
%			 Example: We will set a graph with 2 FSM with 2 states each:
%			 	FSM = {[2],[1]}; % State 1 transitions to 2 and vice versa.
%				CLG{1} = FSM;
%				CLG{2} = FSM;
%			 This is required when hybrid distance metrics are used.
%      GRD - the guards that enable the switch from one location to the 
%			 next. In case of a single FSM, this is a structure array with  
%			 the following entries:
%				GRD(i,j).A; GRD(i,j).b
%			 A transition from state i to state j is enabled if the current 
%			 state is x and GRD(i,j).A*x<=GRD(i,j).b.
%			 The guards can be defined over the space 'X' or the space 'Y'.
%			 If there are multiple FSM, then GRD should be a cell vector
%			 where each entry should be structure array as defined above.
%
%   Remark:
%   This option could be used for hardware-in-the-loop (HIL) testing.
%
% opt.spec_space = 'Y';
%   In case of Simulink model the specifications can be over trajectories
%   of the state variables of the system, option 'X', or over the
%   output signals of the system, option 'Y' (default option).
%
% opt.taliro_metric = 'none';
%   The type of temporal logic metric to be used. Options:
%    'none'       - (default) only the continuous space is considered. Any
%                   location information on the predicates is ignored.
%    'hybrid_inf' - The robustness metric considers the path distance
%                   between control locations and the euclidean space
%                   distance.
%    'hybrid'     - The robustness metric considers also the distance to
%                   the guards that enable a transition on the hybrid
%                   system.
%
% opt.map2line = 1;
%   For using a standard optimization algorithm with hybrid distance
%   values, we are mapping the hybrid distances on the real line using the
%   inverse logit function (see parameter rob_scale). Setting map2line to 0
%   will utilize more complicated optimization algorithms that will attempt
%   to minimize directly the hybrid metric.
%
% opt.rob_scale = 100;
%   For using a standard optimization algorithm with hybrid distance
%   values, we are mapping the hybrid distances on the real line using the
%   inverse logit function:
%          rob = h.dl + 2*(2*exp(h.ds/a)/(1+exp(h.ds/a))-1)
%   where a is a scaling factor and h the hybrid distance. If the scaling
%   factor is not provided, then a = 100. The scaling factor is depends on
%   the application and it is important since a value of h.ds above 40 with
%   a = 1 already gives the upper bound 1 for the inverse logit function.
%   This implies that large range of robustness values might be mapped to
%   the same number.
%
% opt.loc_traj = 'none';
%   In case of hybrid system trajectories generated by a Simulink model,
%   the 'loc_traj' option is used to define which output signal
%   corresponds to the location trace. Options:
%       'none' - (default) the output signals do not contain a location
%                 trace. All the output signals are used for the temporal
%                 logic robustness computation.
%       'end'   - the location trace is in the last output port
%       integer - if the location trace is outputted from another port
%                 number, then 'loc_traj' should contain the corresponding
%                 port number.
%
% opt.SimulinkSingleOutput = 0;
%   Set the Simulink model to output data in a single variable (1) or in
%   multiple variables (0). This is a Simulation option controlled only
%   through the GUI interface of Simulink models. Thus, it must be set by
%   the model user accordingly to what is selected in the model. Usually,
%   the default option for the 'sim' command to output data in multiple
%   variables even if structures are used.
%
% opt.dispinfo = 1;
%   Display information as S-Taliro runs, i.e., current best value, current
%   run and total run time of each run.
%
% opt.conformanceTesting = 1;
%   Indicates whether conformance testing is the goal.
%
% opt.seed = 0;
%   sets the seed for the random number generator. Specifically, it sets
%   the seed for the random number stream 'mt19937ar'. The seed should be
%   a value between 0 and 2^32 - 1.
%
% opt.dim_proj = [];
%   sets the dimensions of the output values that taliro will work with.
%   Ex: your model has 4 outputs however you only want to consider outputs
%   2 and 4. To do so set opt.dim_proj = [2 4];
%
% opt.taliro_undersampling_factor = 1;
%   sets the undersampling factor in cases when the output trace generated 
%   is too big.
%
% opt.save_intermediate_results = 0;
%   Set to 1 to have staliro save the results of each run as soon as
%   it's done. Useful for long runs, if you decide to kill the job
%   halfway, you have something saved.
%
% opt.save_intermediate_results_varname = 'default';
%   This option sets the name of the variable to which the intermediate
%   results will be saved.
%
% opt.varying_cp_times = 0;
%   Set to 1 for  variable time distributions for the control points.
%   Feature currently supported only for the SA_Taliro optimization
%   engine.
%
% opt.n_workers = 1;
%   Set the number of workers to be used by the stochastic optimizer. 
%   Setting this option to 0 or 1 does not initialize a worker pool.
%   For an integer X greater than 1, a parallel pool of X workers is 
%   initialized. The default maximum number of workers allowed is the  
%   number of cores on the local machine.
%
% opt.normalization = 0;
%   Set to 1 to scale the parameters to the unit square while conducting 
%   parameter estimation. Useful when interested in putting the same 
%   weight to all parameters. Note: Should not to be confused with the 
%   predicate normalized option.
%
% opt.polarity_weight = 'norm';
%   Set to 'norm', 'max', 'min', function handle, or vector where each 
%   column represents the weight for a parameter. The function handle 
%   should output a scalar given a vector of parameters. The selection 
%   will impact the robustness guided search for parameter estimation. 
%
% opt.param_est_fals_stage = 1;
%   Indicates that the algorithm is in falsification stage when
%   running parameter estimation. 
%
% opt.runs = 1;
%	When benchmarking a new algorithm you may want to execute the same 
%	problem setup multiple times. Set runs to any number that you would
%	for the staliro run to be repeated.
%
% opt.taliro = 'dp_taliro';
%	The temporal logic robustness computation engine you would like to 
%	use. See dp_taliro, dp_taliro, or fw_taliro for some examples. You
%	can use your own temporal logic computation engine. For the 
%	interface see dp_taliro.m.
%
% opt.RobustnessOffset = [];
%	This property is used in parameter estimation. Currently, it is 
%	recommended to not change this option.
%
% opt.fals_at_zero = 1;
%   The stochastic optimizer will terminate and return falsification when
%   fals_at_zero is equal to 1;
%
% opt.TotSimTime = [];
%   This is the total simulation time that is given as input to staliro.
%   This is not set explicilty by the user, but it is set by staliro during
%   initialization. This should be treated as a read-only property.
%
% To change the the default values to user-specified values use the default
% object already created to specify the properties.
%
% E.g.: to change the optimization_solver to Ant Colony Optimization type
% opt.optimization_solver = 'ACO_Taliro';
%
% See also: staliro
%

% (C) 2010, Yashwanth Annapureddy, Arizona State University
% (C) 2010, Georgios Fainekos, Arizona State University
% (C) 2012, Bardh Hoxha, Arizona State University

    properties(Dependent)
        optimization_solver;
        optim_params;
    end
    properties(Access=private)
        priv_optimization_solver = 'SA_Taliro';
        priv_optim_params = SA_Taliro_parameters;
    end    
    properties
        ode_solver = 'default';
        falsification = 1;
        interpolationtype = {'pchip'};
        black_box = 0;
        runs = 100;
        spec_space = 'Y';
        loc_traj = 'none';
        SampTime = .05;
        SimulinkSingleOutput = 0;
        dispinfo = 1;
        plot = 0;
        save_intermediate_results = 0;
        save_intermediate_results_varname = 'default';
        taliro_metric = 'none';
        map2line = 1;
        rob_scale = 100;
        RobustnessOffset = [];
        taliro = 'dp_taliro';
        n_workers = 1;
        stochastic = 0;
        hasim_params = [1 0 0 0 0];
        optimization = 'min';
        parameterEstimation = 0;
        dp_t_taliro_direction = 'both';
        seed = 0;            
        dim_proj = [];
        taliro_undersampling_factor = 1;
        varying_cp_times = 0;
        normalization = 0;
        polarity_weight = 'norm';
        ps_used = 0;
        param_est_fals_stage = 1;
        fals_at_zero = 1;
        TotSimTime = [];
    end
    
    methods
        
        function obj = staliro_options(varargin)
            if nargin>0
                error(' staliro_options: Please access directly the properties of the object.')
            end
        end
            
    end
    
    % Set/Get methods for access control
    % See http://www.mathworks.com/help/matlab/matlab_oop/property-access-methods.html
    methods
        
        function str_optim = get.optimization_solver(obj)
            str_optim = obj.priv_optimization_solver;
        end

        function set.optimization_solver(obj,value)
            % When the user changes optimization method, then update the
            % optimizer parameters
            assert(exist(value,'file')==2, ' staliro_options : The selected optimizer does not exist!');
            str_file_name = [value,'_parameters'];
            assert(exist(str_file_name,'file')==2, ' staliro_options : The selected optimizer does not have a class for parameters! See optimization\readme.txt');
            obj.priv_optimization_solver = value;
            % if the user defines the same optimization method keep the
            % parameters the same, else instantiate the new parameters
            if ~isa(obj.priv_optim_params,str_file_name)
                obj.priv_optim_params = eval(str_file_name);
            end
        end

        function params = get.optim_params(obj)
            params = obj.priv_optim_params;
        end

        function set.optim_params(obj,value)
            % When the user changes optimization method, then update the
            % optimizer parameters
            assert(isa(obj.priv_optim_params,class(value)), ' staliro_options : The optimization parameters type does not match the selected optimization method! Please first update the optimization method.');
            obj.priv_optim_params = value;
        end
        
        function set.interpolationtype(obj,value)
            % User can specify several interpolation methods for each
            % signal
            assert(iscell(value), ' staliro_options : interpolationtype must be a cell');
            obj.interpolationtype = value;
        end
        
        function set.SampTime(obj,value)
            assert(value > 0, ' staliro_options : SampTime must be positive');
            obj.SampTime = value;
        end
        
        function set.rob_scale(obj,value)
            assert(value > 0, ' staliro_options : rob_scale must be positive');
            obj.rob_scale = value;
        end
        
        function set.spec_space(obj,value)
            assert(strcmp(value,'X') || strcmp(value,'Y'), ' staliro_options : spec_space must be either X (for state-space) or Y (for output space)');
            obj.spec_space = value;
        end
        
    end
end





