% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	% TODO graphical representation coded here 
  puncte=length(points(:,1)); %se calculeaza numarul de puncte
  NC=length(centroids(:,1));  %se calculeaza numarul de centroizi
  culori=jet(NC*10);  %se atribuie culorile
  for i=1:puncte  %pentru fiecare punct
    dist_min=sqrt((points(i,1)-centroids(1,1))^2+(points(i,2)-centroids(1,2))^2+(points(i,3)-centroids(1,3))^2);
    %se initializeaza distanta minima ca fiind cea fata de primul centroid
    cluster=1;
    for j=2:NC
      dist=sqrt((points(i,1)-centroids(j,1))^2+(points(i,2)-centroids(j,2))^2+(points(i,3)-centroids(j,3))^2);
      %se calculeaza distantele fata de ceilalti centroizi
      if(dist<dist_min)
        dist_min=dist;
        cluster=j;
        %se atribuie distanta minima si clusterul respectiv
      endif
    endfor
  scatter3(points(i,1),points(i,2),points(i,3),[],culori(cluster*10));
  %se coloreaza punctul in functie de cluster
  hold on;
  endfor  
end