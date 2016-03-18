% SimBlackBoxMdl reproduces the input signals and the output signals of a
% black box model given the set of initial conditions and input space
% parameterization.
%
% [T,XT,YT,InpSignal,LT,CLG,Guards] = 
%    SimBlackBoxMdl(InputModel,InitCond,InputRange,CPArray,Sample,TotT,Opt)
% 
% INPUTS
%          - InputModel   :   The function pointer to the black box 
%                             function
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
%          - YT           :   The output trajectory
%
%          - InpSignal    :   An array of the form [t u1 ... un] where 
%                             t is a column vector with the timestamp of 
%                             each input vector u1 ... un are the n input 
%                             signals to the system
%
%          - LT           :   The location trajectory
%
%          - CLG          :   The control location graph 
%
%          - Guards       :   The guard sets for the transitions between 
%                             locations
%
% See also: staliro, staliro_options, SimSimulinkMdl, SimFunctionMdl

% (C) Georgios Fainekos 2012 - Arizona State University

function [T,XT,YT,IT,LT,CLG,Guards] = SimBlackBoxMdl(InputModel,InitCond,InputRange,CPArray,Sample,TotT,opt)

if isempty(InputRange) % If no inputs to the model
        
    stepTime = [];
    InpSignal = [];
    X0 = Sample;

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
    
end

[T, XT, YT, LT, CLG, Guards] = InputModel(X0,TotT,stepTime,InpSignal);
IT = [stepTime, InpSignal];

end

