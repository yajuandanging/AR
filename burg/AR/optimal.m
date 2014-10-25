function Woptimal=optimal(traindata,n,m,p)         
W=[1,5,10,20,40,60];                           %%candidate history interval w
Aw=zeros(6,1) ;                                 % store the acceptable w, n is the number of acceptable w
count =0;
flag=0;
data1=[traindata;zeros(n,1)];
pre_data=predict(m,data1,n);                    %m is the AR's coefficients
l=length(pre_data{1,1});
pre = pre_data{1,1}(l-n+1:l);          %截取从预测的第一个数据开始的下标到最后的结尾
for j=1:6                  
for i =1 : n
  a=[traindata(1:p);pre(1:i)];                 %原始数据加上预测数据
  sigma=std(a);                                %方差
  q=0.96;                                                       % check the table of the normal distribution 
  L(j,i)=0.5*sigma*q/sqrt(W(j)+n);                                          
end
if (mean( L(j,:))<0.05)
      count =count+1 ;
      Aw(count)=W(j);    
end 
end 


if (count==0)
[ value,index]= min(mean( L'));
Woptimal=W(index);

else                % 挑选出使ＭＳＥ达到最小值的Wj做为返回值
 for j= 1:count 
  for i =1 : n
    b=[traindata(1:p);pre(1:i)];                               
    sigma=std(b); 
    Mean=mean(b);                                               %方差
    q=0.96;                                                     % check the table of the normal distribution 
    L(i)=0.5*sigma*q/sqrt(Aw(j)+n);                                          
    bl(i)=Mean-0.5*L(i);                                              %al(i) is the lower end of confidence window
    bu(i)=Mean+0.5*L(i);                                              %au(i) is the upper end of confidence window 
    lerror=abs(pre(i)-bl(i));
    uerror=abs(pre(i)-bu(i));
     if(bl(i)<pre(i)<bu(i)) 
         error(j,i)=0;
      else error(j,i)=min(lerror,uerror);
     end
  end
  MSE(j)=sum(error(j,:))/(1+n);               %计算error的错误
 end
 [value2,index2]=min(MSE);
 Woptimal=W(index2);
end
