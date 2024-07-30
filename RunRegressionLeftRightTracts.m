% Final Regression Script
clear all
clc
%cd('M:\Matt Chilvers\OneDrive - University of Calgary\PhD_Projects\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis')
cd('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/Plots/ScatterPlots/FinalRegressionAnalysis')


SetUpDataForRegression
ScrubData

clc

%load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis\Final\lm_data.mat')
%load('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/AllRevisionsAnalysis/RegressionOnEachHemisphere/lm_data_rsquared.mat')

%% Make Lesion Side categorical
%data_removed_table.LesionSide = categorical(data_removed_table.LesionSide);

%% Calculate number of non-zero entries for each variable and run regression

% i = 24;
% 
% n_all = nnz(all_lesion_data.Uncinate)
% n_right = nnz(right_data_table.Uncinate)
% n_left = nnz(left_data_table.Uncinate)
% 
% if  n_right >= 25 && n_left >= 25
%     
%     lm_all = fitlm(all_lesion_data,...
%         'Stnd_TaskScore ~ Stnd_GM_LesionVol + Stnd_Uncinate*LesionSide')
%     
%     if lm_all.Coefficients(5,4).pValue > 0.0125
%         % Run regression again without interaction
%         lm_all = fitlm(all_lesion_data,...
%             'Stnd_TaskScore ~ Stnd_GM_LesionVol + Stnd_Uncinate + LesionSide')
%     end
%     
% 
%     Coefficients = lm_all.Coefficients
%     CI = array2table(coefCI(lm_all),'VariableNames',{'LowerCI','UpperCI'})
%     Coefficients = addvars(Coefficients,CI)
%     Coefficients = splitvars(Coefficients,'CI')
%     
%    
%     lm_data_rsquared(i).Tract = 'Uncinate'; 
%     lm_data_rsquared(i).n_all = n_all;
%     lm_data_rsquared(i).n_right = n_right;
%     lm_data_rsquared(i).n_left = n_left;
%     lm_data_rsquared(i).Coefs = Coefficients;
%     lm_data_rsquared(i).Rsquared = lm_all.Rsquared.Adjusted;
%     
%     cd('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/AllRevisionsAnalysis')
%     %save('lm_data_rsquared.mat','lm_data_rsquared');
%     
% end

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

%% Run regression on left group only

%load left structure
load('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/AllRevisionsAnalysis/RegressionOnEachHemisphere/lm_left_rsquared.mat')

i = 23;

n_left = nnz(left_data_table.Uncinate)

if  n_left >= 25
    
    lm_left = fitlm(left_data_table,...
        'Stnd_TaskScore ~ Stnd_GM_LesionVol + Stnd_UncinateI')
      

    Coefficients = lm_left.Coefficients
    CI = array2table(coefCI(lm_left),'VariableNames',{'LowerCI','UpperCI'})
    Coefficients = addvars(Coefficients,CI)
    Coefficients = splitvars(Coefficients,'CI')
    
   
    lm_left_rsquared(i).Tract = 'UncinateI'; 
    lm_left_rsquared(i).n_left = n_left;
    lm_left_rsquared(i).Coefs = Coefficients;
    lm_left_rsquared(i).Rsquared = lm_left.Rsquared.Adjusted;
    
    %cd('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/AllRevisionsAnalysis')
    cd('M:\Matt Chilvers\OneDrive - University of Calgary\PhD_Projects\Project3_WhiteMatterLesion\Scripts\AllRevisionsAnalysis\RegressionOnEachHemisphere')
    %save('lm_left_rsquared.mat','lm_left_rsquared');
    
end

%% Run regression on right group only
load('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/AllRevisionsAnalysis/RegressionOnEachHemisphere/lm_right_rsquared.mat')

i = 31;

n_right = nnz(right_data_table.Uncinate)

if  n_right >= 25
    
    lm_right = fitlm(right_data_table,...
        'Stnd_TaskScore ~ Stnd_GM_LesionVol + Stnd_Uncinate')
      

    Coefficients = lm_right.Coefficients
    CI = array2table(coefCI(lm_right),'VariableNames',{'LowerCI','UpperCI'})
    Coefficients = addvars(Coefficients,CI)
    Coefficients = splitvars(Coefficients,'CI')
    
   
    lm_right_rsquared(i).Tract = 'Uncinate'; 
    lm_right_rsquared(i).n_right = n_right;
    lm_right_rsquared(i).Coefs = Coefficients;
    lm_right_rsquared(i).Rsquared = lm_right.Rsquared.Adjusted;

    cd('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/AllRevisionsAnalysis/RegressionOnEachHemisphere')
    save('lm_right_rsquared.mat','lm_right_rsquared');

end
