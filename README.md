Activity Monitoring - Getting and Cleaning Data Course Project from Johns Hopkins University by Coursera


In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

Context
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization from Coursera by Johns Hopkins University. This repository hosts the R code and documentation files for the project.

Purpose
The purpose of the project is to obtain tidy dataset by collecting, working with, and cleaning a raw data set. The goal is to prepare tidy data that can be used for later analysis.

The data for the project are in the following zip file : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip When unzipped they are included in the working directory, in the folder "UCI HAR Dataset". The details of the files included in the zipped file are available in the CodeBook, based on the file features.txt which has been made usin. This folder comprises two more folders named "train" and "test" where the data to be used for the analysis are incuded. These folders include also a folder called "Inertial Signals" which is not included in the dataset.

Executing the R code in RStudio

Processing
I created the script "run_analysis.R" which does the following:

It merges the training and the test sets to create one data set. The files used are txt files in the unzipped directories "train" and "test" with names starting with "subject_" with subject IDs, "X_" with measurements and "y_" with labels. They are read seperately and then bound together for "test" and "train" and finally bound together to form "alldata".

It extracts only the columns that include the measurements on the mean and standard deviation for each measurement, together with the key columns presenting the subject ID and the Activity. The columns extracted are those having the terms mean() or std() in the name of the variable. The "fixed" parameter is used to exclude cases like meanFreq().

Uses descriptive activity names to name the activities in the data set. For this purpose the file activity_labels.txt is used.

Appropriately labels the data set with descriptive variable names. The replacement uses the structure of the variable names. It has been developed and tested using the features.txt file.

From the data set in step 4, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Files submitted
The following files have been included in this repo:

the script "run_analysis.R"
a code book "CodeBook.wd" that describes the variables, the data, and
the tidy data set "tidyData.csv" produced by the script as indicated below,
the present "README.md" file
Packages required
The extra package that were used are data.table and reshape2

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012
