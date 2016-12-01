#Getting and Cleaning Data Course Project

This file has instructions to run the code in file `run_analysis.R`, part of final assigment of **Getting and Cleaning Data Course**.

The [input](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  data files come as a zip file and it should be unziped in your working directory. A folder named `UCI HAR Dataset` will be created and all input files are in this folder.

### setup input files
On the working directory (the parent directory of `UCI HAR Dataset`) put the R script `run_analysis.R`. It will read the files on `UCI HAR Dataset` and create the resulting files on the current/working  directory .

###output files
This script will create 3 output files:
- `dataMerged.txt`: that correspond to the merged train and test data sets, as asked in first part of assignment,
- `dataMeanStd.txt`: that correspond to the measurements on the mean and standard deviation, as asked in the second part of assigment, and finally,
- `dataAverage.txt`: that correspond to  the average of each variable for each activity and each subject, as asked in the last part of the assigment.

###final notes
- Please, note that parts 3 and 4 of assignment (*use descriptive names for column names and activities*) was ==embebed== in the code that generates `dataMerged.txt`.
- only the first output file (`dataMerged.txt`) is mandatory in this assigment. I create the others by my own. To supress the output of these files, comment out the lines 104 and 123.

No arguments is need. Just source `run_analysis.R` and you' re good.




