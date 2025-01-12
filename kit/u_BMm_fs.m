function [xy,f_x]=u_BMm_fs(V,V2,rho,xy,N,n,m,r,T0)
f_x=zeros(1,N);

for ip=1:N
    X=xy(1:n*r,ip);
    X=reshape(X,n,[]);
    Y=xy(n*r+1:end,ip);
    Y=reshape(Y,[],m);
    u_x=zeros(n,r);
    u_y=zeros(r,m);
    
    
    for it=1:10000
        T=T0*0.5^(it);
        
        ux_temp=sum(Y,2)'-V2*Y'+rho*(sum(X,2)-X-0.5);
        u_x=u_x+ux_temp;
        
        uy_temp=sum(X)'-X'*V2+rho*(sum(Y)-Y-0.5);
        u_y=u_y+uy_temp;
        
        probability_x = 1./( 1.+exp( u_x./T ) );
        zero_set=probability_x<rand(n,r);
        X(~zero_set)=1;
        X(zero_set)=0;
        probability_y = 1./( 1.+exp( u_y./T ) );
        zero_set=probability_y<rand(r,m);
        Y(~zero_set)=1;
        Y(zero_set)=0;
        
        if sum(abs(sum(Y)-1))==0&&sum(abs(sum(X,2)-1))==0
            break;
        end
                
    end
    
    if sum(abs(sum(Y)-1))~=0||sum(abs(sum(X,2)-1))~=0
        y_c=find(sum(Y)~=1);
        for i=y_c
            temp=u_y(:,i);
            Y(:,i)=rand_min(temp);
        end
        
        x_c=find(sum(X,2)~=1);
        for i=x_c'
            temp=u_x(i,:);
            X(i,:)=rand_min(temp);
        end
    end
    
    xy(1:n*r,ip)=reshape(X,n*r,1);
    xy(n*r+1:end,ip)=reshape(Y,m*r,1);
    obj=norm(V-X*Y,'fro')^2;
    f_x(ip)=obj;
end
end

function [min_index]=rand_min(temp)
min_index=zeros(length(temp),1);
min_i=find(temp==min(temp));
min_index(min_i(randi(length(min_i))),1)=1;
end