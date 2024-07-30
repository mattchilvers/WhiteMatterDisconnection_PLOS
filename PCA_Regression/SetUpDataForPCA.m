%% Set up data for PCA

clear all
clc

cd('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\PCA_Regression')

% Load in Data
load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\DataStructure\Subject_Data_UnilateralOnly.mat')

%% Extract data

for i = 1:length(Subject_Data)
    
    if strcmp(Subject_Data(i).LesionSide,'R')
        % Assign lesion side to right
        all_lesion_side{i,1} = Subject_Data(i).LesionSide;
        % Pull in grey matter lesion volume
        all_gm_lesion_vol(i,1) = Subject_Data(i).GM_LesionVol;
        % Pull in task score
        all_taskScore(i,1) = Subject_Data(i).APM_Data.TaskScore; 
        
        % Pull in lesion info
        all_lesions(i,1) = Subject_Data(i).Tractotron.Proportion{2,1}*100;
        all_lesions(i,2) = Subject_Data(i).Tractotron.Proportion{2,3}*100;
        all_lesions(i,3) = Subject_Data(i).Tractotron.Proportion{2,5}*100;
        all_lesions(i,4) = Subject_Data(i).Tractotron.Proportion{2,7}*100;
        all_lesions(i,5) = Subject_Data(i).Tractotron.Proportion{2,9}*100;
        all_lesions(i,6) = Subject_Data(i).Tractotron.Proportion{2,13}*100;
        all_lesions(i,7) = Subject_Data(i).Tractotron.Proportion{2,14}*100;
        all_lesions(i,8) = Subject_Data(i).Tractotron.Proportion{2,15}*100;
        all_lesions(i,9) = Subject_Data(i).Tractotron.Proportion{2,16}*100;
        all_lesions(i,10) = Subject_Data(i).Tractotron.Proportion{2,18}*100;
        all_lesions(i,11) = Subject_Data(i).Tractotron.Proportion{2,20}*100;
        all_lesions(i,12) = Subject_Data(i).Tractotron.Proportion{2,21}*100;
        all_lesions(i,13) = Subject_Data(i).Tractotron.Proportion{2,23}*100;
        all_lesions(i,14) = Subject_Data(i).Tractotron.Proportion{2,24}*100;
        all_lesions(i,15) = Subject_Data(i).Tractotron.Proportion{2,26}*100;
        all_lesions(i,16) = Subject_Data(i).Tractotron.Proportion{2,28}*100;
        all_lesions(i,17) = Subject_Data(i).Tractotron.Proportion{2,30}*100;
        all_lesions(i,18) = Subject_Data(i).Tractotron.Proportion{2,32}*100;
        all_lesions(i,19) = Subject_Data(i).Tractotron.Proportion{2,34}*100;
        all_lesions(i,20) = Subject_Data(i).Tractotron.Proportion{2,36}*100;
        all_lesions(i,21) = Subject_Data(i).Tractotron.Proportion{2,38}*100;
        all_lesions(i,22) = Subject_Data(i).Tractotron.Proportion{2,40}*100;
        all_lesions(i,23) = Subject_Data(i).Tractotron.Proportion{2,42}*100;
        all_lesions(i,24) = Subject_Data(i).Tractotron.Proportion{2,44}*100;
        all_lesions(i,25) = Subject_Data(i).Tractotron.Proportion{2,46}*100;
        all_lesions(i,26) = Subject_Data(i).Tractotron.Proportion{2,48}*100;
        all_lesions(i,27) = Subject_Data(i).Tractotron.Proportion{2,50}*100;
        all_lesions(i,28) = Subject_Data(i).Tractotron.Proportion{2,52}*100;
        all_lesions(i,29) = Subject_Data(i).Tractotron.Proportion{2,54}*100;
        all_lesions(i,30) = Subject_Data(i).Tractotron.Proportion{2,56}*100;
        all_lesions(i,31) = Subject_Data(i).Tractotron.Proportion{2,58}*100;
        all_lesions(i,32) = Subject_Data(i).Tractotron.Proportion{2,60}*100;
        all_lesions(i,33) = Subject_Data(i).Tractotron.Proportion{2,62}*100;
        all_lesions(i,34) = Subject_Data(i).Tractotron.Proportion{2,64}*100;
        all_lesions(i,35) = Subject_Data(i).Tractotron.Proportion{2,66}*100;
        all_lesions(i,36) = Subject_Data(i).Tractotron.Proportion{2,68}*100;
        
        elseif strcmp(Subject_Data(i).LesionSide,'L')
            % Assign lesion side to left
        all_lesion_side{i,1} = Subject_Data(i).LesionSide;
        % Pull in grey matter lesion volume
        all_gm_lesion_vol(i,1) = Subject_Data(i).GM_LesionVol;
        % Pull in task score
        all_taskScore(i,1) = Subject_Data(i).APM_Data.TaskScore; 
        
        % Pull in lesion info
        all_lesions(i,1) = Subject_Data(i).Tractotron.Proportion{2,1}*100;
        all_lesions(i,2) = Subject_Data(i).Tractotron.Proportion{2,2}*100;
        all_lesions(i,3) = Subject_Data(i).Tractotron.Proportion{2,4}*100;
        all_lesions(i,4) = Subject_Data(i).Tractotron.Proportion{2,6}*100;
        all_lesions(i,5) = Subject_Data(i).Tractotron.Proportion{2,8}*100;
        all_lesions(i,6) = Subject_Data(i).Tractotron.Proportion{2,10}*100;
        all_lesions(i,7) = Subject_Data(i).Tractotron.Proportion{2,11}*100;
        all_lesions(i,8) = Subject_Data(i).Tractotron.Proportion{2,12}*100;
        all_lesions(i,9) = Subject_Data(i).Tractotron.Proportion{2,16}*100;
        all_lesions(i,10) = Subject_Data(i).Tractotron.Proportion{2,17}*100;
        all_lesions(i,11) = Subject_Data(i).Tractotron.Proportion{2,19}*100;
        all_lesions(i,12) = Subject_Data(i).Tractotron.Proportion{2,21}*100;
        all_lesions(i,13) = Subject_Data(i).Tractotron.Proportion{2,22}*100;
        all_lesions(i,14) = Subject_Data(i).Tractotron.Proportion{2,24}*100;
        all_lesions(i,15) = Subject_Data(i).Tractotron.Proportion{2,25}*100;
        all_lesions(i,16) = Subject_Data(i).Tractotron.Proportion{2,27}*100;
        all_lesions(i,17) = Subject_Data(i).Tractotron.Proportion{2,29}*100;
        all_lesions(i,18) = Subject_Data(i).Tractotron.Proportion{2,31}*100;
        all_lesions(i,19) = Subject_Data(i).Tractotron.Proportion{2,33}*100;
        all_lesions(i,20) = Subject_Data(i).Tractotron.Proportion{2,35}*100;
        all_lesions(i,21) = Subject_Data(i).Tractotron.Proportion{2,37}*100;
        all_lesions(i,22) = Subject_Data(i).Tractotron.Proportion{2,39}*100;
        all_lesions(i,23) = Subject_Data(i).Tractotron.Proportion{2,41}*100;
        all_lesions(i,24) = Subject_Data(i).Tractotron.Proportion{2,43}*100;
        all_lesions(i,25) = Subject_Data(i).Tractotron.Proportion{2,45}*100;
        all_lesions(i,26) = Subject_Data(i).Tractotron.Proportion{2,47}*100;
        all_lesions(i,27) = Subject_Data(i).Tractotron.Proportion{2,49}*100;
        all_lesions(i,28) = Subject_Data(i).Tractotron.Proportion{2,51}*100;
        all_lesions(i,29) = Subject_Data(i).Tractotron.Proportion{2,53}*100;
        all_lesions(i,30) = Subject_Data(i).Tractotron.Proportion{2,55}*100;
        all_lesions(i,31) = Subject_Data(i).Tractotron.Proportion{2,57}*100;
        all_lesions(i,32) = Subject_Data(i).Tractotron.Proportion{2,59}*100;
        all_lesions(i,33) = Subject_Data(i).Tractotron.Proportion{2,61}*100;
        all_lesions(i,34) = Subject_Data(i).Tractotron.Proportion{2,63}*100;
        all_lesions(i,35) = Subject_Data(i).Tractotron.Proportion{2,65}*100;
        all_lesions(i,36) = Subject_Data(i).Tractotron.Proportion{2,67}*100;

    end
   
