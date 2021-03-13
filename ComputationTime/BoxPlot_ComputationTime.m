clc;
%define C1 C2 C3 C4
%define T1 T2 T3 T4
%C = [C1; C2; C3; C4];
%T= [T1; T2; T3; T4];
boxplot(T,C)
xlabel('Classifier')
ylabel('Computation Time ( Unit: seconds)') 