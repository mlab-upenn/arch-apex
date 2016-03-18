% FUNCTION SignedDist
% 
% DESCRIPTION: 
%   Compute the signed distance of the point x from a set of 
%   halfspaces /\_i a_i*x<=b_i.
%
% INTERFACE: 
%   [dist,inSet,proj] = SignedDist(x,A,b)
%
% INPUTS:
%   - x: the point
%   - A: the array where each row contains one vector a_i
%        If A is empty, then the represented set is R^n
%   - b: the vector where each row contains one scalar b_i
%
% OUTPUTS:
%   - dist: the minimum distance of the point x from the set of hyperplanes
%           the distance is positive if the point is inside the set
%           and negative if the point is not inside the set
%   - inSet: 1 if the point is in the set, 0 otherwise
%   - proj: the projection of the point x on the set of half spaces
%
% Note: This routine is not optimal when the sets are 1D.
%

% (C) Georgios Fainekos 
%
% History:
% 2012.09.13 - Added projected point
% 2006.08.07 - 1st stable version

function [dist,inSet,proj] = SignedDist(x,A,b)

[noc,nos,nod] = size(A);

if isempty(A)
    dist = inf;
    inSet = 1;
    return
end

if nod~=1  
    error('The set must be convex');
end

inSet = isPointInSet(x,A,b);

if inSet 
    % if the point is in the set
    dist = inf;
    proj = x;
    for i = 1:noc
        tmp_min = DistFromPlane(x,A(i,:),b(i));
        if tmp_min<dist
            dist = tmp_min;
            proj = ProjOnPlane(x,A(i,:),b(i));
        end
    end
else
    %if the point is outside the set
    [dist,proj] = DistFromPolyhedra(x,A,b);
    dist = -dist;
end    

end
        

    
    