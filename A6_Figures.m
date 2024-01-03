clear
clc
load ('Results')
load ('Info2')

%% Table 3-7  number of samples 
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
for i=1:10
[A(i), T1, O1,dd] = Accurecy(T,O,O,i);
Islanding_Events(i,1)=sum(T1');
Non_Islanding_Events(i,1)=numel(T1)-sum(T1');
total(i,1)=numel(T1);
end

Table=[Islanding_Events,Non_Islanding_Events,total];
%% Scatter
figure (1) 
Data=Info2.Feature{1}.PCAL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('PCA')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('PCA')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('PCA')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('PCA')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2) 
Data=Info2.Feature{1}.LDAL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('LDA')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('LDA')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('LDA')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('LDA')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (3) 
Data=Info2.Feature{1}.MDSL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('MDS')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('MDS')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('MDS')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('MDS')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (4) 
Data=Info2.Feature{1}.ProbPCAL2;Y=Info2.Y{1}; 
X1=Data(:,1);X2=Data(:,2);X3=Data(:,3);X4=Data(:,4);X5=Data(:,5);
subplot (221)
scatter (X1,X2,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 2')
title ('ProbPCA')

subplot (222)
scatter (X1,X3,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 3')
title ('ProbPCA')

subplot (223)
scatter (X1,X4,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 4')
title ('ProbPCA')

subplot (224)
scatter (X1,X5,5,Y)
grid on 
box on 
xlabel ('Vector 1')
ylabel ('Vector 5')
title ('ProbPCA')
%%
%%%%%%%%% ROC
close all
figure (1)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,dd] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(2), T1, O1,dd] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(3), T1, O1,dd] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(4), T1, O1,dd] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(5), T1, O1,dd] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,dd] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(2), T1, O1,dd] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(3), T1, O1,dd] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(4), T1, O1,dd] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(5), T1, O1,dd] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A(1), T1, O1,dd] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(2), T1, O1,dd] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(3), T1, O1,dd] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(4), T1, O1,dd] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(5), T1, O1,dd] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,dd] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,dd] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,gg] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,dd] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,dd] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('KNN-ProbPCA ')
grid on
box on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,dd] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(5), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.SVM{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('SVM-ProbPCA ')
grid on
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (3)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.Tree{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('DT-ProbPCA ')
grid on
box on

%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (4)
subplot (221)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.PCAL2.Md.net;
Input1=Info2.Feature{1}.PCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));O=O';
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(5), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-PCA ')
grid on
box on

subplot (222)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.LDAL2.Md.net;
Input1=Info2.Feature{1}.LDAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));O=O';
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-LDA ')
grid on
box on

subplot (223)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.MDSL2.Md.net;
Input1=Info2.Feature{1}.MDSL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));O=O';
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*50,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-MDS ')
grid on
box on

