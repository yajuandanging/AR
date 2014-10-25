% temp=importdata('C:\a.txt');
% data=temp(:,2);
data=importdata(strcat(pwd,'/train.txt'));
p=30;
%using the length of data  is p ,train and compute the coefficients
traindata=data(length(data)-2*p+1:length(data)-p);                 %remain the last p,compute codfficients
traindata=guiyi(traindata);                                         %data      pretreat 
[m,refl]=ar(traindata,p,'burg','ppw');                             % keep the coefficient in m 

n=5;                                                              % the length of lookachead span n
Woptimal=optimal (traindata,n,m);   
data1=[traindata;zeros(n,1)];
pre_data=predict(m,data1,n); 
 l=length(pre_data{1,1});
 pre = pre_data{1,1}(l-n+1:l);
 
for i =1 : n
% a(i)=[zeros(p+i,1)];
a(:,i)=[traindata(1:p);pre(1:n)];  
  Mean=mean(a(:,i));
  sigma=std(a(:,i));
  q=0.96;                                                       % check the table of the normal distribution 
  L=0.5*sigma*q/sqrt(w+n);
 al(i)=Mean-0.5*L;                                              %al(i) is the lower end of confidence window
 au(i)=Mean+0.5*L;                                              %au(i) is the upper end of confidence window 
 end
% W=[1,5,10,20,40,60,80];                                         %%candidate history interval w
% Aw=zeros(7,1) ;                                                 % store the acceptable w, n is the number of acceptable w



