function view_cost_vs_nc(file_points)
	% TODO compute cost for NC = [1..10] and plot 
  A = load(file_points);
	points =cell2mat(struct2cell(A));
  for NC=1:10
    centroids=clustering_pc(points, NC);  %se calculeaza centroizii
    cost(NC) = compute_cost_pc(points, centroids);  %se calculeaza
    index(NC)=NC; %se creeaza un vector de valori
  endfor
    plot(index,cost,'r'); %se reprezinta grafic costul
end