---
title: "codebook.md"
author: "Thuan G Pham"
date: "June 13, 2016"
output: html_document
---
 

## Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!

### Program: run_analysis.R
    Purpose: This r program will create a tidy dataset from the Human Activity Recognition data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 
  
### Completion Steps:
* **COMPLETED** - Merges the training and the test sets to create one data set.
* **COMPLETED** - Extracts only the measurements on the mean and standard deviation for each measurement.
* **COMPLETED** - Uses descriptive activity names to name the activities in the data set
* **COMPLETED** - Appropriately labels the data set with descriptive variable names.
* **COMPLETED** - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
### Steps:
  1. Download Data from the specified link
  2. Manually extract data to sub-directory under the working the directory
  3. Install and load the following packages:
      + reshape2
      + dplyr
  4. Load the following packages:
      + stringr
  5. Read in the following data files and store them in the data.tables:
      + X_train.txt 
      + y_train.txt
      + subject_train.txt
      + X_test.txt
      + y_test.txt
      + subject_test.txt
  6. **Merge training and test data to create 1**
      +Combine the test and train data tables, then merge them into 1 called **dtMain**
  7. **Extracts only the measurements on the mean and standard deviation** 
      +Read in the Features.txt file and use **grepl** to extract only **mean** and **std** features. 
	  +Get the column index, and create a column names list to subsetting  only those columns from dtMain. 
  8. **Uses descriptive activity names to name the activities** 
      +Read in the activity_labels.txt file into a data table called dtActivityNamesOrig, 
	  +then factor function to update the Activity column with readable names: WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS, SITTING,STANDING, LAYING
  9. **Appropriately labels the data set with descriptive variable names**
      + melt the dtMain to do create a narrow and tall dataset named: dtMelt
      + calculated mean for all variables and store in dtMean     
  10. **creates a second, independent tidy data set with the average**
      + create a dtTidy data table to store the subsetting of the dtMain, along with Average column for each variable for each activity and each subject.
  
