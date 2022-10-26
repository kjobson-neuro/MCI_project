
%%script for extracting ICV volumes from T1w images
%this is done in three parts on SPM and is saved as such
%absolutely no other corrections are done to the data before this, which is
%reflected in the T1w_ICV_jon.m file
%created by krj for the language in the cerebellum paper
%% List of open inputs
rootDir = '/Users/tuj96493/Downloads/Martin-MCI/Processed/T1w_seg/';
subjects = [101 102 105 106 109 110 112 114 121 123 124 125 127 128 129 132 133 134 135 137 141 142 155];
%%subject numbers go here
nrun = 1; % this stays as 1 because we only have one "run"
jobfile = {'/Users/tuj96493/Documents/MATLAB/T1w_ICV_job.m'};
jobs = repmat(jobfile, 1, nrun);
%don't change this line
inputs = cell(3, nrun);
%%this needs to stay as 3, because we are performing 3 separate modules
spm('defaults', 'PET');
%idk what this is, don't touch
savepath = fullfile('/Users/tuj96493/Downloads/Martin-MCI/Processed/T1w_seg/'); %file where all of the data lives
%%
for nSub=1:length(subjects)%for loop through all of the subs
T1w_paths = cellstr(fullfile(savepath,num2str(subjects(nSub)),'/T1_MCI.nii')); %path to T1w images for segmentation
mat_paths = cellstr(fullfile(savepath,num2str(subjects(nSub)),'/T1_MCI_seg8.mat')); %path where .mat files are saved and subsequently used for tissue extraction
output_paths = ('ICV'); %output of script
inputs{1,1} = cellstr(T1w_paths); %putting this into the object we created (inputs), which has three empty cells to put this data in  
inputs{2,1} = cellstr(mat_paths); %putting this in cell #2
inputs{3,1} = output_paths; %putting this in cell #3
spm_jobman('run', jobs, inputs{:});%run this preset script with the inputs specified above
end