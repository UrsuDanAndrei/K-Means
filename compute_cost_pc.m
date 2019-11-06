function cost = compute_cost_pc(points, centroids)
  [n m] = size(points);
  [NC m] = size(centroids);
	cost = 0;
  
  % se cauta centroidul fiecarui punct i
	for i = 1 : n
    mini = 100000000;
    centroid = [0 0 0];
    for j = 1 : NC
      v1 = centroids(j, :);
      v2 = points(i, :);
      dist = sqrt((v1(1) - v2(1)) ^ 2 + (v1(2) - v2(2)) ^ 2 + (v1(3) - v2(3)) ^ 2);
      if mini >= dist
        mini = dist;
      endif
    endfor
    % se adauga distanta de la punctul i la centroidul sau la costul total
    cost += mini;
  endfor
endfunction
