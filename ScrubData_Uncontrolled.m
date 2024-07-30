% This script will clean the data set

%% Check for columns with no non-zero elements
[l,w] = size(all_lesions);
del_store = [];

for col = 1:w
    
    non_zeros(1,col) = nnz(all_lesions(:,col));
    
    if nnz(all_lesions(:,col)) < 25
        
        display(['Less than 10% of entries for column ', num2str(col),'. Remove data for ',labels{1,col+1}])
        
        del_store(end+1,1) = col;
        
        %all_lesion_data = removevars(all_lesion_data,labels{1,col+1});
        %all_lesion_data = removevars(all_lesion_data,labels{1,col+38});
        
    end
    
end

%% Repeat for left and right independently
[l,w] = size(l_lesions);


for col = 1:w
    
    non_zeros(1,col) = nnz(l_lesions(:,col));
    
    if nnz(l_lesions(:,col)) < 25
        
        display(['Less than 25 entries in the left for column ', num2str(col),' (',labels{1,col+1},')'])
                
    end
    
end


[l,w] = size(r_lesions);


for col = 1:w
    
    non_zeros(1,col) = nnz(r_lesions(:,col));
    
    if nnz(r_lesions(:,col)) < 25
        
        display(['Less than 25 entries in the right for column ', num2str(col),'( ',labels{1,col+1},')'])
                
    end
    
end

%% Delete things 

a = numel(del_store);
for i = a:-1:1
    all_lesions(:,del_store(i,1)) = [];
    stnd_data(:,del_store(i,1)) = [];
    
    labels(:,del_store(i,1)+38) = [];
end

for i = a:-1:1    
    labels(:,del_store(i,1)+1) = [];
end


% display('Check remaining columns all have non-zero elements')
% 
% [l,w] = size(all_lesions);
%     
% for col = 1:w
%     
%     if nnz(all_lesions(:,col)) < 27
%         
%        	display(['Less than 10% of entries for column ', num2str(col)])
%         
%     else display(['Column ',num2str(col),' has entries for more than 10% of participants'])
%         
%     end
%     
% end

clear i l w col del_store a 

%% Check for correlations between variables
clc

% Run correlations
[r_unit,p_unit] = corrcoef(all_lesions);
% Remove first row and column as this is Task Score
r_unit(1,:) = []; r_unit(:,1) = [];
p_unit(1,:) = []; p_unit(:,1) = [];

% Calculate mean coefficient for each variable
mean_coef = [];

for col = 1:33
    
    values = [abs(r_unit(1:col-1,col)); abs(r_unit(col+1:end,col))];
    mean_coef(1,col) = mean(values);
    tract{1,col} = labels{1,col+2};
    
end
mean_coef = num2cell(mean_coef);
var_mean_coef = [tract ; mean_coef];

clear mean_coef values tract col row

% Find significant pairs
signif_pairs = [];
for row = 1:33
    
    for col = row+1:33
        
        if r_unit(row,col) > 0.7 && p_unit(row,col) < 0.05
            
            %display(['Significant correlation between row ',num2str(row),' and column ',num2str(col)])
            display(['Significant correlation between ',labels{1,row+2},' (Mean coef = ',num2str(var_mean_coef{2,row}),' and ',labels{1,col+2},' (Mean coef = ',num2str(var_mean_coef{2,col})])
            
            % Store significant pairs
            signif_pairs(end+1,1) = row;
            signif_pairs(end,2) = col;
            signif_pairs(end,3) = r_unit(row,col);
            
        end
                    
    end
    
end

