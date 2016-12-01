#Getting and Cleaning Data Course Project

###introduction
This file has instructions to run the code in file `run_analysis.R`, part of final assigment of **Getting and Cleaning Data Course**.

The [input](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  data files come as a zip file and it should be unziped in your working directory. A folder named `UCI HAR Dataset` will be created and all input files are read from this folder.

###steps to transform the original data in the final result
The output data set is obtained from the following steps:

1. a merged data set is built from 2 sets: `X_train.txt` and `X_test.txt` original files in `UCI HAR Dataset`. Two additional columns are added to this set: ***subject*** and ***activity***. They come from `subject_train.txt` (and `subject_test.txt`) and `y_train.txt` (and `y_test.txt`).
2. descriptive names for columns names are read from `features.txt`.
3. descriptive names for content of **activity** column are read from `activity_labels.txt`.
4. a subset is created from the above by selecting only the column names that have the words *mean* or *std* in their names.
5. finally, another subset is created from the above, with the average values of the measured values and grouped by subject and activity, resulting in an output with 180 rows (30 subject by 6 activities) and 86 columns of data (plus activity and subject)

### setup input files
On the working directory (the parent directory of `UCI HAR Dataset`) put the R script `run_analysis.R`. It will read the files on `UCI HAR Dataset` and create the resulting file `dataAverage.txt` on the current/working  directory.

###output file 
This script will create an output file named  `dataAverage.txt` on the current/working  directory that correspond to  the average of each variable that have the words *mean* or *std* in their name, for each activity and each subject.

###final notes

No arguments is need. Just source `run_analysis.R` and you' re good.




