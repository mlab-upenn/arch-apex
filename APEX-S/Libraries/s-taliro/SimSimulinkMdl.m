% SimSimulinkMdl reproduces the input signals and the output signals of a
% Simulink model given the set of initial conditions and input space
% parameterization.
%
% [T,XT,YT,InpSignal] = 
%   SimSimulinkMdl(InputModel,InitCond,InputRange,CPArray,Sample,TotT,Opt)
% 
% INPUTS
%          - InputModel   :   The string for the Simulink/Stateflow model
%
%          - InitCond     :   holds the range of the initial conditions
%                             and it should be a Double Array.
%.
%                             The array can be empty(indicating no initial
%                             conditions) or of dimension m by 2, where
%                             m is an integer.
%
%                             Format: [LowerBound UpperBound]
%
%                             Ex: init_cond = [3 6;7 8;9 12]; or
%                                 init_cond = [];
%
%          - InputRange   :   holds the range of the inputs and it 
%                             should be a Double Array.
%
%                             The array can be empty (indicating no input
%                             conditions) or of dimension m by 2, where m
%                             is an integer.
%
%                             Format: [LowerBound UpperBound]
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
%                             S-TaLiRo. 
%
%          - CPArray      :   contains the control points associated with
%                             each input. It should be a double vector 
%                             (1 by n array). The length of the cp_array 
%                             must be equal to the number of inputs for 
%                             the system.
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
%                             each input vector ui and u1 ... un are column
%                             vectors which are the n input signals to the 
%                             system 
%
% See also: staliro, staliro_options, SimFunctionMdl, SimBlackBoxMdl

% (C) Georgios Fainekos 2012 - Arizona State University
% (C) Bardh Hoxha 2015 - Arizona State University

function [T,XT,YT,InpSignal] = SimSimulinkMdl(InputModel,InitCond,InputRange,CPArray,Sample,TotTime,opt)

if isempty(InputRange)     % If no inputs to the model
   
    InpSignal = [];
    
else    % If there are input signals to the model 
    
    % Create input signals
    stepTime = (0:opt.SampTime:TotTime)';
    ncp = length(CPArray);
    tmp_CP = zeros(ncp,1);
    tmp_CP(1) = CPArray(1);
    for ii = 2:ncp
        tmp_CP(ii) = tmp_CP(ii-1)+CPArray(ii);
    end
    if isempty(InitCond)
        UPoint = Sample;
    else
        nx = size(InitCond,1);
        UPoint = Sample(nx+1:end);
    end
    InpSignal = ComputeInputSignals(stepTime,UPoint,opt.interpolationtype,tmp_CP,InputRange,TotTime);    
    InpSignal = [stepTime InpSignal]; 
        
end

simopt = simget(InputModel);
if ~isempty(InitCond)
    simopt = simset('InitialState',Sample(1:size(InitCond,1)));
end
if ~strcmp(opt.ode_solver, 'default') 
    simopt = simset(simopt, 'Solver', opt.ode_solver); 
end

if opt.SimulinkSingleOutput

    load_system(InputModel)
    
    set_param(InputModel,'SaveTime','on','TimeSaveName','tout');
    if strcmp(opt.spec_space,'X')
        set_param(InputModel,'SaveState','on','StateSaveName','xout');
    else
        set_param(InputModel,'SaveOutput','on','OutputSaveName','yout');
    end
    
    SimOut = sim(InputModel,[0 TotTime],simopt,InpSignal);
    
    if isnumeric(SimOut)
        close_system(InputModel,0)
        msg = sprintf('STaLiRo : staliro was expecting a structure for the Simulink model outputs. Instead a numeric array is returned.\nSet the staliro option SimulinkSingleOutput to 0 or modify the Simulink model single object \noutput option at Simulation > Model Configuration > Data Import/Export.');
        error(msg); %#ok<SPERR>
    end

    T = get(SimOut,'tout');
    if strcmp(opt.spec_space,'X')
        XT = get(SimOut,'xout');
        YT = [];
    else
        XT = [];
        YT = get(SimOut,'yout');
    end
    
    close_system(InputModel,0)

else
    
    try 
        [T, XT, YT] = sim(InputModel,[0 TotTime],simopt,InpSignal);
    catch ME
        if (strcmp(ME.identifier,'Simulink:Engine:ReturnWkspOutputNotSupported'))
            msg = sprintf('STaLiRo : Simulink model "%s" outputs to a single variable in the workspace. \nSet the staliro option SimulinkSingleOutput to 1 or modify the Simulink model single object \noutput option at Simulation > Model Configuration > Data Import/Export.',InputModel);
            causeException = MException('MATLAB:myCode:dimensions',msg);
            ME = addCause(ME,causeException);
        end
        rethrow(ME)
    end
        
end

if isstruct(XT)
    XT = double([XT.signals.values]);
end

if isstruct(YT)
    YT = double([YT.signals.values]);
end

if strcmp(opt.spec_space,'X')
    assert(~isempty(XT),'STaLiRo : The state space output variable of the Simulink model is empty!')
    if ~isempty(opt.dim_proj)
        XT = XT(:,opt.dim_proj);
    end
else
    assert(~isempty(YT),'STaLiRo : The output space output variable of the Simulink model is empty!')
    if ~isempty(opt.dim_proj)
        YT = YT(:,opt.dim_proj);
    end
end

end


