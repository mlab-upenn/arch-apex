function rmpath_spotless()
  mfiledir = fileparts(which(mfilename));
  rmpath(fullfile(mfiledir,'../../externals/spotless/spotless'));
  rmpath(fullfile(mfiledir,'../../externals/spotless/spotless/mex'));
  rmpath(fullfile(mfiledir,'../../externals/spotless/spotless/mss'));
  rmpath(fullfile(mfiledir,'../../externals/spotless/spotless/spotopt'));
  rmpath(fullfile(mfiledir,'../../externals/spotless/spotless/spotopt/solvers'));
  rmpath(fullfile(mfiledir,'../../externals/spotless/spotless/spotopt/util'));
  rmpath(fullfile(mfiledir,'../../externals/spotless/spotless/util'));
