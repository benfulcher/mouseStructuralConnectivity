function LabelMajorBrainRegions()
% Useful to have a region-based ordering of where in the brain each subregion is located in
% This is done in the paper's Fig. 4a.
% We can load the injection data from Excel that has these regions labeled
% (Suppl_Table_2) and match the strings to the data loaded from Suppl_Table_3
%
% Takes in Labels, the region acronyms from the ABA connectivity matrix
% ------------------------------------------------------------------------------

% Load data from Matlab file
load('Mouse_Connectivity_Data.mat','RegionAcronyms')

% Load labeling data from Supplementary File 2:
fprintf(1,'Loading connectivity data...');
load('Mouse_Connectivity_Data.mat')
fprintf(1,' Done.\n');

InputFileName = 'nature13186-s2.xlsx';
fprintf(1,'Loading big excel table...');
[~,AllText] = xlsread(InputFileName,'Voxel_Count_295_Structures');
fprintf(1,'Data imported from Excel file ''%s''!\n',InputFileName);


% Get the required columns out:
Acronym = AllText(2:end,3);
SiteName = AllText(2:end,4);
MajorRegion = AllText(2:end,5);

% Match them to the data:
MatchPoint = cellfun(@(x)MajorRegion(strcmp(x,Acronym)),RegionAcronyms,'UniformOutput',0);

% Assign SUM (Supramammillary nucleus) to Midbrain (not in this particular list):
SUMhere = find(strcmp(RegionAcronyms,'SUM'));
if isempty(MatchPoint{SUMhere})
    MatchPoint{SUMhere} = 'Midbrain';
else
    fprintf('Something weird\n');
end

% Convert to strings:
MajorRegionLabels = cell(length(MatchPoint),1);
for i = 1:length(MatchPoint)
    if iscell(MatchPoint{i})
        MajorRegionLabels{i} = MatchPoint{i}{1};
    else
        MajorRegionLabels{i} = MatchPoint{i};
    end
end
NumMajorRegions = length(unique(MajorRegionLabels));

% Keep sorting permutation
[~,MajReg_ix] = sort(MajorRegionLabels);
[~,MajReg_Oh_ix] = sort(MajorRegionLabels);

% Save back to file:
save('Mouse_Connectivity_Data.mat','MajorRegionLabels','NumMajorRegions','MajReg_ix','MajorRegionLabels','-append')
fprintf(1,'Appended major region labels to ''Mouse_Connectivity_Data.mat''\n');

end
