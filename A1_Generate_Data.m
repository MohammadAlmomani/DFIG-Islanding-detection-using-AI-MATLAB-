clear all
clc
Fnom=50;
Ts_Power=1/(33*Fnom)/100;
Ts=Ts_Power;
Ts_Control=10*Ts_Power;
model='DFIG_System';
load_system(model)
warning off;
sampling=1/50/64;
load('DFIG_init.mat');init=xInitial;
%%
k=1;
I=100;L1=0;L2=100;
P_Load=6e6;
for i=1:11
    Ql_Load=2e6+1;Qc_Load=1;
    for j=1:5
        sim(model);
        Data{1,k}.Local=Local(5761:7040,:);
        Data{1,k}.PMU=PMU(91:110,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_Load-9e6,(Ql_Load-1)-(Qc_Load-1)]./10e6*100;
        k=k+1;
        Ql_Load=Ql_Load-0.4e6;
    end
    Ql_Load=1;
    for j=1:6
        sim(model);
        Data{1,k}.Local=Local(5761:7040,:);
        Data{1,k}.PMU=PMU(91:110,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_Load-9e6,(Ql_Load-1)-(Qc_Load-1)]./10e6*100;
        k=k+1;
        Qc_Load=Qc_Load+0.4e6;
    end
    P_Load=P_Load+0.6e6;
end
save('Data','Data')
% %%
%% 
I=100;L1=100;L2=0;
P_Load=6e6;
for i=11:11
    Ql_Load=2e6+1;Qc_Load=1;
    for j=1:5
        sim(model);
        Data{1,k}.Local=Local(5761:7040,:);
        Data{1,k}.PMU=PMU(91:110,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_Load-9e6,(Ql_Load-1)-(Qc_Load-1)]./10e6*100;
        k=k+1;
        Ql_Load=Ql_Load-0.4e6;
    end
    Ql_Load=1;
    for j=1:6
        sim(model);
        Data{1,k}.Local=Local(5761:7040,:);
        Data{1,k}.PMU=PMU(91:110,:);
        Data{1,k}.status=0;
        Data{1,k}.dP=[P_Load-9e6,(Ql_Load-1)-(Qc_Load-1)]./10e6*100;
        k=k+1;
        Qc_Load=Qc_Load+0.4e6;
    end
    P_Load=P_Load+0.6e6;
end

Data{1,1}.Event=['LOAD UP THEN LOAD DOWN'];
Data{1,1}.DisctiptionPMU=['Vlocal  ROCOVlocal PH_Vlocal F_local ROCOF_local Vload  ROCOVload PH_Vload F_load ROCOF_load VPCC  ROCOVPCC  PH_VPCC  F_PCC  ROCOF_PCC '];
Data{1,1}.DisctiptionLocal=['Va Va Vc ROCOVa ROCOVb ROCOVc PH_Va PH_Vb PH_Vc Ia Ia Ic ROCOIa ROCOIb ROCOIc PH_Ia PH_Ib PH_Ic THD_Va THD_Vb THD_Vc THD_Ia THD_Ib THD_Ic P ROCOP Q ROCOQ F ROCOF'];
save('Data','Data')
%%
clear all
clc
Fnom=50;
Ts_Power=1/(33*Fnom)/100;
Ts=Ts_Power;
Ts_Control=10*Ts_Power;
model='DFIG_System';
load_system(model)
warning off;
sampling=1/50/64;
load('DFIG_init.mat');init=xInitial;
load('Data.mat')

I=0;L1=100;L2=100;k=1;
P_Load=6e6;
for i=1:22
    Ql_Load=2e6+1;Qc_Load=1;
    for j=1:5
        sim(model);
        Data{2,k}.Local=Local(5761:7040,:);
        Data{2,k}.PMU=PMU(91:110,:);
        Data{2,k}.status=1;
        Data{2,k}.dP=[P_Load-9e6,(Ql_Load-1)-(Qc_Load-1)]./10e6*100;
        k=k+1;
        Ql_Load=Ql_Load-0.4e6;
    end
    Ql_Load=1;
    for j=1:6
        sim(model);
        Data{2,k}.Local=Local(5761:7040,:);
        Data{2,k}.PMU=PMU(91:110,:);
        Data{2,k}.status=1;
        Data{2,k}.dP=[P_Load-9e6,(Ql_Load-1)-(Qc_Load-1)]./10e6*100;
        k=k+1;
        Qc_Load=Qc_Load+0.4e6;
    end
    P_Load=P_Load+0.3e6;
end
Data{2,1}.Event=['Islanding'];
save('Data','Data')
%%