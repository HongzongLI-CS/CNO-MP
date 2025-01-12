function [data_hat] = u_XY2data_hat(data,X,Y)
data_hat=ones(size(data,1),size(data,2));
row_number=[];
for i=1:size(X,2)
    row_number=[row_number; find(X(:,i)==1)];
end
colomn_number=[];
for i=1:size(Y,1)
    colomn_number=[colomn_number, find(Y(i,:)==1)];
end

for i=1:length(row_number)
    for j=1:length(colomn_number)        
        if data(row_number(i),colomn_number(j))==1
            data_hat(i,j)=0;
        end        
    end
end
end