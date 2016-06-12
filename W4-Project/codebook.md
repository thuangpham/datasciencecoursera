---
title: "codebook.md"
author: "Thuan G Pham"
date: "June 12, 2016"
output: html_document
---

## Code book for the DataCleanAndTidy_ThuanGPham.txt
This code book is used to describe the dataset generated from the run_analysis.R program
  
### Data Colums:
----------------------------------
Column Name     | Description
----------------|-----------------
Subject         |Unique Identifier for the subject
ActivityName    | Name of the activities. Acceptable values are:  1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING,5 STANDING,6 LAYING
UnitDomain      | The domain for the measurement: Time Domain or Freq (Frequency) Domain
Acceleration    | The acceleration can be Body or Gravity
JerkSignal      | The jerk signal.
MagnitudeSignal | Magnitude Signal.
CalculationType | Mean or Standard Deviation 
Direction       | The angular velocity of the magnitude of the jerk signal are express in X,Y,Z direction 
average         | average of each variable for each activity and each subject

### Sample Data:
-----------------------------------------------------------------------------------------------------------------
Subject| ActivityName|UnitDomain   |Acceleration |JerkSignal   |MagnitudeSignal|CalculationType|Direction|average
-------|-------------|-------------|-------------|-------------|---------------|---------------|---------|-------
1      |LAYING       |Time         |NA           |NA           |NA             |Mean           |X        |-0.016553093978
1      |LAYING       |Time         |NA           |NA           |NA             |Mean           |Y        |-0.064486124088
1      |LAYING       |Time         |NA           |NA           |NA             |Mean           |Z        |0.14868943626
1      |LAYING       |Time         |NA           |NA           |NA             |SD             |X        |-0.87354386782
1      |LAYING       |Time         |NA           |NA           |NA             |SD             |Y        |-0.9510904402
1      |LAYING       |Time         |NA           |NA           |NA             |SD             |Z        |-0.9082846626
1      |LAYING       |Time         |NA           |NA           |Magnitude      |Mean           |NA       |-0.874759548
1      |LAYING       |Time         |NA           |NA           |Magnitude      |SD             |NA       |-0.81901016976
1      |LAYING       |Time         |NA           |Jerk         |NA             |Mean           |X        |-0.107270949192
1      |LAYING       |Time         |NA           |Jerk         |NA             |Mean           |Y        |-0.04151728689
1      |LAYING       |Time         |NA           |Jerk         |NA             |Mean           |Z        |-0.0740501211
1      |LAYING       |Time         |NA           |Jerk         |NA             |SD             |X        |-0.9186085208
1      |LAYING       |Time         |NA           |Jerk         |NA             |SD             |Y        |-0.9679072436
1      |LAYING       |Time         |NA           |Jerk         |NA             |SD             |Z        |-0.9577901596
1      |LAYING       |Time         |NA           |Jerk         |Magnitude      |Mean           |NA       |-0.96346103
1      |LAYING       |Time         |NA           |Jerk         |Magnitude      |SD             |NA       |-0.9358409828  
