function [data_hat,BE,PE,MU,GE,GE_2]=CNO_MPF(data,r,M,N,rho)
if nargin<5
    % default parameters
    rho=2;
end
if nargin<3
    % default parameters
    M=20;
    N=10;
end

rng(2)

[topo_list] = construct_von_neumann_topology(N);

[data,n_p,m_p,r,n,diversity_threshold,mutation_rate,neurodynamic_model] = load_data_BMm_fs(data,r,rho,N);

w=1;c1=2;c2=2;

x=round(rand(n,N));
v=unifrnd(-1,1,n,N);

pbestx=zeros(n,N);
pbest=1e10*ones(1,N);
lbestx=zeros(n,N);
lbest=1e10*ones(1,N);
gbest=1e10;
all_best=[];
m=0;
initial_x=x;
while m<M
    [x,f_x] = neurodynamic_model(initial_x);
    bc=f_x<pbest;
    pbestx(:,bc)=   x(:,bc);
    pbest(1,bc)=  f_x(1,bc);
    
    for i=1:N
        [min_v,min_i]=min(pbest(topo_list(i,:)));
        if min_v<lbest(i)
            lbest(i)=min_v;
            lbestx(:,i)=pbestx(:,topo_list(i,min_i));
        end
    end
    [~,pc]=min(pbest(1,:));
    if pbest(1,pc)<gbest
        gbest=pbest(1,pc);
        gbestx=pbestx(:,pc);
        m=0;
        fprintf('objective function is updated: %0.8f\n',gbest)
    else
        m=m+1;
    end
    all_best=[all_best,gbest];
    
    Div=sum(sqrt(sum((x-gbestx).^2, 1)))/(N*n);
    v=w*v+c1*rand(1,N).*(pbestx-initial_x)+c2*rand(1,N).*(lbestx-initial_x);
    probability=1./(1.+exp(-v));
    zero_set=probability<rand(n,N);
    initial_x(~zero_set)=1;
    initial_x(zero_set)=0;
    %% mutation
    if Div<diversity_threshold
        all_best=[all_best,NaN];
        disp('mutation')
        mask=round(rand(n,N)/(2*(1-mutation_rate)));
        initial_x(mask==1)=~initial_x(mask==1);
    end
end

X=gbestx(1:n_p*r,1);
X=reshape(X,n_p,[]);
Y=gbestx(n_p*r+1:end,1);
Y=reshape(Y,[],m_p);
[data_hat]=u_XY2data_hat(data,X,Y);
[BE] = u_criteria_be(~data_hat);
[PE,MU,GE,GE_2] = u_criteria_pe_mu_ge(data,X,Y);


% Display metrics
fprintf('\n-----------------------------------------criteria values-----------------------------------------\n');
fprintf('BE: %.4f\n', BE);
fprintf('PE: %.4f\n', PE);
fprintf('MU: %.4f\n', MU);
fprintf('GE: %.4f\n', GE);
fprintf('GE_2: %.4f\n', GE_2);

% Plot data_hat matrix
figure;
imagesc(data_hat);
colorbar;
title('Permuted machine-part incidence matrix');
xlabel('Parts', 'FontWeight', 'bold');
ylabel('Machines', 'FontWeight', 'bold');
set(gca, 'FontSize', 15);
set (gcf,'Position',[701,273,818,420])

end