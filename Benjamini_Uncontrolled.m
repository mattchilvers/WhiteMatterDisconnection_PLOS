%Benjamini Hochberg correction
clear all
clc

load('M:\Matt Chilvers\OneDrive - University of Calgary\PhD_Projects\Project3_WhiteMatterLesion\Scripts\AllRevisionsAnalysis\RegressionAnalysis_Uncontrolled\lm_data_uncontrolled.mat')
%load('M:\Matt Chilvers\Documents\PhD\Project3_WhiteMatterLesion\Scripts\Plots\ScatterPlots\FinalRegressionAnalysis\Final\lm_data.mat')
%load('/Users/dukelowlab/Library/CloudStorage/OneDrive-UniversityofCalgary/PhD_Projects/Project3_WhiteMatterLesion/Scripts/Plots/ScatterPlots/FinalRegressionAnalysis/Final/lm_data.mat');
Ordered_Pvalues = {};

% Get all p values
for i = 1:length(lm_data)
    Ordered_Pvalues{end+1,1} = strcat(lm_data(i).Tract,' LesionSide');
    Ordered_Pvalues{end,2} = table2array(lm_data(i).Coefs(2,4));
    Ordered_Pvalues{end+1,1} = strcat(lm_data(i).Tract,' Tract Damage');
    Ordered_Pvalues{end,2} = table2array(lm_data(i).Coefs(3,4)); 
end

% Sort by pvalue
Ordered_Pvalues = sortrows(Ordered_Pvalues,2);

% Add critical q value
for i = 1:length(Ordered_Pvalues)
    Ordered_Pvalues{i,3} = (i/46)*0.05; % (i/m)Q where i is the p value rank, m is the number of tests and Q is the FDR
end

% Compare p to critical alpha
for i = 1:length(Ordered_Pvalues)    
    if Ordered_Pvalues{i,2} < Ordered_Pvalues{i,3}
        Ordered_Pvalues{i,4} = 'Accept';
    else
        Ordered_Pvalues{i,4} = 'Reject';
    end
end

clear i

%%  Extract significant Tract Damage data
pos = 0;

for i = 1:length(Ordered_Pvalues)
    if contains(Ordered_Pvalues{i,1},'Tract Damage') && strcmp(Ordered_Pvalues{i,4},'Accept')
        pos = pos + 1;
        % Extract string for label
        sign_tract{pos,1} = extractBefore(Ordered_Pvalues{i,1},' Tract Damage');
        sign_tract{pos,1} = strrep(sign_tract{pos,1},'_',' ');
    end
end

clear i pos

% Create index to extract data from
index = [1 2 3 4 5 7 8 9 10 13 14 15 16 17 18 19 20 21 22 23];
tractorder = [12 19 4 1 6 5 13 8 17 9 7 15 10 11 14 18 16 20 2 3];
sign_tract = sign_tract(tractorder,:);
pos = 0;

for i = 1:length(index)
    pos = pos+1;
    %Tract damage
        sign_data(pos,1) = lm_data(index(i)).Coefs(3,1).Estimate;
        sign_err(pos,1) = (lm_data(index(i)).Coefs(3,6).UpperCI - lm_data(index(i)).Coefs(3,5).LowerCI)/2;
        
        % Lesion Side
        sign_data(pos,2) = lm_data(index(i)).Coefs(2,1).Estimate;
        sign_err(pos,2) = (lm_data(index(i)).Coefs(2,6).UpperCI - lm_data(index(i)).Coefs(2,5).LowerCI)/2;
        
end

clear pos index i

% Plot data
figure
hold on

y = linspace(17.275,0.65,20);
%y(2,:) = linspace(17.125,0.5,20);
y(2,:) = linspace(16.975,0.35,20);
y = y'; % flip data

e = errorbar(sign_data,y,sign_err,'.','horizontal','MarkerSize',10)

