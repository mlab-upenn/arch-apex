Directory contents

- demo_autotrans_monitoring(_YYYYV.mdl/slx) 
	
	A Simulink model that demonstrates the use of the S-Taliro monitoring block.
	Open the model and press the "Run" button. The time robustness will be 
	presented on the scope.
	
	Double click the S-Taliro_Monitor block to change the formula and the atomic
	propositions, or press the Help button to see the help file.
	
- benchmarking_autotrans_monitoring.m
	
	This m-file is benchmarking the S-Taliro monitor.
	It will collect statistics for different formulas by running 100 tests for 
	each formula.
	
	It does not return the robustness values computed.

For further details on the theory behind the toolbox see:

Adel Dokhanchi, Bardh Hoxha and Georgios Fainekos, 
On-Line Monitoring for Temporal Logic Robustness, 
Runtime Verification, Toronto, Canada, September 2014 
