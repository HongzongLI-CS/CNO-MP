function [data,n,m,r,dim,diversity_threshold,mutation_rate,neurodynamic_model] = load_data_BMm_fs(data,r,rho,N)

diversity_threshold=0.004;
mutation_rate=0.01;

[n,m]=size(data);
dim=(n+m)*r;

data2=2*data;

T0=rho*(r-1.5)*(1/log(r));
neurodynamic_model= @(x)u_BMm_fs(data,data2,rho,x,N,n,m,r,T0);

end