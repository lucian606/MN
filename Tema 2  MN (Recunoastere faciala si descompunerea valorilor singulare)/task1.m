function A_k = task1(image, k)
  %TODO
  matrice_imagine=double(imread(image));
  [u,s,v]=svd(matrice_imagine);
  x=s;
  x(k+1:end, :)=0;
  x(:,k+1:end)=0;
  A_k=u*x*v';
  %imshow(uint8(A_k));
  %hold on;
end