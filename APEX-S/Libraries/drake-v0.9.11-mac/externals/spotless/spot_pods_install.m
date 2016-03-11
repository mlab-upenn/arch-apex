function spot_pods_install(destdir,relpath)

oldpath = path;
cd spotless;
spot_install;
newpath = path;
cd ..;

pathdiff = setdiff(regexp(newpath,pathsep,'split'),regexp(oldpath,pathsep,'split'));
pathdiff = strrep(pathdiff,pwd,relpath);

fprintf('Writing addpath_spotless.m and rmpath_spotless.m to %s\n',destdir);

if ~exist(destdir,'dir')
  mkdir(destdir);
end

fptr = fopen(fullfile(destdir,'addpath_spotless.m'),'w');
fprintf(fptr,'function addpath_spotless()\n');
fprintf(fptr,'  mfiledir = fileparts(which(mfilename));\n');
fprintf(fptr,'  addpath(fullfile(mfiledir,''%s''));\n',pathdiff{:});
fclose(fptr);

fptr = fopen(fullfile(destdir,'rmpath_spotless.m'),'w');
fprintf(fptr,'function rmpath_spotless()\n');
fprintf(fptr,'  mfiledir = fileparts(which(mfilename));\n');
fprintf(fptr,'  rmpath(fullfile(mfiledir,''%s''));\n',pathdiff{:});
fclose(fptr);

