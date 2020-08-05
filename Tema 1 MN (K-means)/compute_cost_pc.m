% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; %se initializeaza costul cu 0
  puncte=length(points(:,1)); %se calculeaza numarul de puncte
  NC=length(centroids(:,1));  %se calculeaza numarul de centroizi
	for i=1:puncte
    dist_min=sqrt((points(i,1)-centroids(1,1))^2+(points(i,2)-centroids(1,2))^2+(points(i,3)-centroids(1,3))^2);
    cluster=1;
    %se initializeaza clusterul pentru fiecare punct ca fiind primul
    for j=2:NC
      dist=sqrt((points(i,1)-centroids(j,1))^2+(points(i,2)-centroids(j,2))^2+(points(i,3)-centroids(j,3))^2);
      %se calculeaza distanta fata de fiecare centrod
      if(dist<dist_min)
        dist_min=dist;
      endif
    endfor
   cost=cost+(dist_min);
   %se adauga la cost distanta punctelor fata de centroizii lor
 endfor 
end