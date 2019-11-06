function cost = compute_cost(file_params, file_points)
	[points centroids] = clustering(file_params, file_points);
	if length(centroids) == 0
		cost = Inf; 
	else
		cost = compute_cost_pc(points, centroids);
	end
end

