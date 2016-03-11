function InpSignal = ComputeInputSignals(stepTime,UPoint,interType,tmp_CP,inpBound,simTime)
% ComputeInputSignals - Compute input signals given the parameters of the
% search space and the simulation options set.
%
% USAGE
% InpSignal = ComputeInputSignals(stepTime,UPoint,interType,tmp_CP,inpBound,simTime)
%
% INPUTS:
%   stepTime: If stepTime is a scalar, then the output is a column vector with the
%       values of the input signals at the time indicated by stepTime.
%       If stepTime is vector, then the output is an array where each column 
%       contains the values of each input signals at each point in time.
%   
%   UPoint: The Upoint vector can be one of the following: 
%       1) vector of control point values if opt.varying_cp_times == 0 or 
%       2) vector of control point values and their corresponding 
%          timestamps if opt.varying_cp_times = 1.
%       E.g. If inputSignal1 has 2 control pnts, and inputSignal2 has 3
%       control points, then UPoint will be a row vector of the form
%       [cp1_1 cp1_2 cp2_1 cp2_2 cp2_3]
%
%   interType: This is a cell array that contains the interpolation type
%       for each input signal.
%
%   tmp_CP: A vector indicating the cumulative number of control points for
%       each input signal. Ex: tmp_CP(1) indicates the number of control points
%       for input signal 1. tmp_CP(2) = control points for inputs signal 1 and
%       signal 2.
%
%   inpBound: A n-by-2 array with the ranges for the inputs. 
%
%   simTime: Indicates the simulation time.
%
% OUTPUTS:
%   InpSignal: A vector that contains the input signals that are generated.
%
% Note: 
% if one of the signals is interpolated using splines and the resulting
% input signal does not satisfy the corresponding constraints, then
% InpSignal will be an empty array.

% (C) 2010, Georgios Fainekos, Arizona State University

% History: 
% 2013.10.25 BH Support for varying_cp_times
% 2012.05.12 GF Stand alone function
%               Added support for random processes.
% 2011.08.22 GF Last major update

ns = length(stepTime);  % number of simulation steps
nu = length(tmp_CP);    % number of input signals
ni = length(interType); % number of different interpolation types


InpSignal = zeros(ns,nu);
isBool = 0;

if tmp_CP ~= length(UPoint) 
    isVarTime = 1;
else
    isVarTime = 0;
end

for ii = 1:nu
    
    % Get the for each input signal the corresponding control points
    if ii==1
        U_tmp = UPoint(1:tmp_CP(1));
    else
        U_tmp = UPoint(tmp_CP(ii-1)+1:tmp_CP(ii));
    end
    
    % Is the interpolation function the same for all input signals?
    if ni==1
        idx_it = 1;
    else
        idx_it = ii;
    end
    
    switch interType{idx_it}
        case 'bool'
            isBool = 1;
            nbnodes = length(U_tmp);
            assert(nnz(U_tmp >= 0 & U_tmp <= 1)==nbnodes, 'When interpolation type is bool, the range of the input signal must be given as [0,1].') 
            if isVarTime == 1
				timeVector = UPoint(tmp_CP(end)+1:end)';
			else
				timeVector = 0:simTime/(length(U_tmp)-1):simTime;
            end
            
            vals = U_tmp >= 0.5;%randi(2,nbnodes,1)-1;
            timenodes = [0, timeVector];
            bsignal = zeros(ns,1);
            for v = 2:nbnodes
                bsignal(find(stepTime >= timenodes(v-1) & stepTime <= timenodes(v))) = vals(v-1);  
            end
            % From last time node to end of simTime, hold value constant
            bsignal(stepTime > timenodes(v)) = vals(end);
            InpSignal(:,ii) = bsignal;  
        case 'UR'
            assert(length(U_tmp)==1,['S-Taliro: Input signal ',num2str(ii),' is constant, but more than 1 control points are provided.']);
            InpSignal(:,ii) = inpBound(ii,1)+(inpBound(ii,2)-inpBound(ii,1))*rand(ns,1);            
        case 'const'
            assert(length(U_tmp)==1,['S-Taliro: Input signal ',num2str(ii),' is constant, but more than 1 control points are provided.']);
            InpSignal(:,ii) = U_tmp*ones(ns,1);
        case 'pconst'
		
			% For varying time distribution of control points
			if isVarTime == 1
				timeVector = UPoint(tmp_CP(end)+1:end)';
			else
				timeVector = 0:simTime/(length(U_tmp)-1):simTime;
			end
		
            InpSignal(:,ii) = piecewise_const(timeVector,U_tmp,stepTime);
        otherwise
		
			% For varying time distribution of control points
			if isVarTime == 1
				timeVector = UPoint(tmp_CP(end)+1:end)';
			else
				timeVector = 0:simTime/(length(U_tmp)-1):simTime;
			end
		
            InpSignal(:,ii) = interp1(timeVector,U_tmp,stepTime,interType{idx_it});
            if strcmp(interType{idx_it},'spline')
                lwBd = repmat(inpBound(ii,1),ns,1);
                upBd = repmat(inpBound(ii,2),ns,1);
                if ~(min(lwBd<=InpSignal(:,ii) & InpSignal(:,ii)<=upBd))
                    InpSignal = [];
                    return
                end
            end
    end
end

if ns==1
    InpSignal = InpSignal';
end

if isBool 
    InpSignal = boolean(InpSignal);
end

end
