%% program to study the protein turnover kinetics; version 1.0.0 
%( last upadted on 05-21-2021)

close all
clearvars 
warning('off','all')
%% 
%read parameter file
fid     = fopen('JUMPt.params');
param   = textscan(fid,'%s','delimiter','\n');
cellfun(@eval,param{1});
fclose(fid);

params.setting      = setting;
params.input_file   = input_file;
params.bin_size     = bin_size;
params.opti_algo    = optimization_algorithm;
params.purity       = purity_of_SILAC_food;

%Read the input data from input file and distribute the protein different bins 
data = binning(params);
fprintf('\n  Completed reading input file \n\n  Now fitting the protein data and calculate half-lives\n')

% Calculate the half-lives with different settings
calc_half_lives(data,params); %Fitting/optimizing proteins to calculate the half-lives


fprintf('\n  Completed exporting half-lives to the out_file \n\n *******  JUMPt program is complete *******\n\n')
