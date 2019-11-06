function centroids = clustering_pc(points, NC)
  [n m] = size(points);
	centroids = zeros(NC, 3);
  
  % se aleg centroizii aleator din matricea points
  perm = randperm(n);
  centroids = points(perm(1 : NC), :);
  centroids2 = centroids;
  point_centroid = zeros(n, 3);

 while (1)
  % calculeaza centroidul pentru fiecare punct
  for i = 1 : n
    mini = 100000000;
    centroid = [0 0 0];
    for j = 1 : NC
      v1 = centroids(j, :);
      v2 = points(i, :);
      dist = sqrt((v1(1) - v2(1)) ^ 2 + (v1(2) - v2(2)) ^ 2 + (v1(3) - v2(3)) ^ 2);
      if mini >= dist
        mini = dist;
        centroid = centroids(j, :);
      endif
    endfor
    % centroidul punctului i se retine in point_centroid(i, :)
    point_centroid(i, :) = centroid;
  endfor
  
  % actualizeaza centroizii
  for i = 1 : NC
    g = [0 0 0];
    nr = 0;
    for j = 1 : n
      if (point_centroid(j, :) == centroids(i, :))
        g(1) += points(j, 1);
        g(2) += points(j, 2);
        g(3) += points(j, 3);
        nr++;
      endif
    endfor
    g = g / nr;
    % se actualizeaza matricea centroizilor
    centroids(i, :) = g;
  endfor
  
  % verifica daca centroizii au ramasa aceeasi
  ok = 1;
  for i = 1 : NC
    if centroids(i, :) != centroids2(i, :)
       ok = 0;
       centroids2(i, :) = centroids(i, :);
    endif
  endfor
 
  if ok == 1
    break;
  endif
 endwhile
endfunction
