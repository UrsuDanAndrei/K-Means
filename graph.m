function graph()
	file_params = "cls/cluster_2.param";
	file_points = "cls/cluster_2.points";

	[points centroids] = clustering(file_params, file_points);
	
	figure(1);
	clf
  view_cost_vs_nc(file_points);

	figure(2);
	clf
  view_clusters(points, centroids);
end

