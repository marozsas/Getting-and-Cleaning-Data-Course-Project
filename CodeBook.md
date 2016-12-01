#Data Dictionary for the merged train and test data sets

##databook for dataMerged.txt
The purpose of this databok is provide an explanation of data format in the file `dataMerged.txt` created by  `run_analysis.R` script.

The file has 10299 (7352+2947) records by 564 columns.
The file comes from a merge of the `X_train.txt` and `X_test.txt` original files in `UCI HAR Dataset`, that have 7352 and 2947 records. respectively and 561 columns.

To the original columns was added 3 aditional columns as follow:

- subject; numeric [1:30]
	- the subject ID who performed the activity; comes from `train/subject_train.txt`for the *train* data set and from `test/subject_test.txt` for the *test* data set.
- partition: text, one of {"train", "test"}
 	- identify the origin of the record in the original data set.
- activity: text, one of {"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING" }
	- identify the activity performed by the subject as a descriptive text; comes from `activity_labels.txt`
- follows the 561 columns in the original data set, as described in the `features_info.txt` from `UCI HAR Dataset`
