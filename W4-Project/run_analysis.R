#download the dataset.zip
#install.packages("reshape2")
#install.packages("dplyr")

setwd("C:/DataScience/Clean Data/Project/")
dataDir <-file.path(getwd(),"UCI HAR Dataset")
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download.file(url, file.path(getwd(),"HARdataset.zip"))

#Manually Unzip HARdataset.zip file and save it to "C:\DataScience\Clean Data\Project\UCI HAR Dataset"


#load data.table package
library(data.table)

#load reshape package
library(reshape2)

#load dplyr
library(dplyr)

#read data files from train folder
dtXInTrainFolder<-data.table(read.table(file.path(dataDir,"train","X_train.txt")))
dtYInTrainFolder<-data.table(read.table(file.path(dataDir,"train","y_train.txt")))
dtSubjectInTrainFolder <- data.table(read.table(file.path(dataDir,"train","subject_train.txt")))

#read data files from test folder
dtXInTestFolder<-data.table(read.table(file.path(dataDir,"test","X_test.txt")))
dtYInTestFolder<-data.table(read.table(file.path(dataDir,"test","y_test.txt")))
dtSubjectInTestFolder <-data.table(read.table(file.path(dataDir,"test","subject_test.txt")))

#combine train with test files
dtXTrainAndTest <-rbind(dtXInTrainFolder,dtXInTestFolder)
head(dtXTrainAndTest,1,1)
#update V1 to XV1 -> preventing duplicates column names
#setnames(dtXTrainAndTest,"V1","XV1") 
dtYTrainAndTest <-rbind(dtYInTrainFolder,dtYInTestFolder)
head(dtYTrainAndTest,1,1)
#update V1 to YV1 -> preventing duplicates column names, this is the activity
setnames(dtYTrainAndTest,"V1","YV1")
dtSubjectTrainAndTest <-rbind(dtSubjectInTrainFolder,dtSubjectInTestFolder)
head(dtSubjectTrainAndTest,3,3)
setnames(dtSubjectTrainAndTest,"V1","SubjectV1")

#1. merge all 3 dataset into 1
dtSubjectAndX <-cbind(dtSubjectTrainAndTest,dtXTrainAndTest)
dtMain <-cbind(dtSubjectAndX,dtYTrainAndTest)
head(dtMain,3,3)

setkey(dtMain, SubjectV1, YV1)

#2. Extracting mean and SD 

#The complete list of variables of each feature vector is available in 'features.txt'
dtFeaturesOrig<-data.table(read.table(file.path(dataDir,"features.txt")))
head(dtFeaturesOrig,3)
dtFeaturesOrig <-dtFeaturesOrig[grepl("mean\\(\\)|std\\(\\)",dtFeaturesOrig$V2)]
dtFeaturesOrig
head(onlyMeanAndSD)

#The value in V1 is the column number-> combining it with "V" label
library(stringr)
MeanAndSDColumns <-onlyMeanAndSD[,str_replace(paste("V",dtFeaturesOrig$V1)," ","")]

#selecting only these columns from dtMain
selectColumns<-c(key(dtMain),MeanAndSDColumns)
dtMain<-dtMain[,selectColumns,with=FALSE]

#add label for later matching
dtFeaturesOrig$FeatureLabel <-MeanAndSDColumns

#3. Uses descriptive activity names to name the activities in the data set
dtActivityNamesOrig<-data.table(read.table(file.path(dataDir,"activity_labels.txt")))
head(dtActivityNamesOrig)
setnames(dtActivityNamesOrig,names(dtActivityNamesOrig),c("YV1","ActivityName"))

dtMain<-merge(dtMain,dtActivityNamesOrig,by="YV1",all=TRUE)

head(dtMain$ActivityName)

setkey(dtMain, SubjectV1, YV1, ActivityName)

#Appropriately labels the data set with descriptive variable names.
#Melt table to have the columns of subject, Activity, FeatureLabel and value 
dtMain <- data.table(melt(dtMain, key(dtMain), variable.name = "FeatureLabel"))

#Merging Features and Data
dtMain<-merge(dtMain, dtFeaturesOrig[, list(V1, V2, FeatureLabel)], by = "FeatureLabel",all.x= TRUE,allow.cartesian = TRUE)
setnames(dtMain,"V2","FeatureName")

dtMain<-dtMain[grepl("mean\\(\\)|std\\(\\)",dtMain$FeatureName)]

#FeatureName Column contains the different information about the fuction
# such as Time/Freq/Jerk/Magniture/

RegFind <- function(regex) {
  grepl(regex, dtMain$FeatureName)
}

# using factor function because the we will build a matrix of true/false when 
# looking for the different function within the featurename value.
# If argument ordered is TRUE, the factor levels are assumed to be ordered

numOfTerms <- 2
rows <- matrix(seq(1, numOfTerms), nrow = numOfTerms)
#getting the time and freq domain
cols <- matrix(c(RegFind("^t"), RegFind("^f")), ncol = nrow(rows))
dtMain$UnitDomain <- factor(cols %*% rows, labels = c("Time", "Freq"))
#getting the Acceloration and Gyroscope
cols<- matrix(c(RegFind("Acc"), RegFind("Gyro")), ncol = nrow(rows))
dtMain$Instrument <- factor(cols %*% rows, labels = c("Accelerometer", "Gyroscope"))
#getting body and gravity
cols <- matrix(c(RegFind("BodyAcc"), RegFind("GravityAcc")), ncol = nrow(rows))
dtMain$Acceleration <- factor(cols %*% rows, labels = c(NA,"Body", "Gravity"))
#get the mean and std 
cols <- matrix(c(RegFind("mean()"), RegFind("std()")), ncol = nrow(rows))
dtMain$Variable <- factor(cols %*% rows, labels = c("Mean", "SD"))

# Get Jerk and Magniture Columns
dtMain$JerkSignal <- factor(RegFind("Jerk"), labels = c(NA, "Jerk"))
dtMain$MagnitudeSignal <- factor(RegFind("Mag"), labels = c(NA, "Magnitude"))

# getting the direction x,y,z
numOfTerms <- 3
rows <- matrix(seq(1, numOfTerms), nrow = numOfTerms)
cols <- matrix(c(RegFind("-X"), RegFind("-Y"), RegFind("-Z")), ncol = nrow(rows))
dtMain$Direction <- factor(cols %*% rows, labels = c(NA, "X", "Y", "Z"))

head(dtMain)

#5. create a tidy dataset
setkey(dtMain, SubjectV1, ActivityName,UnitDomain,Acceleration,JerkSignal,MagnitudeSignal,Variable,Direction)

dtTidy <- dtMain[, list(count = .N, average = mean(value)), by = key(dtMain)]
outfile <-file.path(getwd(),"DataCleanAndTidy_ThuanGPham_2.txt")
write.table(dtTidy,file=outfile,append=FALSE,row.names = FALSE)