end

clear i
%% Generate labels

DataLabels_PCA

%% Create left and right arrays

r = 0; l = 0;

for i = 1:length(all_lesions)
    
    if strcmp(all_lesion_side{i,1},'R')
        r = r+1;
        right_lesions(r,:) = all_lesions(i,:);
    elseif strcmp(all_lesion_side{i,1},'L')
        l = l+1;
        left_lesions(l,:) = all_lesions(i,:);
    end
    
end

clear r l i 

%% Delete variables with insufficient data entries
[l,w] = size(right_lesions);
del_store = [];

for col = 1:w
    
    n_right = nnz(right_lesions(:,col));
    n_left = nnz(left_lesions(:,col));
    
    if n_right < 25 || n_left < 25
        
        display(['Less than 25 entries in L & R for column ', num2str(col),'. Remove data for ',labels{1,col}])
        
        del_store(end+1,1) = col; % Store column row
        
    end
    
end

a = numel(del_store);
for i = a:-1:1
    all_lesions(:,del_store(i,1)) = [];
    labels(:,del_store(i,1)) = [];
end

clear l w i a del_store col n_left n_right
%% Delete non-zero variables
% [l,w] = size(all_lesions);
% del_store = [];
% 
% for col = 1:w
%     
%     non_zeros(1,col) = nnz(all_lesions(:,col));
%     
%     if nnz(all_lesions(:,col)) < 25
%         
%         display(['Less than 25 entries for column ', num2str(col),'. Remove data for ',labels{1,col}])
%         del_store(end+1,1) = col;
%         
%     end
%     
% end
% 
% a = numel(del_store);
% 
% for i = a:-1:1
%     all_lesions(:,del_store(i,1)) = [];
%     labels(:,del_store(i,1)) = [];
% end

%clear l w i a del_store non_zeros col
%% Convert to predictor variables
predictor_variables = [all_lesions all_gm_lesion_vol];
response_variable = all_taskScore;

% Create standardised versions
stnd_predictor_variables = normalize(predictor_variables);
stnd_response_variable = normalize(response_variable);

% Add lesion volume to labels
predictor_labels = labels;
predictor_labels{1,end+1} = 'GM_LesionVol';

clear labels



            