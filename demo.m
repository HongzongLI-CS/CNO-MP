addpath kit
%% load dataset
id= 19;
[data,r]=load_data_c(id);

%% hyper-parameters and \rho setting
N=2;
M= 2;
[rho] = set_rho(id);

%% CNO-MP
CNO_MPF(data,r,M,N,rho);
%% It is also optional to use default parameters
%CNO_MPF(data,r,M,N);
%CNO_MPF(data,r);