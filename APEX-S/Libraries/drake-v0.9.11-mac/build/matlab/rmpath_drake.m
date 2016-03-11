function rmpath_drake()
  mfiledir = fileparts(which(mfilename));
  wd = cd(fullfile(mfiledir,'../../drake'));
  rmpath_drake();
  cd(wd);
