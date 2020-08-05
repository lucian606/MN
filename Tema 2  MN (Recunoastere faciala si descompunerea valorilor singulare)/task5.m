function task5(image)
  %TODO
  matrice_imagine=double(imread(image));
  [m n]=size(matrice_imagine);
   k=[1:19 20:20:99 100:30:min(m,n)];
   [A_k S]=task3(image,k);
   diagS=diag(S);
   figure(1);
   plot(diagS);
   [n1 n1]=size(S);
   for i=1:n1
     s(i)=S(i,i);
   endfor
   for i=1:n1-1
     for j=i+1:n1
       if s(i)<s(j)
         aux=s(i);
         s(i)=s(j);
         s(j)=aux;
       endif
     endfor
   endfor
   sum2=0;
   for i=1:min(m,n)
     sum2=sum2+s(i);
   endfor
   for p=1:length(k)
     sum1=0;
      for i=1:k(p)
        sum1=sum1+s(i);
      endfor
      raport(p)=sum1/sum2;
    endfor
   figure(2);
   plot(k,raport);
   for p=1:length(k)
     [A_k S]=task3(image,k(p));
     s=0;
     for i=1:m
       for j=1:n
         s=s+(matrice_imagine(i,j)-A_k(i,j))^2;
       endfor
     endfor
     eroare(p)=s/(m*n);
   endfor
   figure(3);
   plot(k,eroare);
   for p=1:length(k)
     compresie(p)=(2*k(p)+1)/n;
   endfor
   figure(4);
   plot(k,compresie);
end