% Final Regression Script
clear all
clc
cd('M:\Matt Chilvers\OneDrive - University of Calgary\PhD_Projects\Project3_WhiteMatterLesion\Scripts\AllRevisionsAnalysis\RegressionAnalysis_Uncontrolled')

SetUpDataForRegression
ScrubData

clc

load('M:\Matt Chilvers\OneDrive - University of Calgary\PhD_Projects\Project3_WhiteMatterLesion\Scripts\AllRevisionsAnalysis\RegressionAnalysis_Uncontrolled\lm_data_uncontrolled.mat')

%% Make Lesion Side categorical
%data_removed_table.LesionSide = categorical(data_removed_table.LesionSide);

%% Calculate number of non-zero entries for each variable and run regression

i = 24;

n_all = nnz(all_lesion_data.Uncinate)
n_right = nnz(right_data_table.Uncinate)
n_left = nnz(left_data_table.Uncinate)

if  n_right >= 25 && n_left >= 25
    
    lm_all = fitlm(all_lesion_data,...
        'Stnd_TaskScore ~ Stnd_Uncinate + LesionSide + Stnd_Uncinate*LesionSide')
    
    if lm_all.Coefficients(4,4).pValue > 0.0125
        % Run regression again without interaction
        lm_all = fitlm(all_lesion_data,...
            'Stnd_TaskScore ~ Stnd_Uncinate + LesionSide')
    end
    

    Coefficients = lm_all.Coefficients
    CI = array2table(coefCI(lm_all),'VariableNames',{'LowerCI','UpperCI'})
    Coefficients = addvars(Coefficients,CI)
    Coefficients = splitvars(Coefficients,'CI')
    
   
    lm_data(i).Tract = 'Uncinate'; 
    lm_data(i).n_all = n_all;
    lm_data(i).n_right = n_right;
    lm_data(i).n_left = n_left;
    lm_data(i).Coefs = Coefficients;
    
    cd('M:\Matt Chilvers\OneDrive - University of Calgary\PhD_Projects\Project3_WhiteMatterLesion\Scripts\AllRevisionsAnalysis\RegressionAnalysis_Uncontrolled')
    save('lm_data_uncontrolled.mat','lm_data');
    
end

%load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis\lm_data.mat')
% all_variables_lm = fitlm(all_lesion_data,...
%     'Stnd_TaskScore ~ Stnd_GM_LesionVol + LesionSide + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate + Stnd_Uncinate')     

% n_right = nnz(right_data_table.Uncinate)
% lm_right = fitlm(right_data_table,...
%     'TaskScore ~ Uncinate')
% 
% n_left = nnz(left_data_table.Uncinate)
% lm_left = fitlm(left_data_table,...
%     'TaskScore ~ Uncinate')
% 
% coefs = [table2array(lm_left.Coefficients(2,1)) table2array(lm_left.Coefficients(2,4)) ; table2array(lm_right.Coefficients(2,1)) table2array(lm_right.Coefficients(2,4))]
% 


