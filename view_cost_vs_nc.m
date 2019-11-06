function view_cost_vs_nc(file_points)
  
   load(file_points);
   [n m] = size(points);
   
   x = zeros(1, 10);
   y = zeros(1, 10);
   
   load(file_points);
   
   for NC = 1 : 10
     % se extrag cei NC centroizi din matricea points
     centroids = clustering_pc(points, NC);
     
     % se calculeaza costul pentru NC centroizi
     cost = compute_cost_pc(points, centroids);
     
     % se stocheaza datele pentru a fi afisate ulterior
     x(NC) = NC;
     y(NC) = cost;
   endfor
   
   % se traseaza graficul cost vs NC
   plot(x, y, '-b', 'LineWidth', 2);
   grid;
   xlabel("Cluster count");
   ylabel("Cost");
   
endfunction

