function [jval,gradient,hess] = costfunction(theta)
%代价函数、梯度、海森阵代码
t=xlsread('t2.xlsx');
p=xlsread('ps2'); 
t2=t.*t;
t3=t2.*t;
t4=t3.*t;
t_1=t.^-1;%数据预处理
t_log=log(t);
m=91;
r=ones(91,1);
jval=(1/2*m)*sum(([r,t,t2,t3,t4]*theta-p).^2);

gradient=zeros(5,1);
gradient(1)=(1/m)*sum([r,t,t2,t3,t4]*theta-p);
gradient(2)=(1/m)*sum(([r,t,t2,t3,t4]*theta-p).*t);
gradient(3)=(1/m)*sum(([r,t,t2,t3,t4]*theta-p).*t2);
gradient(4)=(1/m)*sum(([r,t,t2,t3,t4]*theta-p).*t3);
gradient(5)=(1/m)*sum(([r,t,t2,t3,t4]*theta-p).*t4);

hess=zeros(5,5);
hess(1,1)=(1/m)*m;
hess(1,2)=(1/m)*sum(t);
hess(1,3)=(1/m)*sum(t2);
hess(1,4)=(1/m)*sum(t3);
hess(1,5)=(1/m)*sum(t4);

hess(2,1)=(1/m)*sum(t);
hess(2,2)=(1/m)*sum(t2);
hess(2,3)=(1/m)*sum(t3);
hess(2,4)=(1/m)*sum(t4);
hess(2,5)=(1/m)*sum(t4.*t);

hess(3,1)=(1/m)*sum(t2);
hess(3,2)=(1/m)*sum(t3);
hess(3,3)=(1/m)*sum(t4);
hess(3,4)=(1/m)*sum(t4.*t);
hess(3,5)=(1/m)*sum(t4.*t2);

hess(4,1)=(1/m)*sum(t3);
hess(4,2)=(1/m)*sum(t4);
hess(4,3)=(1/m)*sum(t4.*t);
hess(4,4)=(1/m)*sum(t4.*t2);
hess(4,5)=(1/m)*sum(t4.*t3);

hess(5,1)=(1/m)*sum(t4);
hess(5,2)=(1/m)*sum(t4.*t);
hess(5,3)=(1/m)*sum(t4.*t2);
hess(5,4)=(1/m)*sum(t4.*t3);
hess(5,5)=(1/m)*sum(t4.*t4);
end
