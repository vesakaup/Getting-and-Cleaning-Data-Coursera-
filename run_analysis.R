# The script does the following:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, independent tidy data set 
#       with the average of each variable for each activity and each subject


# install package reshape2 if not already installed


if (!"reshape2" %in% installed.packages()) {
        install.packages("reshape2")
}
if (!"data.table" %in% installed.packages()) {
        install.packages("data.table")
}

# load libraries and data

library(reshape2)
library(data.table)

fileName = "data.zip"
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir = "UCI HAR Dataset"
if(!file.exists(fileName)){
        download.file(fileUrl, fileName, mode = "wb")    
}
unzip = ("data.zip")



# read data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "activity")

# extract feature names and extract mean and std features only
names(X_test) = features[,2]
names(X_train) = features[,2]
mean_std_features <- grepl("mean\\(\\)|std\\(\\)", features[,2])

X_train = X_train[,mean_std_features]
X_test = X_test[,mean_std_features]

# Merge the X train and test sets 
train <- cbind(as.data.table(subject_train),y_train,X_train)
test <- cbind(as.data.table(subject_test),y_test,X_test)
dataset <- rbind(train,test)

# use activity names 
act_group <- factor(dataset$activity)
levels(act_group) <- activity_labels[,2]
dataset$activity <- act_group


# create a tidy data set with the average of each variable for each activity and subject

data <- melt(dataset,id=c("subject","activity"))
tidy_set <- dcast(data, subject + activity ~ variable, mean)
write.table(tidy_set, "tidy_data.txt", sep = ",")


