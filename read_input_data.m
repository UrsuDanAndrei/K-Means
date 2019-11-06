function [NC points] = read_input_data(file_params, file_points)
	NC = 0;
  NC = load(file_params);
  
  % se citesc NC si points din fisierele date
  points = zeros(NC, 3);
  load(file_points);
endfunction
