
#####
#1 Merges the training and the test sets to create one data set.
#####
library (dplyr)
setwd ("/home/miguel/src/datasciencecoursera/CleaningData/assignment")

#You should create one R script called run_analysis.R that does the following.
#1 Merges the training and the test sets to create one data set.
# from David Hood infamous post, "Do we need the inertial folder ?  Short answer- no."


# The resultant file has the the subject, partition info (train or test), , the activity, and the original time/freq data; total of 10299 lines and 563 columns.

#3 Uses descriptive activity names to name the activities in the data set
# by my own I will use descriptive names for the name of original data set too

# train/test factor to identify the origin of data set
partition <- factor (c("train", "test"))
p_train <- partition[1]
p_test  <- partition[2]

# activity as factor
fileActivityLabels <-  "./UCI HAR Dataset/activity_labels.txt"
act_lbl <- read.table(fileActivityLabels, stringsAsFactors = TRUE)

#4 Appropriately labels the data set with descriptive variable names.
# read Train data and labels:
fileData <- "./UCI HAR Dataset/train/X_train.txt"
train <- read.table(fileData, row.names=NULL)

fileDataLabels <- "./UCI HAR Dataset/features.txt"
labels <- read.table(fileDataLabels, row.names=NULL)

# normalize labels by removing parenthesis and commas
labels$norm <- gsub ("()", "", labels[[2]], fixed= TRUE)
labels$norm <- gsub ("(", "_", labels$norm, fixed=TRUE)
labels$norm <- gsub (")", "", labels$norm, fixed=TRUE)
labels$norm <- gsub (",", "_", labels$norm, fixed=TRUE)
# change the names of columns
names(train) <- make.names(labels$norm, unique = TRUE)

fileSubject <- "./UCI HAR Dataset/train/subject_train.txt"
subject <- read.table(fileSubject, row.names=NULL)

fileActivity <-  "./UCI HAR Dataset/train/y_train.txt"
activity <- read.table(fileActivity, row.names=NULL)

# merge subject, partition TRAIN, activity
train$subject <- subject$V1
train$partition <- rep(p_train, nrow(train)) #train
# activity as numeric
#train$activity <- activity$V1
# activity as factor/descriptive name
train$activity <- factor(activity$V1, levels = act_lbl$V1, labels=act_lbl$V2)

# re-order 
train <- train %>% select (subject, partition, activity , everything())


# read Test data:
fileData <- "./UCI HAR Dataset/test/X_test.txt"
test <- read.table(fileData, row.names=NULL)

# change the names of columns
names(test) <- make.names(labels$norm, unique = TRUE)

fileSubject <- "./UCI HAR Dataset/test/subject_test.txt"
subject <- read.table(fileSubject)

fileActivity <- "./UCI HAR Dataset/test/y_test.txt"
activity <- read.table(fileActivity)

# merge subject, partition TEST, activity
test$subject <- subject$V1
test$partition <- rep(p_test, nrow(test)) #train
# activity as numeric
# test$activity <- activity$V1
# activity as factor/descriptive name
test$activity <- factor(activity$V1, levels = act_lbl$V1, labels=act_lbl$V2)

# re-order 
test <- test %>% select (subject, partition, activity, everything())

# bind train and test sets
data <- rbind (train, test)
fileOutput= "dataMerged.txt"
write.table(data, fileOutput, row.names=FALSE)
#####
# End of part 1
#####


#####
#2 Extracts only the measurements on the mean and standard deviation for each measurement.
#####
# all columns names
scol <- colnames(data)
# only column names that have mean or std
scol <- scol[grep ("mean|std", scol, ignore.case=TRUE)]
# a sub set
data2 <- data[, c("subject", "partition", "activity", scol)]
fileOutput= "dataMeanStd.txt"
write.table(data2, fileOutput, row.names=FALSE)
#####
#End of part 2
#####

#####
# please note that part 3 and 4 embebed in 1 
#####

#####
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####
# get only the measuments data
data.x <- subset(data, select= -c(subject, activity, partition))
# for each activity and each subject
data.group <- subset(data, select= c(activity, subject))
# data set with the average of each variable
data5 <- aggregate(data.x, data.group, mean)
fileOutput= "dataAverage.txt"
write.table(data5, fileOutput, row.names=FALSE)
#####
#End of part 5
#####