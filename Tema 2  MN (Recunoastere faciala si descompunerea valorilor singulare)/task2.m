function task2(image)
   %TODO
   matrice_imagine=double(imread(image));
   [m,n]=size(matrice_imagine);
   k=[1:19 20:20:99 100:30:min(m,n)];
   S=svd(matrice_imagine);
   for i=1:length(S)-1
     for j=i+1:length(S)
      if S(i)<S(j)
        aux=S(i);
        S(i)=S(j);
        S(j)=aux;
      endif
     endfor
   endfor
   figure(1);
   plot(S);
   sum2=0;
   for i=1:min(m,n)
     sum2=sum2+S(i);
   endfor
   for i=1:length(k)
     S=svds(matrice_imagine,k(i));
     sum1=sum(S);
     raport(i)=sum1/sum2;
   endfor
   figure(2);
   plot(k,raport);
   for p=1:length(k)
     A_k=task1(image,k(p));
     s=0;
     for i=1:m
       for j=1:n
         s=(matrice_imagine(i,j)-A_k(i,j))^2+s;
       endfor
     endfor
     eroare(p)=s/(m*n);
   endfor
   figure(3);
   plot(k,eroare);
   for p=1:length(k)
     compresie(p)=(m*k(p)+n*k(p)+k(p))/(m*n);
   endfor
   figure(4);
   plot(k,compresie);
end