Repository:   GetAndCleanDataProject
=============================

Coursera: Human Activity Project (CHAP)


**Background**

The study, *Human Activity Recognition Using Smart Phones*, was performed by *Smartlab - Non Linear Complex Systems Laboratory*. This study produced a human activity recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The ADL data will be referred to as “Raw" data for the purposes of the secondary study, *Coursera – Human Activity Project* or (CHAP).

The ADL study data was obtained from UC Irvine, and more information can be obtained here: 
 <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
 

**Files Used**

1. activity_labels.txt
2. features.txt 
3. subject_train.txt 
4. Y_train.txt 
5. X_train.txt 
6. subject_test.txt 
7. Y_test.txt 
8. X_test.txt 
9. run_analysis.R
10. humanActivityData.txt
11. CodeBook.md
 
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
This will produce the tidy date text file called “humanActivityData.txt” in the “UCI HAR Dataset” directory.

Refer to CodeBook.md for information about the data, the tidy data set variables and the transformation process.


