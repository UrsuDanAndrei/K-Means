function view_clusters(points, centroids)
  [n m] = size(points);
  [NC m] = size(centroids);
  point_centroid = zeros(n, 3);
  
  % se atribuie fiecarui punct un centroid
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
    point_centroid(i, :) = centroid;
  endfor
  
  % pentru fiecare centroid se afla punctele ce apartin de el
  for i = 1 : NC
    x = zeros(n);
    y = zeros(n);
    z = zeros(n);
    k = 0;
    
    for j = 1 : n
      if point_centroid(j, :) == centroids(i, :)
        k++;
        x(k) = points(j, 1);
        y(k) = points(j, 2);
        z(k) = points(j, 3);
      endif
    endfor
    
    % se alege o culoare aleatoare
    r = rand;
    g = rand;
    b = rand;
    
    % se afiseaza toate punctele centroidului i
    scatter3(x(1:k), y(1:k), z(1:k), [], [r g b]); hold on;
  endfor
endfunction

