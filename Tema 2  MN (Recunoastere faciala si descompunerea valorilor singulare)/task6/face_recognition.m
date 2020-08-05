function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
  coloana=1;
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
  [linii coloane]=size(T);
  for i=1:linii
    s=sum(T(i,1:coloane));
    m(i)=s/coloane;
  endfor
  PrTestImg=eigenfaces'*m';
  min_dist=norm(PrTestImg-pr_img(:,1));
  output_img_index=1;
  for i=2:length(pr_img)
    if norm(PrTestImg-pr_img(:,i))<min_dist
      min_dist=norm(PrTestImg-pr_img(:,i));
      output_img_index=i;
    endif
  endfor
end