subplot (224)
hold on
T=Info2.Y{1};
Md1=Results.ANN{1}.ProbPCAL2.Md.net;
Input1=Info2.Feature{1}.ProbPCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));O=O';
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('ANN-ProbPCA ')
grid on
box on
%% Accurecy 
close all
clear A
T=Info2.Y{1};
Md1=Results.ANN{1}.PCAL2.Md.net;
Input1=Info2.Feature{1}.PCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O',i);
end
ANN_PCA=nonzeros(A);
T=Info2.Y{1};
Md1=Results.ANN{1}.LDAL2.Md.net;
Input1=Info2.Feature{1}.LDAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O',i);
end
ANN_LDA=nonzeros(A);
T=Info2.Y{1};
Md1=Results.ANN{1}.MDSL2.Md.net;
Input1=Info2.Feature{1}.MDSL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O',i);
end
ANN_MDS=nonzeros(A);
T=Info2.Y{1};
Md1=Results.ANN{1}.ProbPCAL2.Md.net;
Input1=Info2.Feature{1}.ProbPCAL2;
y = Md1(Input1');
O = abs(1-(vec2ind(y)-1));
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O',i);
end
ANN_ProbPCA=nonzeros(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=Info2.Y{1};
Md1=Results.Tree{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
Tree_PCA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.Tree{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
Tree_LDA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.Tree{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
Tree_MDS=nonzeros(A);

T=Info2.Y{1};
Md1=Results.Tree{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
Tree_ProbPCA=nonzeros(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=Info2.Y{1};
Md1=Results.SVM{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
SVM_PCA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.SVM{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
SVM_LDA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.SVM{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
SVM_MDS=nonzeros(A);

T=Info2.Y{1};
Md1=Results.SVM{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
SVM_ProbPCA=nonzeros(A);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
KNN_PCA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
KNN_LDA=nonzeros(A);

T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
KNN_MDS=nonzeros(A);

T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
KNN_ProbPCA=nonzeros(A);
%
close all
figure (1)
hold on
t=1:2:10;
x1=SVM_PCA;x2=Tree_PCA;x3=KNN_PCA;x4=ANN_PCA;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('PCA')
legend ('SVM','DT','KNN','ANN')

figure (2)
hold on
x1=SVM_LDA;x2=Tree_LDA;x3=KNN_LDA;x4=ANN_LDA;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('LDA')
legend ('SVM','DT','KNN','ANN')


figure (3)
hold on
x1=SVM_MDS;x2=Tree_MDS;x3=KNN_MDS;x4=ANN_MDS;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('MDS')
legend ('SVM','DT','KNN','ANN')

figure (4)
hold on
x1=SVM_ProbPCA;x2=Tree_ProbPCA;x3=KNN_ProbPCA;x4=ANN_ProbPCA;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('ProbPCA')
legend ('SVM','DT','KNN','ANN')

% Table 3-8 Accurecy at cycle 7 
KNN3=[KNN_PCA(3),KNN_LDA(3), KNN_MDS(3), KNN_ProbPCA(3)];
KNN1=[KNN_PCA(1),KNN_LDA(1), KNN_MDS(1), KNN_ProbPCA(1)];
KNN2=[KNN_PCA(2),KNN_LDA(2), KNN_MDS(2), KNN_ProbPCA(2)];
KNN4=[KNN_PCA(4),KNN_LDA(4), KNN_MDS(4), KNN_ProbPCA(4)];
KNN5=[KNN_PCA(5),KNN_LDA(5), KNN_MDS(5), KNN_ProbPCA(5)];

% KNN=[KNN_PCA(3), KNN_MDS(3), KNN_ProbPCA(3)];
Table=[KNN1;KNN2;KNN3;KNN4;KNN5];
Table = round (Table*100)/100;
%%
%%%%%%% Confusion  
close all
% figure (1)
% hold on
T=Info2.Y{1};
% Md1=Results.SVM{1}.PCAL2.Md;
% Input1=Info2.Feature{1}.PCAL2;
% O=predict (Md1,Input1);
% [A, T1, O1] = Accurecy(T,O,5);
% C1=confusionmat(T1,O1);
% 
% Md1=Results.SVM{1}.MDSL2.Md;
% Input1=Info2.Feature{1}.MDSL2;
% O=predict (Md1,Input1);
% [A, T2, O2] = Accurecy(T,O,5);
% C2=confusionmat(T2,O2);
% 
% Md1=Results.SVM{1}.ProbPCAL2.Md;
% Input1=Info2.Feature{1}.ProbPCAL2;
% O=predict (Md1,Input1);
% [A, T3, O3] = Accurecy(T,O,5);
% C3=confusionmat(T3,O3);

Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);
[A, T1, O1,O0] = Accurecy(T,O,O,9);
C1=confusionmat(T1,O1);

Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);
[A, T2, O2,O0] = Accurecy(T,O,O,9);
C2=confusionmat(T2,O2);


Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);
[A, T2, O2,O0] = Accurecy(T,O,O,9);
C3=confusionmat(T2,O2);

Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);
[A, T3, O3,O0] = Accurecy(T,O,O,9);
C4=confusionmat(T3,O3);

% confusionchart(C,[0 1])
Islan=sum(T1);
Non_Islan=abs(sum(T1-1));
TN1=C1(1,1)/Non_Islan;FN1=C1(1,2)/Non_Islan;FP1=C1(2,1)/Islan;TP1=C1(2,2)/Islan;CP1=(TP1+TN1)/2;ICP1=(FP1+FN1)/2;
TN2=C2(1,1)/Non_Islan;FN2=C2(1,2)/Non_Islan;FP2=C2(2,1)/Islan;TP2=C2(2,2)/Islan;CP2=(TP2+TN2)/2;ICP2=(FP2+FN2)/2;
TN3=C3(1,1)/Non_Islan;FN3=C3(1,2)/Non_Islan;FP3=C3(2,1)/Islan;TP3=C3(2,2)/Islan;CP3=(TP3+TN3)/2;ICP3=(FP3+FN3)/2;
TN4=C4(1,1)/Non_Islan;FN4=C4(1,2)/Non_Islan;FP4=C4(2,1)/Islan;TP4=C4(2,2)/Islan;CP4=(TP4+TN4)/2;ICP4=(FP4+FN4)/2;
% TN5=C5(1,1)/Non_Islan;FN5=C5(1,2)/Non_Islan;FP5=C5(2,1)/Islan;TP5=C5(2,2)/Islan;CP5=(TP5+TN5)/2;ICP5=(FP5+FN5)/2;
% TN6=C6(1,1)/Non_Islan;FN6=C6(1,2)/Non_Islan;FP6=C6(2,1)/Islan;TP6=C6(2,2)/Islan;CP6=(TP6+TN6)/2;ICP6=(FP6+FN6)/2;

TABLE=round([TP1, TN1, FP1, FN1,CP1,ICP1;TP2, TN2, FP2, FN2,CP2,ICP2;...
    TP3, TN3, FP3, FN3,CP3,ICP3;TP4, TN4, FP4, FN4,CP4,ICP4]*10000)/100;
  
%% Performance Figures 
clear
clc
load ('Results')
load ('Info2')

T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2,O0] = Accurecy(T,O,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN1(k)=C2(1,1)/Non_Islan;FN1(k)=C2(1,2)/Non_Islan;FP1(k)=C2(2,1)/Islan;TP1(k)=C2(2,2)/Islan;%CP4(k)=(TP4+TN4)/2;ICP4(K)=(FP4+FN4)/2;
k=k+1;
end

T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2,O0] = Accurecy(T,O,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN2(k)=C2(1,1)/Non_Islan;FN2(k)=C2(1,2)/Non_Islan;FP2(k)=C2(2,1)/Islan;TP2(k)=C2(2,2)/Islan;%CP4(k)=(TP4+TN4)/2;ICP4(K)=(FP4+FN4)/2;
k=k+1;
end


Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2,O0] = Accurecy(T,O,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN5(k)=C2(1,1)/Non_Islan;FN5(k)=C2(1,2)/Non_Islan;FP5(k)=C2(2,1)/Islan;TP5(k)=C2(2,2)/Islan;%CP5(k)=(TP5+TN5)/2;ICP5(K)=(FP5+FN5)/2;
k=k+1;
end

Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);k=1;
for i=1:2:10
[A, T2, O2,O0] = Accurecy(T,O,O,i);
C2=confusionmat(T2,O2);
Islan=sum(T2);
Non_Islan=abs(sum(T2-1));
TN6(k)=C2(1,1)/Non_Islan;FN6(k)=C2(1,2)/Non_Islan;FP6(k)=C2(2,1)/Islan;TP6(k)=C2(2,2)/Islan;%CP6(k)=(TP6+TN6)/2;ICP6(K)=(FP6+FN6)/2;
k=k+1;
end
t=1:2:10;
%
close all
figure (1)
subplot (221)
hold on 
plot(t,TP1*100,'b-','LineWidth',2)
plot(t,TP2*100,'g:','LineWidth',2)
% plot(t,TP3*100,'r-.','LineWidth',2)
% plot(t,TP4*100,'c--','LineWidth',2)
plot(t,TP5*100,'m:','LineWidth',2)
plot(t,TP6*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 97 100])
xlabel ('Sampling (Cycles)')
ylabel ('TP(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (222)
hold on 
plot(t,TN1*100,'b-','LineWidth',2)
plot(t,TN2*100,'g:','LineWidth',2)
% plot(t,TN3*100,'r-.','LineWidth',2)
% plot(t,TN4*100,'c--','LineWidth',2)
plot(t,TN5*100,'m:','LineWidth',2)
plot(t,TN6*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 97 100])
xlabel ('Sampling (Cycles)')
ylabel ('TN(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')

subplot (223)
hold on 
plot(t,FP1*100,'b-','LineWidth',2)
plot(t,FP2*100,'g:','LineWidth',2)
% plot(t,FP3*100,'r-.','LineWidth',2)
% plot(t,FP4*100,'c--','LineWidth',2)
plot(t,FP5*100,'m:','LineWidth',2)
plot(t,FP6*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 0 3])
xlabel ('Sampling (Cycles)')
ylabel ('FP(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (224)
hold on 
plot(t,FN1*100,'b-','LineWidth',2)
plot(t,FN2*100,'g:','LineWidth',2)
% plot(t,FN3*100,'r-.','LineWidth',2)
% plot(t,FN4*100,'c--','LineWidth',2)
plot(t,FN5*100,'m:','LineWidth',2)
plot(t,FN6*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 0 3])
xlabel ('Sampling (Cycles)')
ylabel ('FN(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2)
subplot (221)
hold on 
plot(t,(TP1+TN1)/2*100,'b-','LineWidth',2)
plot(t,(TP2+TN2)/2*100,'g:','LineWidth',2)
% plot(t,(TP3+TN3)/2*100,'r-.','LineWidth',2)
% plot(t,(TP4+TN4)/2*100,'c--','LineWidth',2)
plot(t,(TP5+TN5)/2*100,'m:','LineWidth',2)
plot(t,(TP6+TN6)/2*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 97 100])
xlabel ('Sampling (Cycles)')
ylabel ('CP(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (222)
hold on 
plot(t,(FN1+FP1)/2*100,'b-','LineWidth',2)
plot(t,(FN2+FP2)/2*100,'g:','LineWidth',2)
% plot(t,(FN3+FP3)/2*100,'r-.','LineWidth',2)
% plot(t,(FN4+FP4)/2*100,'c--','LineWidth',2)
plot(t,(FN5+FP5)/2*100,'m:','LineWidth',2)
plot(t,(FN6+FP6)/2*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 0 3])
xlabel ('Sampling (Cycles)')
ylabel ('ICP(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')

subplot (223)
hold on 
plot(t,(TP1+TN1)./(FP1+FN1+TN1+TP1)*100,'b-','LineWidth',2)
plot(t,(TP2+TN2)./(FP2+FN2+TN2+TP2)*100,'g:','LineWidth',2)
% plot(t,(TP3+TN3)./(FP3+FN3+TN3+TP3)*100,'r-.','LineWidth',2)
% plot(t,(TP4+TN4)./(FP4+FN4+TN4+TP4)*100,'c--','LineWidth',2)
plot(t,(TP5+TN5)./(FP5+FN5+TN5+TP5)*100,'m:','LineWidth',2)
plot(t,(TP6+TN6)./(FP6+FN6+TN6+TP6)*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 97 100])
xlabel ('Sampling (Cycles)')
ylabel ('Accurecy(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')


subplot (224)
hold on 
plot(t,(FP1+FN1)./(FP1+FN1+TN1+TP1)*100,'b-','LineWidth',2)
plot(t,(FP2+FN2)./(FP2+FN2+TN2+TP2)*100,'g:','LineWidth',2)
% plot(t,(FP3+FN3)./(FP3+FN3+TN3+TP3)*100,'r-.','LineWidth',2)
% plot(t,(FP4+FN4)./(FP4+FN4+TN4+TP4)*100,'c--','LineWidth',2)
plot(t,(FP5+FN5)./(FP5+FN5+TN5+TP5)*100,'m:','LineWidth',2)
plot(t,(FP6+FN6)./(FP6+FN6+TN6+TP6)*100,'r-.','LineWidth',2)
grid on 
box on 
axis ([1 9 0 3])
xlabel ('Sampling (Cycles)')
ylabel ('Error(%)')
legend ('KNN-PCA','KNN-LDA','KNN-MDS','KNN-ProbPCA','Location','Best')

%% NDZ 
close all
figure (1)
subplot(221)
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,5);
[X,Y,Z]=Zcontourf(L2,L1,L3,5);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-PCA')
grid on 
box on
subplot(222)
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,5);
[X,Y,Z]=Zcontourf(L2,L1,L3,5);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-LDA')
grid on 
box on
subplot(223)
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,5);
[X,Y,Z]=Zcontourf(L2,L1,L3,5);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-MDS')
grid on 
box on

