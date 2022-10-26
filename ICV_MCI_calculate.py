#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 25 22:37:52 2022

@author: tuj96493
"""

import pandas as pd 
import os

    

full_data =  pd.read_csv('/Users/tuj96493/Documents/WMH_spreadsheet.csv')
new_ICV = pd.DataFrame(columns=['spm_icv'])

subjects = full_data['ID']
 
y = 0

for k in subjects: 
    #path = f"/Users/tuj96493/Downloads/Martin-MCI/Processed/T1w_seg/{k}/ICV.csv" #couldn't check my file check to work so I just commented out
    #check = os.path.exists(path)
   # if check == True:
        icv = pd.read_csv(f'/Users/tuj96493/Downloads/Martin-MCI/Processed/T1w_seg/{k}/ICV.csv')  
        v1 = icv['Volume1']
        v2 = icv['Volume2']
        v3 = icv['Volume3']
        icv_total = v1[0] + v2[0] + v3[0]
        icv_total = icv_total*1000000
        new_ICV.loc[y, 'spm_icv']  = icv_total 
   #elif check == False: 
        #new_ICV.loc[y]  = "na" 
        y = y +1
full_data['spm_icv'] = new_ICV    
full_data.to_csv('/Users/tuj96493/Documents/MCI_ICV_SPM.csv')        
        