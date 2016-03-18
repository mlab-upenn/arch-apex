clc 
clear all

% Define the length of the scenario

time = 4; 

% Define the model
% Need to change the interface still I think... 
model = @runScenario; 

% Don't define init_cond
init_cond=[0.2 2];

% input_range describes the allowable values for t_init_env1 and
% t_init_env2. These variables represent how far ahead (in terms of travel
% time along the trajectories, the other vehicles in the scenario will be
% set to). 
input_range = [];

% Don't define cp_array
cp_array = [];


% The predicates define the equations for the temporal logic formulas which
% we are checking the roboustness of 
ii = 1;

preds(ii).str= 'P1';
preds(ii).A = 1;
preds(ii).b = 0;

% Define the MITL formula Phi
phi = '[]_[0,2] P1';

opt = staliro_options();
opt.black_box=1;
opt.optimization_solver = 'SA_Taliro';
opt.runs = 1;
opt.optim_params.n_tests = 10;
opt.falsification = 0;
opt.interpolationtype={'pchip'};
opt.spec_space = 'Y';
opt

disp(' ')
disp('Running S-TaLiRo with chosen solver ...')

results = staliro(model, init_cond, input_range, cp_array, phi, preds, time, opt);
