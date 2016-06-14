---
title: "codebook.md"
author: "Thuan G Pham"
date: "June 12, 2016"
output: html_document
---

## Code book for the DataCleanAndTidy_ThuanGPham.txt
This code book is used to describe the dataset generated from the run_analysis.R program
  
### Data Colums:
--------------------------------------------------------------------------------------------------------
			|Column Name     			| Description
-----------	|				 			|	----------------------------------------------------------------------- |
	|	*	|	Subject		 			|	The Subject Identifier													|
	|	*	|	Activity	 			|	Name of the activities. Acceptable values are: 1, WALKING, 2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING,5 STANDING,6 LAYING 	|
	|	*	|	tBodyAccmeanX			|	Mean Body Acceleration in X Axis in Time Domain							|
	|	*	|	tBodyAccmeanY			|	Mean Body Acceleration in Y Axis in Time Domain							|
	|	*	|	tBodyAccmeanZ			|	Mean Body Acceleration in Z Axis in Time Domain							|
	|	*	|	tBodyAccstdX			|	Standard Deviation Body Acceleration in X Axis in Time Domain			|
	|	*	|	tBodyAccstdY			|	Standard Deviation Body Acceleration in Y Axis in Time Domain			|
	|	*	|	tBodyAccstdZ			|	Standard Deviation Body Acceleration in Z Axis in Time Domain			|
	|	*	|	tGravityAccmeanX		|	Mean Gravity Acceleration in X Axis in Time Domain						|
	|	*	|	tGravityAccmeanY		|	Mean Gravity Acceleration in Y Axis in Time Domain						|
	|	*	|	tGravityAccmeanZ		|	Mean Gravity Acceleration in Z Axis in Time Domain						|
	|	*	|	tGravityAccstdX			|	Standard Deviation Gravity Acceleration in Z Axis  in Time Domain		|
	|	*	|	tGravityAccstdY			|	Standard Deviation Gravity Acceleration in Z Axis in Time Domain		|
	|	*	|	tGravityAccstdZ			|	Standard Deviation Gravity Acceleration in Z Axis in Time Domain		|
	|	*	|	tBodyAccJerkmeanX		|	Mean Body Jerk in X Axis  in Time Domain								|
	|	*	|	tBodyAccJerkmeanY		|	Mean Body Jerk in Y Axis in Time Domain									|
	|	*	|	tBodyAccJerkmeanZ		|	Mean Body Jerk in Z Axis in Time Domain									|
	|	*	|	tBodyAccJerkstdX		|	Standard Deviation Body Jerk  in Z Axis  in Time Domain					|
	|	*	|	tBodyAccJerkstdY		|	Standard Deviation Body Jerk   in Z Axis in Time Domain					|
	|	*	|	tBodyAccJerkstdZ		|	Standard Deviation Body Jerk  in Z Axis in Time Domain					|
	|	*	|	tBodyGyromeanX			|	Mean Body Gyro in X Axis in Time Domain									|
	|	*	|	tBodyGyromeanY			|	Mean Body Gyro in Y Axis in Time Domain									|
	|	*	|	tBodyGyromeanZ			|	Mean Body Gyro in Z Axis in Time Domain									|
	|	*	|	tBodyGyrostdX			|	Standard Deviation Body Gyro  in Z Axis in Time Domain					|
	|	*	|	tBodyGyrostdY			|	Standard Deviation Body Gyro   in Z Axis in Time Domain					|
	|	*	|	tBodyGyrostdZ			|	Standard Deviation Body Gyro  in Z Axis in Time Domain					|
	|	*	|	tBodyGyroJerkmeanX		|	Mean Body GyroJerk in X Axis in Time Domain								|
	|	*	|	tBodyGyroJerkmeanY		|	Mean Body GyroJerk in Y Axis in Time Domain								|
	|	*	|	tBodyGyroJerkmeanZ		|	Mean Body Gyro Jerk in Z Axis in Time Domain							|
	|	*	|	tBodyGyroJerkstdX		|	Standard Deviation Body Gyro Jerk  in Z Axis in Time Domain				|
	|	*	|	tBodyGyroJerkstdY		|	Standard Deviation Body Gyro  Jerk in Z Axis in Time Domain				|
	|	*	|	tBodyGyroJerkstdZ		|	Standard Deviation Body Gyro  Jerk in Z Axis in Time Domain				|
	|	*	|	tBodyAccMagmean			|	Mean Body Acceleration Magnitude  in Time Domain						|
	|	*	|	tBodyAccMagstd			|	Standard Deviation Body Acceleration Magnitude  in Time Domain			|
	|	*	|	tGravityAccMagmean		|	Mean of Gravity Acceleration Magnitude  in Time Domain					|
	|	*	|	tGravityAccMagstd		|	Standard Deviation of  Gravity Accerleration Magnitude in Time Domain	|
	|	*	|	tBodyAccJerkMagmean		|	Mean of Body Accerleration Jerk Magnitude  in Time Domain				|
	|	*	|	tBodyAccJerkMagstd		|	Standard Deviation of Body Accerleration Jerk Magnitude  in Time Domain	|
	|	*	|	tBodyGyroMagmean		|	Mean of Body Gyro Magnitude  in Time Domain								|
	|	*	|	tBodyGyroMagstd			|	Standard Deviation of Body Gyro Magnitude  in Time Domain				|
	|	*	|	tBodyGyroJerkMagmean	|	Mean of Body Gyro Jerk Magnitude  in Time Domain						|
	|	*	|	tBodyGyroJerkMagstd		|	Standard Deviation of Body Gyro Jerk Magnitude in Time Domain			|
	|	*	|	fBodyAccmeanX			|	Body Acceleration Mean in X in Frequency								|
	|	*	|	fBodyAccmeanY			|	Body Acceleration Mean in Y in Frequency								|
	|	*	|	fBodyAccmeanZ			|	Body Acceleration Mean in Z in Frequency								|
	|	*	|	fBodyAccstdX			|	Body Acceleration SD in X in Frequency									|
	|	*	|	fBodyAccstdY			|	Body Acceleration SD in Y in Frequency									|
	|	*	|	fBodyAccstdZ			|	Body Acceleration SD in Z in Frequency									|
	|	*	|	fBodyAccJerkmeanX		|	Body Acceleration Jerk Mean in X in Frequency							|
	|	*	|	fBodyAccJerkmeanY		|	Body Acceleration Jerk Mean in Y in Frequency							|
	|	*	|	fBodyAccJerkmeanZ		|	Body Acceleration Jerk Mean in Z in Frequency							|
	|	*	|	fBodyAccJerkstdX		|	Body Acceleration Jerk SD in X in Frequency								|
	|	*	|	fBodyAccJerkstdY		|	Body Acceleration Jerk SD in Y in Frequency								|
	|	*	|	fBodyAccJerkstdZ		|	Body Acceleration SD in Z in Frequency									|
	|	*	|	fBodyGyromeanX			|	Body Gyro Mean in X in Frequency										|
	|	*	|	fBodyGyromeanY			|	Body Gyro Mean in Y in Frequency										|
	|	*	|	fBodyGyromeanZ			|	Body Gyro Mean in Z in Frequency										|
	|	*	|	fBodyGyrostdX			|	Body Gyro SD in X in Frequency											|
	|	*	|	fBodyGyrostdY			|	Body Gyro SD in Y in Frequency											|
	|	*	|	fBodyGyrostdZ			|	Body Gyro SD in Z in Frequency											|
	|	*	|	fBodyAccMagmean			|	Body Acceleration Magnitude Mean in Frequency							|
	|	*	|	fBodyAccMagstd			|	Body Acceleration Magnitude Mean in Frequency							|
	|	*	|	fBodyBodyAccJerkMagmean	|	Body Acceleration Magnitude Mean in Frequency							|
	|	*	|	fBodyBodyAccJerkMagstd	|	Body Acceleration Magnitude Mean in Frequency							|
	|	*	|	fBodyBodyGyroMagmean	|	Body Acceleration Magnitude Mean in Frequency							|
	|	*	|	fBodyBodyGyroMagstd		|	Standard Deviation of Body Gyro Magnitude  in Frequency					|
	|	*	|	fBodyBodyGyroJerkMagmean|	Mean of Body Gyro Jerk Magnitude in Frequency							|
	|	*	|	fBodyBodyGyroJerkMagstd	|	Standard Deviation of Body Gyro Jerk Magnitude  in Frequency			|