subplot(224)
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,5);
[X,Y,Z]=Zcontourf(L2,L1,L3,5);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-ProbPCA')
grid on 
box on


figure (2)
subplot(221)
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,6);
[X,Y,Z]=Zcontourf(L2,L1,L3,6);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-PCA')
grid on 
box on
subplot(222)
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,6);
[X,Y,Z]=Zcontourf(L2,L1,L3,6);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-LDA')
grid on 
box on
subplot(223)
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,6);
[X,Y,Z]=Zcontourf(L2,L1,L3,6);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-MDS')
grid on 
box on
subplot(224)
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,6);
[X,Y,Z]=Zcontourf(L2,L1,L3,6);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-ProbPCA')
grid on 
box on



figure (3)
subplot(221)
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,7);
[X,Y,Z]=Zcontourf(L2,L1,L3,7);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-PCA')
grid on 
box on
subplot(222)
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,7);
[X,Y,Z]=Zcontourf(L2,L1,L3,7);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-LDA')
grid on 
box on
subplot(223)
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,7);
[X,Y,Z]=Zcontourf(L2,L1,L3,7);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-MDS')
grid on 
box on
subplot(224)
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,7);
[X,Y,Z]=Zcontourf(L2,L1,L3,7);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-ProbPCA')
grid on 
box on



