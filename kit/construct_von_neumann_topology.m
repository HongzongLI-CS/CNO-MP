function [topo_list] = construct_von_neumann_topology(nn_number)
factors =[];
k=1;
for i=2:round(nn_number/2)
    if (mod(nn_number,i)==0)
        factors(k)=i;
        k=k+1;
    end
end

ring=0;
if isempty(factors)
    a=nn_number;
    b=1;
    ring=1;
elseif mod(length(factors),2)==0
    a=factors(length(factors)/2+1);
    b=factors(length(factors)/2);
else
    a=factors(ceil(length(factors)/2));
    b=a;
end

if ring==0
    topo_list=zeros(nn_number,4);
    for i=1:nn_number
        if mod(i,a)==1 %列号
            topo_list(i,1:2)=[i+1,(floor(i/a)+1)*a];
        elseif mod(i,a)==0 %最后一列
            topo_list(i,1:2)=[(floor(i/a)-1)*a+1,i-1];
        else
            topo_list(i,1:2)=[i+1,i-1];
        end
        if ceil(i/a)==1
            topo_list(i,3:4)=[i+a,(b-1)*a+i];
        elseif ceil(i/a)==b
            topo_list(i,3:4)=[i-(b-1)*a,i-a];
        else
            topo_list(i,3:4)=[i+a,i-a];
        end
    end
else
    topo_list=zeros(nn_number,2);
    topo_list(1,1)=nn_number;
    topo_list(1,2)=2;
    for i=2:nn_number-1
        topo_list(i,1)=i-1;
        topo_list(i,2)=i+1;
    end
    topo_list(nn_number,1)=nn_number-1;
    topo_list(nn_number,2)=1;
end
end

