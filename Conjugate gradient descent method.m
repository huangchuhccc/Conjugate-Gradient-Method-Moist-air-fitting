beta=zeros(11,1);%为循环内的变量事先开辟内存，提高运行速度


%第一步迭代按照最速下降法
theta(:,1)=zeros(5,1);%为θ选择初始值，我们把初始θ全部设为0
[cost(1),g(:,1),hess]=costfunction(initialtheta);  %计算代价函数、梯度、海森阵
d(:,1)=-g(:,1);
lambda(1)=-(g(:,1)'*d(:,1))/(d(:,1)'*hess*d(:,1));
theta(:,2)=initialtheta+lambda(1)*d(:,1);   

%第二步开始按照FR共轭梯度法迭代。
[cost(2),g(:,2),hess]=costfunction(theta(:,2));
beta(1)=(norm(g(:,2)))^2/(norm(g(:,1)))^2;
d(:,2)=-g(:,2)+beta(1)*d(:,1);
lambda(2)=-(g(:,2)'*d(:,2))/(d(:,2)'*hess*d(:,2));
theta(:,3)=theta(:,2)+lambda(2)*d(:,2);

%若一次迭代后精度仍不合格，再进行固定迭代次数为47次的FR步骤，最终输出结果
for i=3:50
    [cost(i),g(:,i),hess]=costfunction(theta(:,i));
    beta(i-1)=(norm(g(:,i)))^2/(norm(g(:,i-1)))^2;
    d(:,i)=-g(:,i)+beta(i-1)*d(:,i-1); 
    lambda(i)=-(g(:,i)'*d(:,i))/(d(:,i)'*hess*d(:,i));
    theta(:,i+1)=theta(:,i)+lambda(i)*d(:,i);
end