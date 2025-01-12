function [PE,MU,GE,GE_2] = u_criteria_pe_mu_ge(A,X,Y)
%%
UE=sum(sum(A));
EE=0;
[m,p]=size(A);
C=size(X,2);
for k=1:C
    for i=1:m
        for j=1:p
            EE=EE+A(i,j)*abs(X(i,k)-Y(k,j));
        end
    end
end
EE=EE/2;

PE=EE/UE;

%%
MU=(UE-EE)/sum((sum(X,1).*sum(Y,2)'));

%%
GE=0.5*MU+0.5*(1-EE/(m*p-sum((sum(X,1).*sum(Y,2)')) ) );

%%
VE=0;
for k=1:C
    for i=1:m
        for j=1:p
            VE=VE+(1-A(i,j))*X(i,k)*Y(k,j);
        end
    end
end
GE_2=(UE-EE)/(UE-VE);

if isinf(GE_2)
    disp('check')
end
end

