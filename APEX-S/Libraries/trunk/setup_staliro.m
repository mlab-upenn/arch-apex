% setup_staliro will automatically compile all the files needed 
% for running staliro including: 
% Polarity, dp_taliro, dp_t_taliro and fw-taliro

% (C) 2011 by Georgios Fainekos (fainekos@asu.edu)

function setup_staliro(varargin)

skip_mex = 0;
if nargin == 1 && strcmp(varargin{1},'skip_mex')
    skip_mex = 1;
end

path_var=pwd;
addpath(path_var);
addpath([path_var,'/ha_robust_tester']);
addpath([path_var,'/Distances']);
addpath([path_var,'/auxiliary']);
addpath([path_var,'/optimization']);
addpath([path_var,'/optimization/auxiliary']);
addpath([path_var,'/LocalDescent']);
addpath([path_var,'/signal_interpolation']);
addpath([path_var,'/auxiliary/Singleton']);
if exist([path_var,'/matlab_bgl'],'dir')==7
    addpath([path_var,'/matlab_bgl']);
end

cd('Polarity')
setup_polarity(skip_mex)
cd('..')

disp(' ')

cd('dp_taliro')
setup_dp_taliro(skip_mex)
cd('..')

disp(' ')

cd('dp_t_taliro')
setup_dp_t_taliro(skip_mex)
cd('..')

disp(' ')

cd('fw_taliro')
setup_fw_taliro(skip_mex)
cd('..')

disp(' ')

if exist([path_var,'/eaco'],'dir')==7
    addpath([path_var,'/eaco']);
    if ~skip_mex
        cd('eaco')
        mex ant_mex_algo.c
        cd('..')
        
        disp(' ')

    end
end

cd('monitor')
setup_monitor
cd('..')

disp(' ')

%Check whether CheckMate is installed in the system
[libDesc, libNames] = libbrowse('initialize');
if any(strmatch('CheckMate', libDesc)) ~= 1
 warning('The CheckMate tool is not installed on the system. It is available at: http://users.ece.cmu.edu/~krogh/checkmate/')
end

%Check whether MatlabBGL is installed in the system
if exist('floyd_warshall_all_sp','file') == 0
 warning('For the hybrid distance metric with distances to the location guards the Matlab package MatlabBGL is required: http://www.mathworks.com/matlabcentral/fileexchange/10922')
end    

disp(' ')
disp('***************************************************************************')
disp(' ')
disp('You are all set to use S-Taliro!')
disp(' ')
disp('If you plan on using staliro frequently then you need to save the path after')
disp('installation.')
disp(' ')
disp('Refer to the demos folder to run the sample problems solved by S-TALIRO.')
disp('Also type "help s_taliro" to get a detailed description of using the tool.')
disp(' ')
disp('Note: For the hybrid distance metric with distances to the location guards')
disp('the Matlab package MatlabBGL is required: ')
disp('	http://www.mathworks.com/matlabcentral/fileexchange/10922')
disp(' ')
disp('A quick-start user guide has been included under the docs/ folder. ')
disp(' ')
disp('***************************************************************************')
disp(' ')
