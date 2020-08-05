% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params, file_points)
	% set these values correctly
  NC = load(file_params);
  A = load(file_points);
  points =cell2mat(struct2cell(A));
	% TODO read NC
	% TODO read points
end