% Final Regression Script
clear all
clc
%cd('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis')
cd('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/Plots/ScatterPlots/FinalRegressionAnalysis')


SetUpDataForRegression
ScrubData

clc

%load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis\Final\lm_data.mat')
load('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/Plots/ScatterPlots/FinalRegressionAnalysis/Final/lm_data.mat')

%% Make Lesion Side categorical
%data_removed_table.LesionSide = categorical(data_removed_table.LesionSide);

%% Calculate number of non-zero entries for each variable and run regression

i = 4;

n_all = nnz(all_lesion_data.Long_Segment_Arcuate)
n_right = nnz(right_data_table.Long_Segment_Arcuate)
n_left = nnz(left_data_table.Long_Segment_Arcuate)

if  n_right >= 25 && n_left >= 25
    
    lm_all = fitlm(all_lesion_data,...
        'Stnd_TaskScore ~ Stnd_GM_LesionVol + Stnd_Long_Segment_Arcuate*LesionSide')
    
    if lm_all.Coefficients(5,4).pValue > 0.0125
        % Run regression again without interaction
        lm_all = fitlm(all_lesion_data,...
            'Stnd_TaskScore ~ Stnd_GM_LesionVol + Stnd_Long_Segment_Arcuate + LesionSide')
    end
    

    Coefficients = lm_all.Coefficients
    CI = array2table(coefCI(lm_all),'VariableNames',{'LowerCI','UpperCI'})
    Coefficients = addvars(Coefficients,CI)
    Coefficients = splitvars(Coefficients,'CI')
    
   
    lm_data(i).Tract = 'Long_Segment_Arcuate'; 
    lm_data(i).n_all = n_all;
    lm_data(i).n_right = n_right;
    lm_data(i).n_left = n_left;
    lm_data(i).Coefs = Coefficients;
    
    cd('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis\Final')
    %save('lm_data.mat','lm_data');
    
end

%load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis\lm_data.mat')
% all_variables_lm = fitlm(all_lesion_data,...
%     'Stnd_TaskScore ~ Stnd_GM_LesionVol + LesionSide + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Long_Segment_Arcuate')     

% n_right = nnz(right_data_table.Long_Segment_Arcuate)
% lm_right = fitlm(right_data_table,...
%     'TaskScore ~ Long_Segment_Arcuate')
% 
% n_left = nnz(left_data_table.Long_Segment_Arcuate)
% lm_left = fitlm(left_data_table,...
%     'TaskScore ~ Long_Segment_Arcuate')
% 
% coefs = [table2array(lm_left.Coefficients(2,1)) table2array(lm_left.Coefficients(2,4)) ; table2array(lm_right.Coefficients(2,1)) table2array(lm_right.Coefficients(2,4))]
% 


