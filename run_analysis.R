#####
#1 Merges the training and the test sets to create one data set.
#####
library (dplyr)
setwd ("/home/miguel/src/datasciencecoursera/CleaningData/assignment")

#You should create one R script called run_analysis.R that does the following.
#1 Merges the training and the test sets to create one data set.
# from David Hood infamous post, "Do we need the inertial folder ?  Short answer- no."

#3 Uses descriptive activity names to name the activities in the data set

# activity as factor
fileActivityLabels <-  "./UCI HAR Dataset/activity_labels.txt"
act_lbl <- read.table(fileActivityLabels, stringsAsFactors = TRUE)

#4 Appropriately labels the data set with descriptive variable names.
# read Train data 
fileData <- "./UCI HAR Dataset/train/X_train.txt"
train <- read.table(fileData, row.names=NULL)
# read labels
fileDataLabels <- "./UCI HAR Dataset/features.txt"
labels <- read.table(fileDataLabels, row.names=NULL)
# change the names of columns. Use make.names to avoid duplicated names.
names(train) <- make.names(labels$V2, unique = TRUE)

# read subject table
fileSubject <- "./UCI HAR Dataset/train/subject_train.txt"
subject <- read.table(fileSubject, row.names=NULL)
# read activity table
fileActivity <-  "./UCI HAR Dataset/train/y_train.txt"
activity <- read.table(fileActivity, row.names=NULL)

# add subject and activity to the train set
train$subject <- subject$V1
train$activity <- factor(activity$V1, levels = act_lbl$V1, labels=act_lbl$V2)

# re-order 
train <- train %>% select (subject, activity , everything())

# read Test data:
fileData <- "./UCI HAR Dataset/test/X_test.txt"
test <- read.table(fileData, row.names=NULL)
# change the names of columns. Use make.names to avoid duplicated names.
names(test) <- make.names(labels$V2, unique = TRUE)
# read subject table
fileSubject <- "./UCI HAR Dataset/test/subject_test.txt"
subject <- read.table(fileSubject)
# read activity table
fileActivity <- "./UCI HAR Dataset/test/y_test.txt"
activity <- read.table(fileActivity)

# add subject and activity to the train set
test$subject <- subject$V1
test$activity <- factor(activity$V1, levels = act_lbl$V1, labels=act_lbl$V2)

# re-order 
test <- test %>% select (subject,  activity, everything())

# bind train and test sets
data <- rbind (train, test)
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
# build a sub set
data2 <- data[, c("subject", "activity", scol)]
#####
#End of part 2
#####

#####
# please note that part 3 and 4 embebed in 1 
#####

#####
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####
# get only the measuments data - SOLUTION 1
#data2.x <- subset(data2, select= -c(subject, activity))
# for each activity and each subject
#data2.group <- subset(data2, select= c(activity, subject))
# data set with the average of each variable
#data5 <- aggregate(data2.x, data2.group, mean)
#
# get only the measuments data - SOLUTION 2 - best
data5 <- data2 %>% group_by(subject, activity) %>% summarise_all("mean")

fileOutput= "dataAverage.txt"
write.table(data5, fileOutput, row.names=FALSE)
#####
#End of part 5
#####