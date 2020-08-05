function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  imagini=readdir(database_path);
  coloana=1;
  for i=1:10
    image_path=strcat(database_path,'/',int2str(i),'.jpg');
    matrice_imagine=double(rgb2gray(imread(image_path)));
    [m1 n1]=size(matrice_imagine);
    linie=1;
    for k=1:m1
      for j=1:n1
        T(linie,coloana)=matrice_imagine(k,j);
        linie++;
      endfor
    endfor
    coloana++;
  endfor
  [linii coloane]=size(T);
  for i=1:linii
    s=sum(T(i,1:coloane));
    m(i)=s/coloane;
  endfor
  A=T-m';
  B=A'*A;
  [W S]=eig(B);
  [n n]=size(W);
  nr=0;
  for i=1:n
    if S(i,i)>1
      nr++;
      V(nr,1:n)=W(i,1:n);
    endif
  endfor
  disp(nr);
  eigenfaces=A*V;
  pr_img=(eigenfaces')*A;
end