figure (4)
subplot(221)
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,8);
[X,Y,Z]=Zcontourf(L2,L1,L3,8);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-PCA')
grid on 
box on
subplot(222)
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,8);
[X,Y,Z]=Zcontourf(L2,L1,L3,8);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-LDA')
grid on 
box on
subplot(223)
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,8);
[X,Y,Z]=Zcontourf(L2,L1,L3,8);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-MDS')
grid on 
box on
subplot(224)
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,8);
[X,Y,Z]=Zcontourf(L2,L1,L3,8);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-ProbPCA')
grid on 
box on




figure (5)
subplot(221)
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,9);
[X,Y,Z]=Zcontourf(L2,L1,L3,9);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-PCA')
grid on 
box on
subplot(222)
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,9);
[X,Y,Z]=Zcontourf(L2,L1,L3,9);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-LDA')
grid on 
box on
subplot(223)
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,9);
[X,Y,Z]=Zcontourf(L2,L1,L3,9);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-MDS')
grid on 
box on
subplot(224)
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,9);
[X,Y,Z]=Zcontourf(L2,L1,L3,9);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-ProbPCA')
grid on 
box on





figure (6)
subplot(221)
T=Info2.Y{1};
Md1=Results.KNN{1}.PCAL2.Md;
Input1=Info2.Feature{1}.PCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,4);
[X,Y,Z]=Zcontourf(L2,L1,L3,4);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-PCA')
grid on 
box on
subplot(222)
T=Info2.Y{1};
Md1=Results.KNN{1}.LDAL2.Md;
Input1=Info2.Feature{1}.LDAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,4);
[X,Y,Z]=Zcontourf(L2,L1,L3,4);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-LDA')
grid on 
box on
subplot(223)
T=Info2.Y{1};
Md1=Results.KNN{1}.MDSL2.Md;
Input1=Info2.Feature{1}.MDSL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,4);
[X,Y,Z]=Zcontourf(L2,L1,L3,4);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-MDS')
grid on 
box on
subplot(224)
T=Info2.Y{1};
Md1=Results.KNN{1}.ProbPCAL2.Md;
Input1=Info2.Feature{1}.ProbPCAL2;
O=predict (Md1,Input1);Delt_P=Info2.dP{1};
[A, L1, L2,L3] = Accurecy(T,O,Delt_P,4);
[X,Y,Z]=Zcontourf(L2,L1,L3,4);
Z(find(Z==80))=100;
contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('KNN-ProbPCA')
grid on 
box on

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%PMU 
%%%%%%%%% ROC
clear
clc
load ('Results')
load ('InfoPMU')
close all
figure (1)
subplot (221)
hold on
T=InfoPMU.Output;
Md1=Results.SVM{1}.PMU.Md;
Input1=InfoPMU.Input;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-SVM ')
grid on
box on

