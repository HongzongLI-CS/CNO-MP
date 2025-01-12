function [data,r] = load_data_c(id)
if id==0
    %data=load('datasets/Srinavasan1990.txt');    
elseif id==1
    data=load('datasets/King1982.txt');    
    r=2;
elseif id==2
    data=load('datasets/Waghodekar1984a.txt');    
    r=2;
elseif id==3
    data=load('datasets/Waghodekar1984b.txt');    
    r=2;
elseif id==4
    data=load('datasets/Mosier1985.txt');    
    r=3;
elseif id==5
    data=load('datasets/Chan1982.txt');    
    r=3;
elseif id==6
    data=load('datasets/Kusiak1987.txt');    
    r=2;
elseif id==7
    data=load('datasets/Chandrasekharan1986.txt');    
    r=3;
elseif id==8
    data=load('datasets/Srinavasan1990.txt');    
    r=4;
elseif id==9
    data=load('datasets/Kumar1986.txt');    
    r=2;
elseif id==10
    data=load('datasets/Chandrasekharan1989a.txt');    
    r=7;
elseif id==11
    data=load('datasets/Chandrasekharan1989b.txt');    
    r=7;
elseif id==12
    data=load('datasets/Chandrasekharan1989c.txt');    
    r=7;
elseif id==13
    data=load('datasets/Chandrasekharan1989d.txt');    
    r=7;
elseif id==14
    data=load('datasets/Chandrasekharan1989e.txt');    
    r=7;
elseif id==15    
    data=load('datasets/Chandrasekharan1989f.txt');    
    r=7;
elseif id==16
    data=load('datasets/Chandrasekharan1989g.txt');    
    r=7;
elseif id==17    
    data=load('datasets/Kumar1987.txt');    
    r=2;
elseif id==18
    data=load('datasets/Kumar1987.txt');    
    r=3;
elseif id==19    
    data=load('datasets/Chandrasekharan1987.txt');    
    r=10;
end
%writematrix(data,[cd,'\baselines\Zh\problem_',num2str(id),'_v.txt'],'Delimiter','\t')
end