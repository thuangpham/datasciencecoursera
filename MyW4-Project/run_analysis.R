#download the dataset.zip
install.packages("reshape2")
install.packages("dplyr")

setwd("C:/DataScience/Clean Data/Project/")
dataDir <-file.path(getwd(),"UCI HAR Dataset")
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url, file.path(getwd(),"HARdataset.zip"))

#Manually Unzip HARdataset.zip file and save it to "C:\DataScience\Clean Data\Project\UCI HAR Dataset"

unzip("./HARdataset.zip")

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
dtYTrainAndTest <-rbind(dtYInTrainFolder,dtYInTestFolder)
head(dtYTrainAndTest,1,1)
#update V1 to Activity -> preventing duplicates column names, this is the activity
setnames(dtYTrainAndTest,"V1","Activity")
dtSubjectTrainAndTest <-rbind(dtSubjectInTrainFolder,dtSubjectInTestFolder)
head(dtSubjectTrainAndTest,3,3)
setnames(dtSubjectTrainAndTest,"V1","Subject")

#1. merge all 3 dataset into 1
dtSubjectAndX <-cbind(dtSubjectTrainAndTest,dtXTrainAndTest)
dtMain <-cbind(dtSubjectAndX,dtYTrainAndTest)
head(dtMain,3,3)

setkey(dtMain, Subject, Activity)

#2. Extracting mean and SD 

#The complete list of variables of each feature vector is available in 'features.txt'
dtFeaturesOrig<-data.table(read.table(file.path(dataDir,"features.txt")))
head(dtFeaturesOrig,3)
dtFeaturesOrig <-dtFeaturesOrig[grepl("mean\\(\\)|std\\(\\)",dtFeaturesOrig$V2)]
onlyMeanAndSD<-dtFeaturesOrig

head(onlyMeanAndSD)

#The value in V1 is the column number-> combining it with "V" label
library(stringr)
MeanAndSDColumns <-onlyMeanAndSD[,str_replace(paste("V",dtFeaturesOrig$V1)," ","")]

#selecting only these columns from dtMain
selectColumns<-c(key(dtMain),MeanAndSDColumns)
dtMain<-dtMain[,selectColumns,with=FALSE]

#add label for later matching
dtFeaturesOrig$FeatureLabel <-MeanAndSDColumns

dtFeaturesOrig$V2 <- gsub('[-()]', '', dtFeaturesOrig$V2)

colnames(dtMain) <-c ("Subject","Activity", dtFeaturesOrig$V2)

colnames(dtMain) 

#3. Uses descriptive activity names to name the activities in the data set
dtActivityNamesOrig<-data.table(read.table(file.path(dataDir,"activity_labels.txt")))
head(dtActivityNamesOrig)
setnames(dtActivityNamesOrig,names(dtActivityNamesOrig),c("Activity","ActivityName"))

head(dtMain$Activity)

#4. Appropriately labels the data set with descriptive variable names.
dtMain$Activity <- factor(dtMain$Activity, levels = dtActivityNamesOrig$Activity, labels = dtActivityNamesOrig$ActivityName)
dtMain$Subject <- as.factor(dtMain$Subject)

#5. create a tidy dataset
dtMelted <- melt(dtMain, id = c("Subject", "Activity"))
dtMean <- dcast(dtMelted, Subject + Activity ~ variable, mean)

outfile <-file.path(getwd(),"DataCleanAndTidy_ThuanGPham.txt")
write.table(dtMean,file=outfile,append=FALSE,row.names = FALSE)
