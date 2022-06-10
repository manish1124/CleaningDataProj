Getting and Cleaning Data Course Project	

The structure of the data set is described in the Data section, its variables are listed in the Variables section, and the transformations that were carried out to obtain the data set based on the source data are presented in the Transformations section.

Data

The tidyData.csv filecontains space-separated values.

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.

Variables
Each row contains data for a subject across various activity types and averaged measurements across features

Transformations
The zip file containing the source data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The following transformations were applied to the source data:

 - The X,Y and Subject files from training and test sets were merged
 - The measurements for mean and standard deviation were extracted and the others were discarded.
 - The activity identifiers were replaced withactivity names 
 - The variable names were replaced with descriptive variable names, using the following set of rules:

From the data set above the final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the run_analysis.R R script (see README.md file for usage instructions)
