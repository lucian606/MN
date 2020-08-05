function [A_k S] = task4(image, k)
   %TODO
  A=double(imread(image));
  [m n]=size(A);
  u=[];
  for i=1:m
    u(i)=sum(A(i,:))/n;
  endfor
  for i=1:m
    A(i,:)=A(i,:)-u(i);
  endfor
  Z=1/(n-1)*A*A';
  [V S]=eig(Z);
  for j=1:k
    W(:,j)=V(:,j);
  endfor
  Y=W'*A;
  A_k=(W*Y)+u';
endfunction