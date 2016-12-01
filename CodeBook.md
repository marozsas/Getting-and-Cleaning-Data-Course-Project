#Data Dictionary for dataAverage.txt

##databook for dataAverage.txt
The purpose of this databok is provide an explanation of data format in the file `dataAverage.txt` created by  `run_analysis.R` script.

This file has 180 records (that correspond to 30 subjects by 6 activities) and 86 columns of average values of original data and 2 additional columns with the subject and activity.

###structure/fields
- activity: text, one of {"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING" }
	- identify the activity performed by the subject as a descriptive text; comes from `activity_labels.txt`
- subject; numeric [1:30]
	- the subject ID who performed the activity; comes from `train/subject_train.txt`for the *train* data set and from `test/subject_test.txt` for the *test* data set.
- follows 86 columns, a subset of the original data set, that their names have the words *mean* or *std*, and described in the `features_info.txt` from `UCI HAR Dataset`