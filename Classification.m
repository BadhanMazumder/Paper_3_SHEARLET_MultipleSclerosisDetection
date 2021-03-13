clc;close all;

X= readtable('EntropyFeatures.xlsx');
%tic
LR=logisticRegression10fold(X);
%toc
DT=DecTree10fold(X);
SVM=svm10fold(X);
KNN=kNN10fold(X);

