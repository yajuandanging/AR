%data=importdata(strcat(pwd,'/train.txt'));
temp=importdata('C:\a.txt');
data=temp(:,2);
p=30;
%using the length of data  is p ,train and compute the coefficients
valdata=data(length(data)-3*p+1:length(data)-2*p);                 %remain the last p,validate w
valdata=guiyi(valdata);      
traindata=data(length(data)-2*p+1:length(data)-p);                 %remain the last p,compute codfficients
traindata=guiyi(traindata);                                         %data      pretreat 
[m,refl]=ar(traindata,p,'burg','ppw');                             % keep the coefficient in m 
 n=5;                                                               % the length of lookachead span n 
 data1=[traindata;zeros(n,1)];
 pre_data=predict(m,data1,n); 
 l=length(pre_data{1,1});
 pre = pre_data{1,1}(l-n+1:l);
 %w������ֵ��ȷ��
 Woptimal=optimal(traindata,n,m,p);                            %ѡ�����ŵ�w
 %�������ŵ�Wȷ�����Ŵ���
for i =1 : n
a=[traindata(1:p);pre(1:i)];                                 %ԭʼ���ݼ���Ԥ������
sigma=std(a); 
Mean=mean(a);                                               %����
q=0.96;                                                     % check the table of the normal distribution 
L(i)=0.5*sigma*q/sqrt(Woptimal+n);                                          
al(i)=Mean-0.5*L(i);                                              %al(i) is the lower end of confidence window
au(i)=Mean+0.5*L(i);                                              %au(i) is the upper end of confidence window 

end


