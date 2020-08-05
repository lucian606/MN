function [A_k S] = task3(image, k)
  %TODO
  A=double(imread(image));
  [m n]=size(A);
  for i=1:m
    u(i)=sum(A(i,:))/n;
  endfor
  for i=1:m
    A(i,:)=A(i,:)-u(i);
  endfor
  Z=(A')/sqrt(n-1);
  [U,S,V]=svd(Z);
  for j=1:k
    W(:,j)=V(:,j);
  endfor
  Y=W'*A;
  A_k=(W*Y)+u';
endfunction