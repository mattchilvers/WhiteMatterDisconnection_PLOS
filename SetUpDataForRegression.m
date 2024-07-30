% In this script we will pull in all the regions of the atlas

%clear all
%clc

% Load in Data
%load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\DataStructure\Subject_Data_UnilateralOnly.mat')
%load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\DataStructure\SubjectsRemoved_Data_Sept7.mat')
load('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/DataStructure/SubjectsRemoved_Data_Sept7.mat');
%load('M:\Matt Chilvers\OneDrive - University of Calgary\PhD_Projects\Project3_WhiteMatterLesion\DataStructure\SubjectsRemoved_Data_Sept7.mat')

%% Extract Data from lesioned hemipshere

for i = 1:length(Subject_Data)
    
    if strcmp(Subject_Data(i).LesionSide,'R')
        % Assign lesion side to right
        lesion_side{i,1} = Subject_Data(i).LesionSide;
        % Pull in grey matter lesion volume
        gm_lesion_vol(i,1) = Subject_Data(i).GM_LesionVol;
        % Pull in task score
        all_lesions(i,1) = Subject_Data(i).APM_Data.TaskScore;       
        % Pull in lesion info
        all_lesions(i,2) = Subject_Data(i).Tractotron.Proportion{2,1}*100;
        all_lesions(i,3) = Subject_Data(i).Tractotron.Proportion{2,3}*100;
        all_lesions(i,4) = Subject_Data(i).Tractotron.Proportion{2,5}*100;
        all_lesions(i,5) = Subject_Data(i).Tractotron.Proportion{2,7}*100;
        all_lesions(i,6) = Subject_Data(i).Tractotron.Proportion{2,9}*100;
        all_lesions(i,7) = Subject_Data(i).Tractotron.Proportion{2,13}*100;
        all_lesions(i,8) = Subject_Data(i).Tractotron.Proportion{2,14}*100;
        all_lesions(i,9) = Subject_Data(i).Tractotron.Proportion{2,15}*100;
        all_lesions(i,10) = Subject_Data(i).Tractotron.Proportion{2,16}*100;
        all_lesions(i,11) = Subject_Data(i).Tractotron.Proportion{2,18}*100;
        all_lesions(i,12) = Subject_Data(i).Tractotron.Proportion{2,20}*100;
        all_lesions(i,13) = Subject_Data(i).Tractotron.Proportion{2,21}*100;
        all_lesions(i,14) = Subject_Data(i).Tractotron.Proportion{2,23}*100;
        all_lesions(i,15) = Subject_Data(i).Tractotron.Proportion{2,24}*100;
        all_lesions(i,16) = Subject_Data(i).Tractotron.Proportion{2,26}*100;
        all_lesions(i,17) = Subject_Data(i).Tractotron.Proportion{2,28}*100;
        all_lesions(i,18) = Subject_Data(i).Tractotron.Proportion{2,30}*100;
        all_lesions(i,19) = Subject_Data(i).Tractotron.Proportion{2,32}*100;
        all_lesions(i,20) = Subject_Data(i).Tractotron.Proportion{2,34}*100;
        all_lesions(i,21) = Subject_Data(i).Tractotron.Proportion{2,36}*100;
        all_lesions(i,22) = Subject_Data(i).Tractotron.Proportion{2,38}*100;
        all_lesions(i,23) = Subject_Data(i).Tractotron.Proportion{2,40}*100;
        all_lesions(i,24) = Subject_Data(i).Tractotron.Proportion{2,42}*100;
        all_lesions(i,25) = Subject_Data(i).Tractotron.Proportion{2,44}*100;
        all_lesions(i,26) = Subject_Data(i).Tractotron.Proportion{2,46}*100;
        all_lesions(i,27) = Subject_Data(i).Tractotron.Proportion{2,48}*100;
        all_lesions(i,28) = Subject_Data(i).Tractotron.Proportion{2,50}*100;
        all_lesions(i,29) = Subject_Data(i).Tractotron.Proportion{2,52}*100;
        all_lesions(i,30) = Subject_Data(i).Tractotron.Proportion{2,54}*100;
        all_lesions(i,31) = Subject_Data(i).Tractotron.Proportion{2,56}*100;
        all_lesions(i,32) = Subject_Data(i).Tractotron.Proportion{2,58}*100;
        all_lesions(i,33) = Subject_Data(i).Tractotron.Proportion{2,60}*100;
        all_lesions(i,34) = Subject_Data(i).Tractotron.Proportion{2,62}*100;
        all_lesions(i,35) = Subject_Data(i).Tractotron.Proportion{2,64}*100;
        all_lesions(i,36) = Subject_Data(i).Tractotron.Proportion{2,66}*100;
        all_lesions(i,37) = Subject_Data(i).Tractotron.Proportion{2,68}*100;
        
    elseif strcmp(Subject_Data(i).LesionSide,'L')
        % Assign lesion side to right
        lesion_side{i,1} = Subject_Data(i).LesionSide;
        % Pull in grey matter lesion volume
        gm_lesion_vol(i,1) = Subject_Data(i).GM_LesionVol;
        % Pull in task score
        all_lesions(i,1) = Subject_Data(i).APM_Data.TaskScore;       
        % Pull in lesion info
        all_lesions(i,2) = Subject_Data(i).Tractotron.Proportion{2,1}*100;
        all_lesions(i,3) = Subject_Data(i).Tractotron.Proportion{2,2}*100;
        all_lesions(i,4) = Subject_Data(i).Tractotron.Proportion{2,4}*100;
        all_lesions(i,5) = Subject_Data(i).Tractotron.Proportion{2,6}*100;
        all_lesions(i,6) = Subject_Data(i).Tractotron.Proportion{2,8}*100;
        all_lesions(i,7) = Subject_Data(i).Tractotron.Proportion{2,10}*100;
        all_lesions(i,8) = Subject_Data(i).Tractotron.Proportion{2,11}*100;
        all_lesions(i,9) = Subject_Data(i).Tractotron.Proportion{2,12}*100;
        all_lesions(i,10) = Subject_Data(i).Tractotron.Proportion{2,16}*100;
        all_lesions(i,11) = Subject_Data(i).Tractotron.Proportion{2,17}*100;
        all_lesions(i,12) = Subject_Data(i).Tractotron.Proportion{2,19}*100;
        all_lesions(i,13) = Subject_Data(i).Tractotron.Proportion{2,21}*100;
        all_lesions(i,14) = Subject_Data(i).Tractotron.Proportion{2,22}*100;
        all_lesions(i,15) = Subject_Data(i).Tractotron.Proportion{2,24}*100;
        all_lesions(i,16) = Subject_Data(i).Tractotron.Proportion{2,25}*100;
        all_lesions(i,17) = Subject_Data(i).Tractotron.Proportion{2,27}*100;
        all_lesions(i,18) = Subject_Data(i).Tractotron.Proportion{2,29}*100;
        all_lesions(i,19) = Subject_Data(i).Tractotron.Proportion{2,31}*100;
        all_lesions(i,20) = Subject_Data(i).Tractotron.Proportion{2,33}*100;
        all_lesions(i,21) = Subject_Data(i).Tractotron.Proportion{2,35}*100;
        all_lesions(i,22) = Subject_Data(i).Tractotron.Proportion{2,37}*100;
        all_lesions(i,23) = Subject_Data(i).Tractotron.Proportion{2,39}*100;
        all_lesions(i,24) = Subject_Data(i).Tractotron.Proportion{2,41}*100;
        all_lesions(i,25) = Subject_Data(i).Tractotron.Proportion{2,43}*100;
        all_lesions(i,26) = Subject_Data(i).Tractotron.Proportion{2,45}*100;
        all_lesions(i,27) = Subject_Data(i).Tractotron.Proportion{2,47}*100;
        all_lesions(i,28) = Subject_Data(i).Tractotron.Proportion{2,49}*100;
        all_lesions(i,29) = Subject_Data(i).Tractotron.Proportion{2,51}*100;
        all_lesions(i,30) = Subject_Data(i).Tractotron.Proportion{2,53}*100;
        all_lesions(i,31) = Subject_Data(i).Tractotron.Proportion{2,55}*100;
        all_lesions(i,32) = Subject_Data(i).Tractotron.Proportion{2,57}*100;
        all_lesions(i,33) = Subject_Data(i).Tractotron.Proportion{2,59}*100;
        all_lesions(i,34) = Subject_Data(i).Tractotron.Proportion{2,61}*100;
        all_lesions(i,35) = Subject_Data(i).Tractotron.Proportion{2,63}*100;
        all_lesions(i,36) = Subject_Data(i).Tractotron.Proportion{2,65}*100;
        all_lesions(i,37) = Subject_Data(i).Tractotron.Proportion{2,67}*100;
        
    end
    
