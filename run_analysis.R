#load libraries 
library(data.table)
library(dplyr)

#set preferred working directory 
setwd("getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//")

# Read in all files
activityLabels <- read.csv("activity_labels.txt", sep="", header=FALSE)
trainX <- read.csv("train/X_train.txt", sep="", header=FALSE)
trainActivity = read.csv("train/y_train.txt", sep="", header=FALSE)
trainSubject = read.csv("train/subject_train.txt", sep="", header=FALSE)
testX = read.csv("test/X_test.txt", sep="", header=FALSE)
testActivity = read.csv("test/y_test.txt", sep="", header=FALSE)
testSubject = read.csv("test/subject_test.txt", sep="", header=FALSE)

# Bind training and test datasets together - "Subject, Activity, Data[1:561]"
trainDataSet <- cbind(trainSubject,trainActivity,trainX)
testDataSet <- cbind(testSubject, testActivity, testX)
mergedData <- data.table(rbind(trainDataSet, testDataSet))

# Read features.txt file and assign column names to mergedData 
features = read.csv("features.txt", sep="", header=FALSE)
colnames(mergedData) <- c("subject", "activity", as.character(features$V2))

# Get only the columns containing 'mean' and 'std. dev'.
cols <- grep(".*mean.*|.*std.*", features$V2) + 2 #get column indexes of mean and s.d. and offset 2
meanSDData <- mergedData[, c(1:2,cols), with=FALSE]       #retain only columns that have 'mean' and 'std'

# Rename the activity index to actual activity labels referencing activityLabels file 
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  meanSDData$activity <- gsub(currentActivity, currentActivityLabel, meanSDData$activity)
  currentActivity <- currentActivity + 1
}

# Calculate mean and rename subject and activity to subject1 & activity1
activity1 <- factor(meanSDData$activity, exclude ="")
subject1 <- factor(meanSDData$subject, exclude = "")
tidy <- aggregate(meanSDData, by=list(subject1=subject1,activity1 = activity1),FUN= "mean")

# Remove the old subject and activity column 
tidy[, c("subject", "activity")] <- list(NULL)

# Output tidied data into working directory
write.table(tidy, "tidy.txt", sep="\t", col.names = TRUE, row.name = FALSE)