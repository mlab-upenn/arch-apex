% SimFunctionMdl reproduces the input signals and the output signals of a
% system given as an m-function given the set of initial conditions and 
% input space parameterization.
%
% [T,XT,YT,InpSignal] = 
%   SimFunctionMdl(InputModel,InitCond,InputRange,CPArray,Sample,TotT,opt)
% 
% INPUTS
%          - InputModel   :   The string for the Simulink/Stateflow model
%
%          - InitCond     :   holds the range of the initial conditions
%                             and it should be of type real.
%                             The array can be empty(indicating no initial
%                             conditions) or of dimension m by 2, where
%                             m is an integer.
%
%                             Format for 2D: [LowerBound UpperBound];
%
%                             Ex: init_cond = [3 6;7 8;9 12]; or
%                                 init_cond = [];
%
%          - InputRange   :   holds the range of the inputs,
%                             should be of type real,
%                             the array can be empty (indicating no input
%                             conditions) or of dimension m by 2, where m
%                             is an integer.
%                             Format [LowerBound UpperBound];
%
%                             Ex: input_range = [5.6 7.8;8 12]; or
%                                 input_range = [];
%
%          - Sample       :   a sample point from the sets InitCond and 
%                             InputRange. The vector Sample is going to be
%                             used for the simulation of the system.
%                             
%                             If X0 in InitCond and U in InputRange, then
%                             Sample = [X0; U].
%                               
%                             Typicaly the vector Sample is returned by
%                             S-TaLiRo
%
%          - CPArray      :   contains the control points associated with
%                             each input, should be of type real, 1 by n
%                             array, length of cp_array must be equal to
%                             the number of inputs for the system.
%
%                             Ex: cp_array =[10 14] indicates 10
%                             control points for the 1st input and 14 for
%                             the second input.
%
%          - TotT         :   Total simulation time
%       
%          - Opt          :   An staliro_options object
%
% OUTPUTS
%
%          - T            :   A vector with the timestamps
%
%          - XT           :   The state trajectory
%
%          - YT           :   Empty array (for compatibility with 
%                             SimSimulinkMdl and SimBlackBoxMdl)
%
%          - InpSignal    :   An array of the form [t u1 ... un] where 
%                             t is a column vector with the timestamp of 
%                             each input vector u1 ... un are the n input 
%                             signals to the system
%
% See also: staliro, staliro_options, SimSimulinkMdl, SimBlackBoxMdl

% (C) Georgios Fainekos 2012 - Arizona State University

function [T,XT,YT,InpSignal] = SimFunctionMdl(InputModel,InitCond,InputRange,CPArray,Sample,TotT,opt)

YT = [];

if strcmp(opt.ode_solver, 'default')
    ode_solver = 'ode45';
else
    ode_solver = opt.ode_solver;
end

if isempty(InputRange) % If no inputs to the model
        
    [T, XT] = feval(ode_solver,@ourmodel_noinp,[0 TotT],Sample');
    
    InpSignal = [];

else

    stepTime = (0:opt.SampTime:TotT)';
    ncp = length(CPArray);
    tmp_CP = zeros(ncp,1);
    tmp_CP(1) = CPArray(1);
    for ii = 2:ncp
        tmp_CP(ii) = tmp_CP(ii-1)+CPArray(ii);
    end
    if isempty(InitCond)
        UPoint = Sample;
        X0 = [];
    else
        nx = size(InitCond,1);
        X0 = Sample(1:nx);
        UPoint = Sample(nx+1:end);
    end
    InpSignal = ComputeInputSignals(stepTime,UPoint,opt.interpolationtype,tmp_CP,InputRange,TotT);    
    InpSignal = [stepTime InpSignal]; 

    [T, XT] = feval(ode_solver,@ourmodel_inp,[0 TotT],X0);

end

function dx = ourmodel_noinp(t,x)
    dx = InputModel(t,x);
end

function dx = ourmodel_inp(t,x)

    idx = find(InpSignal(:,1)>=t,1);
    
    if idx==1
        Uin = InpSignal(idx,2:end);
    else
        T2 = InpSignal(idx,1);
        T1 = InpSignal(idx-1,1);
        DT = T2-T1;
        Uin = InpSignal(idx-1,2:end)*(T2-t)/DT+InpSignal(idx,2:end)*(t-T1)/DT;
    end

    dx = InputModel(t,x,Uin');
    
end

end
