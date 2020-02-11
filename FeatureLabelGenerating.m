%This piece of code extract features from 
%'recs2009_public_codebook.xlsx' and 'recs2009_public.csv'
% The selected fearture must satisfy the following conditions:
% it is not categorical data
% it is numerical data
% it's correlation coefficient with KWH is greater than 0.3
% This piece of code produce 10 feature matices and 10 lable matrices
% Ex: Feature1.mat has Y1.mat as lable matix
F = readtable('recs2009_public_codebook.xlsx');
F=F(3:942,:);
f =table2array(F);
f=f(:,3);
[selr,selc]=find(~cellfun(@isempty,f));
T = readtable('recs2009_public.csv');
T(:,selr.')=[];
S = vartype('numeric');
t=T(:,S);
kwh_index=find(strcmpi(t.Properties.VariableNames,'KWH'));
A=table2array(t);
R = corrcoef(A);
r1=R(:,kwh_index);
[nan_row, col] = find(isnan(r1));
[zero_row,zero_col]=find(abs(r1)<0.3);
row=union(nan_row,zero_row);
t(:,row.') = []; 
y=table2array(t(:,'KWH'));
t(:,'KWH')=[];
x=table2array(t);
[r,c]=size(y);
par=floor(r/10);
extra=r-par*10;
split=[extra+par,par,par,par,par,par,par,par,par,par];
cx=mat2cell(x,split);
cy=mat2cell(y,split);
Y1=cy{1}.';
Feature1=cx{1};
Y2=cy{2}.';
Feature2=cx{2};
Y3=cy{3}.';
Feature3=cx{3};
Y4=cy{4}.';
Feature4=cx{4};
Y5=cy{5}.';
Feature5=cx{5};
Y6=cy{6}.';
Feature6=cx{6};
Y7=cy{7}.';
Feature7=cx{7};
Y8=cy{8}.';
Feature8=cx{8};
Y9=cy{9}.';
Feature9=cx{9};
Y10=cy{10}.';
Feature10=cx{10};
save( 'Feature1.mat', 'Feature1')
save( 'Y1.mat', 'Y1')

save( 'Feature2.mat', 'Feature2')
save( 'Y2.mat', 'Y2')

save( 'Feature3.mat', 'Feature3')
save( 'Y3.mat', 'Y3')

save( 'Feature4.mat', 'Feature4')
save( 'Y4.mat', 'Y4')

save( 'Feature5.mat', 'Feature5')
save( 'Y5.mat', 'Y5')

save( 'Feature6.mat', 'Feature6')
save( 'Y6.mat', 'Y6')

save( 'Feature7.mat', 'Feature7')
save( 'Y7.mat', 'Y7')

save( 'Feature8.mat', 'Feature8')
save( 'Y8.mat', 'Y8')

save( 'Feature9.mat', 'Feature9')
save( 'Y9.mat', 'Y9')

save( 'Feature10.mat', 'Feature10')
save( 'Y10.mat', 'Y10')