% Modify colours
set(e(1),'Color',[0.5 0.5 0.5])
set(e(2),'Color',[0 0 0])
%set(e(3),'Color',[0.25 0.25 0.25])

%axis ticks
yticks(0.5:0.875:17.125)
yticklabels(flip(sign_tract,1))
ylim([0,18])

% xticks(-0.2:0.2:0.8)
 xlim([-0.1,0.8])
xlabel('z score')

% Add zero line
x1 = [0 0];
y1 = [0 length(sign_data)+1];
plot(x1,y1,'k--')

% Add legend
legend('Tract Damage','Lesion Side','Location','best')

clear x1 y y1 e tractorder

%% Extract significant Lesion Side Data
pos = 0;

for i = 1:length(Ordered_Pvalues)
    if contains(Ordered_Pvalues{i,1},'LesionSide') && strcmp(Ordered_Pvalues{i,4},'Accept')
        pos = pos + 1;
        % Extract string for label
        sign_lesionside{pos,1} = extractBefore(Ordered_Pvalues{i,1},' LesionSide');
        sign_lesionside{pos,1} = strrep(sign_lesionside{pos,1},'_',' ');
    end
end

clear i pos

%% Extract significant GM Lesion Volume Data
pos = 0;

for i = 1:length(Ordered_Pvalues)
    if contains(Ordered_Pvalues{i,1},'GM Lesion Vol') && strcmp(Ordered_Pvalues{i,4},'Accept')
        pos = pos + 1;
        % Extract string for label
        sign_lesionvol{pos,1} = extractBefore(Ordered_Pvalues{i,1},' GM Lesion Vol');
        sign_lesionvol{pos,1} = strrep(sign_lesionvol{pos,1},'_',' ');
    end
end

clear i pos

%% Plot single coefficients

% Extract data to create plots
for i = 1:length(lm_data)
    
    % Extract string for label
        all_tract{i,1} = lm_data(i).Tract;
        % Replace underscores
        all_tract{i,1} = strrep(all_tract{i,1},'_',' ');
        
        % Tract damage
        all_data(i,1) = lm_data(i).Coefs(3,1).Estimate;
        all_err(i,1) = (lm_data(i).Coefs(3,6).UpperCI - lm_data(i).Coefs(3,5).LowerCI)/2;
        
        % Lesion Side
        all_data(i,2) = lm_data(i).Coefs(2,1).Estimate;
        all_err(i,2) = (lm_data(i).Coefs(2,6).UpperCI - lm_data(i).Coefs(2,5).LowerCI)/2;
           
end

% Plot Tract Damage
figure
hold on

y = linspace(19.75,0.5,23);
y = y'; % flip data

e = errorbar(all_data(:,1),y,all_err(:,1),'.','horizontal','MarkerSize',10);

% Modify colours
        set(e(1),'Color',[0.5 0.5 0.5])
        
% Deal with axes
        yticks(0.5:0.875:19.75)
        yticklabels(flip(all_tract,1))
        ylim([0,20.5])

        %xticks(-0.4:0.2:0.7)
        %xlim([-0.4,0.8])
        xlabel('z score (Tract Damage)')
        
% Add zero line
        x1 = [0 0];
        y1 = [0 length(all_data)+1];
        plot(x1,y1,'k--')
       
        
% Plot Lesion Side
figure
hold on

y = linspace(19.75,0.5,23);
y = y'; % flip data

e = errorbar(all_data(:,2),y,all_err(:,2),'.','horizontal','MarkerSize',10);

% Modify colours
        set(e(1),'Color',[0.5 0.5 0.5])
        
% Deal with axes
        yticks(0.5:0.875:19.75)
        yticklabels(flip(all_tract,1))
        ylim([0,20.5])

        %xticks(-0.4:0.2:0.7)
        %xlim([-0.4,0.8])
        xlabel('z score (Lesion Side)')
        
% Add zero line
%         x1 = [0 0];
%         y1 = [0 length(all_data)+1];
%         plot(x1,y1,'k--')

clear i e x1 y y1