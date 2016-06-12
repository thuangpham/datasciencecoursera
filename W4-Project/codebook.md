---
title: "codebook.md"
author: "Thuan G Pham"
date: "June 12, 2016"
output: html_document
---


## Code book for the DataCleanAndTidy_ThuanGPham.txt
This code book is used to describe the dataset generated from the run_analysis.R program

### Program: run_analysis.R
  
### Data Colums:
Column Name| Description
Subject|Unique Identifier for the subject
ActivityName| Name of the activities. Acceptable values are:  
										1 WALKING
										2 WALKING_UPSTAIRS
										3 WALKING_DOWNSTAIRS
										4 SITTING
										5 STANDING
										6 LAYING
UnitDomain| The domain for the measurement: Time Domain or Freq (Frequency) Domain
Acceleration| The acceleration can be Body or Gravity
JerkSignal| The jerk signal.
MagnitudeSignal| Magnitude Signal.
CalculationType| Mean or Standard Deviation 
Direction| The angular velocity of the magnitude of the jerk signal are express in X,Y,Z direction 
average| average of each variable for each activity and each subject

  
