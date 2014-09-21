
## The purpose of this script is to collect, work with, and clean a data set. 
## The goal is to prepare tidy data that can be used for later analysis.
## See the Readme.md for more information about the data set and step to 
## follow to work with this script

## Create R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Initialization
## Check dependencies and install packages

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")


## ===== 1. Merges the training and the test sets to create one data set =====

## Read data, subject and label(activity) for training sets

trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")

## Bind data, subject and activity label for training set
dtTrainSet <- cbind(trainSubject, trainLabel, trainData)

## Read data, subject and label(activity) for test sets

testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Bind data, subject and activity label for test set
dtTestSet <- cbind(testSubject, testLabel, testData)

## Merges the training and the test sets

dtTrainingTestMerged <- rbind(dtTrainSet, dtTestSet)


## ===== 2. Extracts only the measurements on the mean and standard deviation for each measurement =====

## Load data column feature names
dtFeatures <- read.table("./UCI HAR Dataset/features.txt")
names(dtFeatures) <- c("featureNum", "featureName")

  ## add feature code corresponding to measurement variables
dtFeatures$featureCode <- paste0("V", dtFeatures[,"featureNum"])

dtFeatures <- grep("mean\\(\\)|std\\(\\)", dtFeatures$featureName)

names(dtTrainingTestMerged[1]) <-  c("subject")
names(dtTrainingTestMerged[2]) <-  c("activityNum")

dtTrainingTestMerged <- subset(dtTrainingTestMerged, select = c("subject", "activityNum", dtFeatures[ , 3]))


## ===== 3. Uses descriptive activity names to name the activities in the data set =====

  ##This will be used to add descriptive names to the activities
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activityLabels) = c("activityNum", "activityLabel")


## ===== 4. Appropriately labels the data set with descriptive variable names =====

##dtTrainingTestMerged[,2] = activityLabels[dtTrainingTestMerged[,2]]
dtTrainingTestMerged <- merge(dtTrainingTestMerged, activityLabels, by = "activityNum", all.x = TRUE)


## ===== 5. Creates tidy data set with the average of each variable for each activity and each subject =====

id_labels   = c("subject", "activityNum", "activityLabel")
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
















