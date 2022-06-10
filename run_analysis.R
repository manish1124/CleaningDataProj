# Getting and Cleaning Data Project
# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# 
# Extracts only the measurements on the mean and standard deviation for each measurement.
# 
# Uses descriptive activity names to name the activities in the data set
# 
# Appropriately labels the data set with descriptive variable names.
# 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##=============================================================================================
#Load packages
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
path <- getwd()

##=============================================================================================
# #Load files from Test Data Set
##===============================
testx<-read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\test\\x_test.txt")
testy<-read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\test\\y_test.txt")
colnames(testy)<-c("activitynumber")
testsubject<-read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\test\\subject_test.txt")
colnames(testsubject)<-c("SubjectNum")
##=============================================================================================
# #Load files from Test Data Set
##===============================
trainx<-read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\train\\x_train.txt")
trainy<-read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\train\\y_train.txt")
colnames(trainy)<-c("activitynumber")
trainsubject<-read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\train\\subject_train.txt")
colnames(trainsubject)<-c("SubjectNum")
##=============================================================================================
# Load Meta Data
##===============

# Load Activity Label
##====================
activitylabels <- read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\activity_labels.txt")
colnames(activitylabels)<-c("activitynumber","activityname")

# Load Feature List
##==================
features <- read.table("C:\\Users\\mashah\\Desktop\\R\\GettingandCleaningDataProject\\UCI HAR Dataset\\features.txt")
colnames(features)<-c("featurenumber","feature")

# Reduce the feature list to keep mean and standard deviation
##============================================================
featuresfinal<-features[grep("(mean|std)\\(\\)",features$feature),]
featuresfinal<-featuresfinal[order(featuresfinal$featurenumber),]
featurenumber<-featuresfinal$featurenumber
featurename<-featuresfinal$feature
featurename<-gsub("[()]","",featurename)

##=============================================================================================
# Keep the relevant columns from test and train dataset and merge sets
testx<-testx[,c(featurenumber)]
trainx<-trainx[,c(featurenumber)]
# 
# ##Merge train and test individually with subject and activity
train<-cbind(trainsubject,trainy,trainx)
test<-cbind(testsubject,testy,testx)
# 
# # # Merge test and train
combinedtesttrain<-rbind(test,train)
colnames(combinedtesttrain)<-c("SubjectNum","Activity",featurename)
##=============================================================================================
setDT(combinedtesttrain)
combinedtesttrain[["Activity"]] <- factor(combinedtesttrain[, Activity]
                                          , levels = activitylabels[["activitynumber"]]
                                          , labels = activitylabels[["activityname"]])

combinedtesttrain[["SubjectNum"]] <- as.factor(combinedtesttrain[, SubjectNum])

combinedtesttrain2 <- reshape2::melt(data = combinedtesttrain, id = c("SubjectNum", "Activity"))
combinedtesttrain3 <- reshape2::dcast(data = combinedtesttrain2, SubjectNum + Activity ~ variable, fun.aggregate = mean)

data.table::fwrite(x = combinedtesttrain3, file = "tidyData.csv", quote = FALSE)
##=============================================================================================
