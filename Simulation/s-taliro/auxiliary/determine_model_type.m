% Determines what implementation staliro_InputModel of the system model
% is being used. % Errors out if an invalid implementation is used - thus
% can also be % used to simply check if a valid implemenatation
% (regardless of which one) is being used or not.

% Yashwanth Annapureddy, Arizona State University, 2010
% Georgios Fainekos, Arizona State University, 2010

function modeltype = determine_model_type(staliro_InputModel)

if isfield(staliro_InputModel, 'type')
    if strcmp(staliro_InputModel.type, 'interconnection')
        modeltype = 'hautomaton';
    else
        modeltype = staliro_InputModel.type;
    end
elseif (isa(staliro_InputModel,'function_handle'))
    modeltype = 'function_handle';
elseif (isa(staliro_InputModel,'hautomaton'))
    modeltype = 'hautomaton';
elseif (ischar(staliro_InputModel))
    modeltype = 'simulink';
else
    error(['Unknown model type passed: ',staliro_InputModel,'.'])
end
