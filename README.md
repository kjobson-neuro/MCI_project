# MCI Project

## Mild Cognitive Impairment Project 2022

Intracranial volume (ICV) was calculated using Malone et al’s (2015) method. This involves isolating the T1-weighted image and segmenting the brain using SPM12 into gray matter, white matter, and CSF (in liters). The summed volumes of these tissue types yields the whole-brain intracranial 
volume, which when transformed into mm3 yields the metric for probabilistic tractography reported by FSL. T1w_ICV.m and T1w_ICV_job.m are matlab 
scripts that use SPM12 to estimate ICV.

The file ICV_MCI_calculate.py takes the CSV files that result from SPM and compile them into a spreadsheet with the data from the UBO Detector
pipeline.