subplot (222)
hold on
T=InfoPMU.Output;
Md1=Results.KNN{1}.PMU.Md;
Input1=InfoPMU.Input;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-KNN ')
grid on
box on

subplot (223)
hold on
T=InfoPMU.Output;
Md1=Results.Tree{1}.PMU.Md;
Input1=InfoPMU.Input;
O=predict (Md1,Input1);
[A(1), T1, O1,O0] = Accurecy(T,O,O,1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O,3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O,5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O,7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O,9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-DT ')
grid on
box on

subplot (224)
hold on
T=InfoPMU.Output;
Md1=Results.ANN{1}.PMU.net;
Input1=InfoPMU.Input;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
[A(1), T1, O1,O0] = Accurecy(T,O,O',1);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'b-','LineWidth',2)
[A(1), T1, O1,O0] = Accurecy(T,O,O',3);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'g:','LineWidth',2)
[A(2), T1, O1,O0] = Accurecy(T,O,O',5);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'r-.','LineWidth',2)
[A(3), T1, O1,O0] = Accurecy(T,O,O',7);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'c--','LineWidth',2)
[A(4), T1, O1,O0] = Accurecy(T,O,O',9);
[Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(T1,O1,1);
plot(Xsvm*100,Ysvm*100,'m:','LineWidth',2)
legend ('One cycles','Three cycles','Five cycles','Seven cycles','Nine cycles','Location','Best')
axis ([0 0.2 0 1]*100)
xlabel('False Alarm (%)')
ylabel ('Detection Rate (%)')
title ('PMU-ANN ')
grid on
box on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%% % %%  Accurecy
clear
clc
load ('Results')
load ('InfoPMU')
close all
figure (1)
subplot (221)
hold on
T=InfoPMU.Output;
Md1=Results.ANN{1}.PMU.net;
Input1=InfoPMU.Input;
y = Md1(Input1');O = abs(1-(vec2ind(y)-1));
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O',i);
end
ANN=nonzeros(A);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Md1=Results.Tree{1}.PMU.Md;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
Tree=nonzeros(A);
%%%%%%%%%%%%%%%%%%%
Md1=Results.SVM{1}.PMU.Md;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
SVM=nonzeros(A);
%%%%%%%%%%%%%%%%%%
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);
for i=1:2:10
[A(i), T1, O1,O0] = Accurecy(T,O,O,i);
end
KNN=nonzeros(A);
close all
figure (1)
hold on
t=1:2:10;
x1=SVM;x2=Tree;x3=KNN;x4=ANN;
plot (t,x1,'b-','LineWidth',2)
plot(t,x2,'g:','LineWidth',2)
plot(t,x3,'r-.','LineWidth',2)
plot(t,x4,'c--','LineWidth',2)
grid on 
box on 
xlabel ('sampling (cycle)')
ylabel('Accurecy (%)')
title ('Accurecy of PMU Model')
legend ('SVM','DT','KNN','ANN')


%% Confusion 
clear
clc
load ('Results')
load ('InfoPMU')
close all
T=InfoPMU.Output;
Input1=InfoPMU.Input;
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);
[A, T1, O1,O0] = Accurecy(T,O,O,1);
C1=confusionmat(T1,O1);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
TN1=C1(1,1)/Non_Islan;FN1=C1(1,2)/Non_Islan;FP1=C1(2,1)/Islan;TP1=C1(2,2)/Islan;CP1=(TP1+TN1)/2;ICP1=(FP1+FN1)/2;

[A, T1, O1,O0] = Accurecy(T,O,O,3);
C1=confusionmat(T1,O1);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
TN3=C1(1,1)/Non_Islan;FN3=C1(1,2)/Non_Islan;FP3=C1(2,1)/Islan;TP3=C1(2,2)/Islan;CP3=(TP3+TN3)/2;ICP3=(FP3+FN3)/2;

[A, T1, O1,O0] = Accurecy(T,O,O,5);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
C1=confusionmat(T1,O1);
TN5=C1(1,1)/Non_Islan;FN5=C1(1,2)/Non_Islan;FP5=C1(2,1)/Islan;TP5=C1(2,2)/Islan;CP5=(TP5+TN5)/2;ICP5=(FP5+FN5)/2;

[A, T1, O1,O0] = Accurecy(T,O,O,7);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
C1=confusionmat(T1,O1);
TN7=C1(1,1)/Non_Islan;FN7=C1(1,2)/Non_Islan;FP7=C1(2,1)/Islan;TP7=C1(2,2)/Islan;CP7=(TP7+TN7)/2;ICP7=(FP7+FN7)/2;

[A, T1, O1,O0] = Accurecy(T,O,O,9);
Islan=sum(T1);Non_Islan=numel(T1)-Islan;
C1=confusionmat(T1,O1);
TN9=C1(1,1)/Non_Islan;FN9=C1(1,2)/Non_Islan;FP9=C1(2,1)/Islan;TP9=C1(2,2)/Islan;CP9=(TP9+TN9)/2;ICP9=(FP9+FN9)/2;
%
figure1 = figure;
axes1 = axes('Parent',figure1);
bar([TP1,TN1,FP1,FN1;TP3,TN3,FP3,FN3;TP5,TN5,FP5,FN5;TP7,TN7,FP7,FN7;TP9,TN9,FP9,FN9]);
box(axes1,'on');
set(axes1,'XTick',[1 2 3 4 5],'XTickLabel',{'1','3','5','7','9'});
grid on
legend ('TP','TN','FP','FN','Location','Best')
xlabel ('sample (cycles)')
ylabel ('Rate of Classification')
title ('PMU-KNN')
Acc1=CP1./(CP1+ICP1);Acc3=CP3./(CP3+ICP3);Acc5=CP5./(CP5+ICP5);Acc7=CP7./(CP7+ICP7);Acc9=CP9./(CP9+ICP9);
E1=ICP1./(CP1+ICP1);E3=ICP3./(CP3+ICP3);E5=ICP5./(CP5+ICP5);E7=ICP7./(CP7+ICP7);E9=ICP9./(CP9+ICP9);

figure2 = figure;
axes1 = axes('Parent',figure2);
bar([CP1,Acc1,ICP1,E1;CP3,Acc3,ICP3,E3;CP5,Acc5,ICP5,E5;CP7,Acc7,ICP7,E7;CP9,Acc9,ICP9,E9]);
box(axes1,'on');
set(axes1,'XTick',[1 2 3 4 5],'XTickLabel',{'1','3','5','7','9'});
grid on
legend ('CP','Accuracy','ICP','Error','Location','Best')
xlabel ('sample (cycles)')
ylabel ('Rate of Classification')
title ('PMU-KNN')

%% NDZ

clear
clc
load ('Results')
load ('InfoPMU')
close all
subplot(221)
T=InfoPMU.Output;
Input1=InfoPMU.Input;
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);Delt_P=InfoPMU.P;
[A, T1, O1,P1] = Accurecy(T,O,Delt_P,5);
[X,Y,Z]=Zcontourf(O1,T1,P1,5);
Z(find(Z==80))=100;
  contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
%  contourf(X,Y,Z',2)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('PMU-KNN, Five Cycle')
grid on 
box on

subplot(222)
T=InfoPMU.Output;
Input1=InfoPMU.Input;
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);Delt_P=InfoPMU.P;
[A, T1, O1,P1] = Accurecy(T,O,Delt_P,6);
[X,Y,Z]=Zcontourf(O1,T1,P1,6);
Z(find(Z==80))=100;
  contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
%  contourf(X,Y,Z',2)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('PMU-KNN, Six Cycle')
grid on 
box on



subplot(223)
T=InfoPMU.Output;
Input1=InfoPMU.Input;
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);Delt_P=InfoPMU.P;
[A, T1, O1,P1] = Accurecy(T,O,Delt_P,7);
[X,Y,Z]=Zcontourf(O1,T1,P1,7);
Z(find(Z==80))=100;
  contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
%  contourf(X,Y,Z',2)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('PMU-KNN, Seven Cycle')
grid on 
box on



subplot(224)
T=InfoPMU.Output;
Input1=InfoPMU.Input;
Md1=Results.KNN{1}.PMU.Md;
O=predict (Md1,Input1);Delt_P=InfoPMU.P;
[A, T1, O1,P1] = Accurecy(T,O,Delt_P,8);
[X,Y,Z]=Zcontourf(O1,T1,P1,8);
Z(find(Z==80))=100;
  contour(X,Y,Z','LineColor',[0 0 0],'ShowText','on','LineStyle','-','LevelStep',5)
%  contourf(X,Y,Z',2)
xlabel ('Real Power imbalance(%)')
ylabel ('Reactive power imbalance(%)')
title ('PMU-KNN, Eight Cycle')
grid on 
box on