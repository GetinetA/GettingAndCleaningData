# Getting and Cleaning Data

## Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


The R script included called run_analysis.R will do the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

__Note: The following steps are intended to work only with RStudio__

## Steps to follow on this project 

1. Download the data source from the following link:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  and put into a folder on your local drive. Then unzip the downloaded folder and that will create a new folder with the name ```UCI HAR Dataset```.
2. Put the R script file```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```.
3. Open RStudio and then set its working directory to the parent folder of ```UCI HAR Dataset``` using ```setwd()``` function.

  For example if the data folder is ```"C:/COURSERA/Getting and Cleaning Data/Project/UCI HAR Dataset"```, the following command will set the working directory to parent directory of data folder
  
  ```setwd("C:/COURSERA/Getting and Cleaning Data/Project")```
3. In RStudio, write the following command to run ```run_analysis.R``` script, it will generate a new file ```tidy_data.txt``` in your working directory.

  For example if the data folder is ```"C:/COURSERA/Getting and Cleaning Data/Project/UCI HAR Dataset"```, the following command will set the working directory to parent directory of data folder
  
  ```setwd("C:/COURSERA/Getting and Cleaning Data/Project")```
4. In RStudio, write the following command to run ```run_analysis.R``` script, it will generate a new file ```tidy_data.txt``` in your working directory 
  
  ```source("run_analysis.R")```


## Dependencies

The ```run_analysis.R``` script file have the following dependencies
-  ```reshape2``` and
-  ```data.table```

Both dependencies will be installed automatically by ```run_analysis.R``` script during step 4 above. 



