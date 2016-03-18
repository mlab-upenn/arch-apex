function setup_monitor

path_var = pwd;
addpath(path_var);
mex on_line.c;
mex fcncall.c;
matlabVersion = version;
matlabVersionSplit = strsplit(matlabVersion, '.');
matlabVersionMain = [matlabVersionSplit{1}, '.', matlabVersionSplit{2}];
matlabVersion = str2double(matlabVersionMain);
if matlabVersion < 8.45 %Earlier than 2015a (8.5)
    lb = LibraryBrowser.StandaloneBrowser;
    lb.refreshLibraryBrowser;
else
    libBrow = LibraryBrowser.LibraryBrowser2;
    libBrow.refresh;
end

disp('***************************************************************************');
disp('See the new Simulink blocks in the             ');
disp('Simulink Library Browser under S-TaLiRo        ');
disp('***************************************************************************');
disp('For a demo see demo_autotrans_monitoring.mdl   ');
disp('under the demos folder                         ');
disp('***************************************************************************');
disp('You are all set to use S-TaLiRo On-Line Monitor');
disp('***************************************************************************');