end

%% Convert to table
all_lesion_data = array2table(all_lesions);

%% Standardize data to mean = 0, SD = 1
stnd_data = normalize(all_lesions);
stnd_gm_lesionvol = normalize(gm_lesion_vol);

%% Create labels
DataLabels % Runs data labels to generate data labels

%% Add Standardized data
all_lesion_data = addvars(all_lesion_data,stnd_data);
all_lesion_data = splitvars(all_lesion_data,'stnd_data'); % Need to split variable

%% Add lesion side
all_lesion_data = addvars(all_lesion_data,lesion_side,'After','all_lesions1');

%% Change variable names
all_lesion_data.Properties.VariableNames = labels;

%% Make Lesion Side categorical
all_lesion_data.LesionSide = categorical(all_lesion_data.LesionSide);

%% Add GM Lesion vol
all_lesion_data = addvars(all_lesion_data,gm_lesion_vol,'After','LesionSide');
all_lesion_data.Properties.VariableNames{3} = 'GM_LesionVol';
% Add stnd version
all_lesion_data = addvars(all_lesion_data,stnd_gm_lesionvol,'After','Stnd_TaskScore');
all_lesion_data.Properties.VariableNames{41} = 'Stnd_GM_LesionVol';
%% 

%% Split into left and right tables
[len wid] = size(all_lesion_data);
r = 0; l = 0;

for i = 1:len
    if all_lesion_data(i,2).LesionSide == 'R'
        r = r + 1;
        right_data_table(r,:) = all_lesion_data(i,:);
    elseif all_lesion_data(i,2).LesionSide == 'L'
        l = l + 1;
        left_data_table(l,:) = all_lesion_data(i,:);       
    end
end

%% Get left and right lesion data in array
SeparateLRdata

%% Clear redundant variables
clear i r l len wid
