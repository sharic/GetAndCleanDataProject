Repository:   GetAndCleanDataProject
=============================

Coursera: Human Activity Project (CHAP)


**Background**

The study, *Human Activity Recognition Using Smart Phones*, was performed by *Smartlab - Non Linear Complex Systems Laboratory*. This study produced a human activity recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The ADL data will be referred to as “Raw" data for the purposes of the secondary study, *Coursera – Human Activity Project* or (CHAP).

The ADL study data was obtained from UC Irvine, and more information can be obtained here: 
 <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
 

**Files**

From ACL

1. activity_labels.txt -- Links the 6 class labels with their activity name. (i.e., Walking, etc.)
2. features.txt -- List of all features. (i.e., tBodyAcc-mean()-X, tBodyAcc-iqr()-Z, fBodyAcc-bandsEnergy()-1,8  etc.)
3. subject_train.txt -- Each row identifies the training subject who performed the activity for each window sample. Its range is from 1 to 30.
4. Y_train.txt -- Training labels. (1-6 mapping to activity_labels.txt data)
5. X_train.txt -- Features training set data  -- normalized and bounded within [-1,1]
6. subject_test.txt -- Each row identifies the testing subject who performed the activity for each window sample. Its range is from 1 to 30.
7. Y_test.txt -- Test labels. (1-6 mapping to activity_labels.txt data)
8. X_test.txt -- Features testing set data  -- normalized and bounded within [-1,1]

Created for CHAP

1. run_analysis.R -- Code used to transform the Raw Data and produce the tidy data set: humanActivityData.txt
2. humanActivityData.txt -- Tidy data set produced by raw data transformation processed in run_analysis.R -- Headers are included
3. CodeBook.md -- Describes the variables, data and transformations

 
**Downloading**

The raw data for CHAP (ADL data sets) can be downloaded here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>




The CHAP files can be downloaded at the following links:

Github repository containing all CHAP files.
<https://github.com/sharic/GetAndCleanDataProject>

Code Book:
<https://github.com/sharic/GetAndCleanDataProject/blob/master/CodeBook.md>

R code to that transform the ADL data:
<https://github.com/sharic/GetAndCleanDataProject/blob/master/run_analysis.R>

Tidy data set of human activity data
<https://github.com/sharic/GetAndCleanDataProject/blob/master/humanActivityData.txt>

**Instructions**


Unzip the ACL Dataset.zip file downloaded from UC Irvine.
The top-level directory is called “UCI HAR Dataset”

For the transformation R script to run properly, make this your working directory.

There are 2 directories under “UCI HAR Dataset” called “test” and “train”.  
There is another directory called “Inertial Signals” under both the “test” and “train” directories. 
The 2 “Inertial Signals” directories can be deleted. They are not used for CHAP.

ACL File Directory Structure:

      UCI HAR Dataset                 [this should be your working directory]
           /test  
               /Inertial Signals      [can delete]
           /train
              /Inertial Signals       [can delete]
    

In R, run the file, “run_analysis.R”.
This will produce the tidy date text file called “humanActivityData.txt” in your working directory.

To load “humanActivityData.txt” into R, make sure that the file is in your working directory and run the following command:
*write.table(meanSubActFunSig,file="humanActivityData.txt",row.names=FALSE, col.names=TRUE, sep=" ")*

Refer to CodeBook.md for information about the data, the tidy data set variables and the transformation process.


