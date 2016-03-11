function addpath_drake()
  mfiledir = fileparts(which(mfilename));
  wd = cd(fullfile(mfiledir,'../../drake'));
  addpath_drake();
  cd(wd);
end

