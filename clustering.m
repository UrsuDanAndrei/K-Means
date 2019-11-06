function [points centroids] = clustering(file_params, file_points)
	[NC points] = read_input_data(file_params, file_points);
	centroids = clustering_pc(points, NC);
end

