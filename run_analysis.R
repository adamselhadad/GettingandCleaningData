#run_analysis.R
#Adam Elhadad July 10th, 2019
#This script loads the data in the working directory into R and combines it.  It then
#Summarizes the data into a .txt file named SummarizedData.txt

# Load Needed Packages
library(dplyr)

# 1) Import Data into R and Merge
# Import Common Data
features<-read.table(file.path("UCI HAR Dataset","features.txt"))
activityLabels<-read.table(file.path("UCI HAR Dataset","activity_labels.txt"))
colnames(activityLabels)<-c("Id","Activity")

# Import Test Data
testSubjects <- read.table(file.path("UCI HAR Dataset","test","subject_test.txt"))
testData <- read.table(file.path("UCI HAR Dataset","test","X_test.txt"))
testLabels <- read.table(file.path("UCI HAR Dataset","test","y_test.txt"))

# Import Training Data
trainSubjects <- read.table(file.path("UCI HAR Dataset","train","subject_train.txt"))
trainData <- read.table(file.path("UCI HAR Dataset","train","X_train.txt"))
trainLabels <- read.table(file.path("UCI HAR Dataset","train","y_train.txt"))

# Merge the data together
wearableData<-rbind(cbind(testSubjects,testLabels,testData),cbind(trainSubjects,trainLabels,trainData))
colnames(wearableData)<-c("Subject","Activity",as.character(features$V2))

# remove varaibles no longer being used
rm(testData, testLabels, testSubjects, features, trainData, trainLabels, trainSubjects)

# 2) Extract only Mean and Standard Deviation Measurements 
# parse the column names for mean and Deviation
releventCol<-grepl("Subject|Activity|mean|std",colnames(wearableData))
wearableData<-wearableData[, releventCol]
rm(releventCol)
# 3) Uses descriptive activity names to name the activities in the data set
wearableData$Activity <- factor(wearableData$Activity, levels = activityLabels[,1], labels = activityLabels[,2])

# 4) Appropriately labels the data set with descriptive variable names.
# get the names of the columns
colNames<-colnames(wearableData)
# Swtich t and f to time and frequency
colNames<- gsub("^f", "Frequency Domain ",colNames)
colNames<- gsub("^t", "Time Domain ", colNames )
# Some Have BodyBody remove those and add a space
colNames<- gsub("BodyBody", "Body", colNames )
colNames<- gsub("Body", "Body ", colNames )
# Replace Accelerometer and Gyroscope
colNames<- gsub("Acc", "Accelerometer ", colNames )
colNames<- gsub("Gyro", "Gyroscope ", colNames )
#Put a space after Gravitiy
colNames<- gsub("Gravity", "Gravity ", colNames )
colNames<- gsub("Jerk", "Jerk ", colNames )
# Change the Calculations Shorthands
colNames<- gsub("-meanFreq", "Mean Frequency ", colNames )
colNames<- gsub("-mean", "Mean ", colNames )
colNames<- gsub("-std", "Standard Deviation ", colNames )
colNames<- gsub("Mag", "Magnitude ", colNames )
# Remove Brackets
colNames<- gsub(" \\(", "", colNames )
colNames<- gsub("\\)", "", colNames )
colnames(wearableData)<-colNames
rm(colNames)


# 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidySet<-wearableData %>% group_by(Subject, Activity) %>% summarise_each(mean)
write.table(tidySet,"SummarizedData.txt")
