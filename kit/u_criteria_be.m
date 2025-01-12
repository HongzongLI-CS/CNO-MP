function [BE] = criteria_be(A)
BE=0;
[m,p]=size(A);
for i=1:m-1
    for j=1:p
        BE=BE+A(i,j)*A(i+1,j);
    end
end

for i=1:m
    for j=1:p-1
        BE=BE+A(i,j)*A(i,j+1);
    end
end
end

