function [structInfoMatched,ia] = MatchRegionsOh(regionAcronymsOh,regionNames)
%-------------------------------------------------------------------------------
% Matches a list of regions (acronyms) to Oh et al. regions
if nargin < 1 || isempty(regionAcronymsOh)
    dataLoad = load('Mouse_Connectivity_Data.mat','regionAcronyms');
    regionAcronymsOh = dataLoad.regionAcronyms;
end
%-------------------------------------------------------------------------------

[~,ia,ib] = intersect(lower(regionNames),lower(regionAcronymsOh),'stable');
structInfoMatched = structInfoOh(ib,:);

fprintf(1,'%u/%u matched to Oh et al. (213-region whole brain parcellation)\n',...
                        height(structInfoMatched),length(regionNames));

end
