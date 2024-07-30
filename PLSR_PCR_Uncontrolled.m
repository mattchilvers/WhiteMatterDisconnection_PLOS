cd('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\PCA_Regression')
SetUpDataForPCA

%% Run partial least squares regression on 10 components

% X = stnd_predictor_variables;
% y = stnd_response_variable;
% [n,p] = size(X);
% 
% [Xloadings,Yloadings,Xscores,Yscores,betaPLS10,PLSPctVar,MSE,PLSstats] = plsregress(...
%  	X,y,10);
% 
% plot(1:10,cumsum(100*PLSPctVar(1,:)),'-bo');
% xlabel('Number of PLS components');
% ylabel('Percent Variance Explained in X');
% 
% yfitPLS10 = [ones(n,1) X]*betaPLS10;
% 
% residuals = y - yfitPLS10;
% stem(residuals)

%% Move on to perform PCR (Principal component regression)
X = stnd_predictor_variables;
y = stnd_response_variable;

[PCALoadings,PCAScores,PCAVar,tSquared,VarExplain] = pca(X,'Economy',false);

%Rotated_PCALoadings = rotatefactors(PCALoadings,'Method','varimax');
%Rotated_PCALoadings = table(Rotated_PCALoadings,'RowNames',predictor_labels);

% Put things into table form
PCALoadings = table(PCALoadings,'RowNames',predictor_labels);
PCALoadings = splitvars(PCALoadings);
PCALoadings = sortrows(PCALoadings,'PCALoadings_2','descend'); %Sort by PCA1 descending

%Plot variance explained by each principal component
VarExplain = [0 ; VarExplain]; %add zero to beginning of var expalined for plotting purposes

figure
hold on

plot(0:10,cumsum(VarExplain(1:11,1)),'-k.','MarkerSize',10);
xlabel('Number of Principal Components');
ylabel('Percentage of Variance Explained');
xlim([0,10])
ylim([0,100])

% Plot 95% var explained
plot(0:10,ones(1,11)*95,'k--')

% Fit model to PCA scores
PCR9_lm = fitlm(PCAScores(:,1:9),y)
PCR5_lm = fitlm(PCAScores(:,1:5),y)

% Plot residuals
figure
hold on

stem(PCR9_lm.Residuals.Raw)

xlabel('Observation');
ylabel('Observed minus fitted');

%% Load data for regression with select components
cd('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis')
SetUpDataForRegression

%%
PClm = fitlm(all_lesion_data,...
    'Stnd_TaskScore ~ Stnd_GM_LesionVol + LesionSide + Stnd_Corpus_Callosum + Stnd_SLFIII + Stnd_SLFII + Stnd_IFOF + Stnd_Ant_Segment_Arcuate + Stnd_Long_Segment_Arcuate + Stnd_Fronto_Insular5 + Stnd_CST + Stnd_Pons + Stnd_Ant_Thalamic_Projections')

%lm = fitlm(all_lesion_data,...
    %'Stnd_TaskScore ~ Stnd_GM_LesionVol + LesionSide + Stnd_SLFIII + Stnd_Long_Segment_Arcuate')


