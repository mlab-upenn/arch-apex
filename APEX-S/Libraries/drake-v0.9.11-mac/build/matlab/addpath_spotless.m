function addpath_spotless()
  mfiledir = fileparts(which(mfilename));
  addpath(fullfile(mfiledir,'../../externals/spotless/spotless'));
  addpath(fullfile(mfiledir,'../../externals/spotless/spotless/mex'));
  addpath(fullfile(mfiledir,'../../externals/spotless/spotless/mss'));
  addpath(fullfile(mfiledir,'../../externals/spotless/spotless/spotopt'));
  addpath(fullfile(mfiledir,'../../externals/spotless/spotless/spotopt/solvers'));
  addpath(fullfile(mfiledir,'../../externals/spotless/spotless/spotopt/util'));
  addpath(fullfile(mfiledir,'../../externals/spotless/spotless/util'));
