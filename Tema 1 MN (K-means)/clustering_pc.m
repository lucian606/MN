% computes the NC centroids coresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
  puncte   = length(points(:,1));
  punct_min = min(points);
  punct_max = max(points);
  punct_diff = punct_max .- punct_min ;
  centroids = ones(NC, 3) .* rand(NC, 3);
    for i=1 : 1 : length(centroids(:,1))
      centroids( i , : ) =   centroids( i , : )  .* punct_diff;
      centroids( i , : ) =   centroids( i , : )  + punct_min;
    end
  %s-au initializat centroizii  
  contor = 1.;
  while contor > 0.0
    atribuire = [];
      for j = 1 :puncte;
        min_diff = ( points( j, :) .- centroids( 1,:) );
        min_diff = min_diff * min_diff';
        curent = 1;
          for k = 2 : NC;
            diff2c = ( points( j, :) .- centroids( k,:) );
            diff2c = diff2c * diff2c';
              if( min_diff >= diff2c)
                curent = k;
                min_diff = diff2c;
              end
          end
        atribuire = [ atribuire; curent];
       end
    %s-au atribuit clustere fiecarui punct   
    vechi = centroids;
    centroids = zeros(NC, 3);
    puncteInGrup = zeros(NC, 1);
     for j = 1: length(atribuire);
      centroids( atribuire(j),:) += points(j,:);
      puncteInGrup( atribuire(j), 1 )++;
    end
    %s-au recalculat centroizii
    for k = 1: NC;
      if( puncteInGrup(k, 1) != 0)
        centroids( k , : ) = centroids( k, : ) / puncteInGrup(k, 1);
      else
        centroids( k , : ) = (rand( 1, 3) .* punct_diff) + punct_min;
      end
    end
    contor = sum (sum( (centroids .- vechi).^2 ) );
  end
end