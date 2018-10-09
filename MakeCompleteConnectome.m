function [W,commonRegions] = MakeCompleteConnectome(W_rect,sourceRegions,targetRegions,justUnion);
% Idea is to generate a fully connected subsets of regions
% and look at the resulting connectome
%-------------------------------------------------------------------------------

if nargin < 4
    justUnion = true;
end

%-------------------------------------------------------------------------------
if justUnion
    % Ok, we want to get a matching set of regions and get complete connectome here
    % Differences in capitalization mean we have to compare lower-case versions of each:
    [~,ia,ib] = intersect(lower(sourceRegions),lower(targetRegions));
    commonRegions = sourceRegions(ia);

    W = W_rect(ia,ib);
else
    % Expand to a square matrix with matching rows/columns but NaNs marking
    % missing data
    commonRegions = union(sourceRegions,targetRegions);
    numAreas = length(commonRegions);
    W = nan(numAreas,numAreas);
    ia = cellfun(@(x)find(strcmp(x,sourceRegions)),commonRegions,'UniformOutput',false);
    ib = cellfun(@(x)find(strcmp(x,targetRegions)),commonRegions,'UniformOutput',false);
    matchesRow = cellfun(@(x)~isempty(x),ia);
    matchesCol = cellfun(@(x)~isempty(x),ib);
    ia = [ia{cellfun(@(x)~isempty(x),ia)}];
    ib = [ib{cellfun(@(x)~isempty(x),ib)}];
    W(matchesRow,matchesCol) = W_rect(ia,ib);
end

end
