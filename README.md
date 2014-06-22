Repository:   GetAndCleanDataProject
=============================

Coursera: Human Activity Project (CHAP)


**Background**

The study, *Human Activity Recognition Using Smart Phones*, was performed by *Smartlab - Non Linear Complex Systems Laboratory*. This study produced a human activity recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The ADL data will be referred to as “Raw" data for the purpose of the secondary study, *Coursera – Human Activity Project* or (CHAP).

The ADL study data was obtained from UC Irvine, and more information can be obtained here: 
 <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
 
**CHAP Project**

The following project description is taken from the **Getting and Cleaning Data** Class at Coursera.org. <https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions>

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
>
>You should create one R script called run_analysis.R that does the following. 
>
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

**Project Assumptions**

Based on the number of postings in the Discussion Forum under “Course Project”, there seemed to be a lot of confusion regarding the instructions for this assignment. I kept up with the postings as best I could and made numerous changes to my code for CHAP as my understanding of the assignment became clearer. As the deadline for completion approached, I decided to stick with my “most recent” current version of this assignment. I believe that the most important goals for this project were to (1) come up one’s own interpretation of the instructions, (2) complete the assignment based on that interpretation and (3) explain the steps taken to produce the results.

From the instructions in Step #5, I made the following choices:

-  I began with the tidy data set produced in Step #4 instead of the original data set containing the full set of measurements.  This meant that the measurements to be used in the calculation for average were either originally a "mean" or a "standard deviation" measurement. 
-  Because I would be only averaging across "mean" and "standard deviation" measurements, the logical choice was to include the original measurement type (mean vs SD )as one of the variables to group by. Therefore, the final mean value in the data set is either a mean value of a number of other Mean measurements or a mean value of Standard Deviation measurements.
-  To produce the final *tidy data set*, I interpreted "the average of each variable for each activity and each subject" as follows:  
**Calculate the mean of all measurements from the *tidy data set* produced in Step 4 in "Long Format (instead of wide)" and group the mean values in Long Format by the following variables:
<ul>
	<dd>- Signal Description (i.e., Body on the Y-axis, ... ) + </dd>
	<dd>- Original Function Measurement (Mean or Standard Deviation) + </dd>
	<dd>- Activity (Standing, etc.) +</dd>
	<dd>- Subject Identifier (#1, #2, etc.)</dd></ul>**

*PLEASE REFER TO THE CODE BOOK FOR THE COMPLETE TRANSFORMATION INSTRUCTIONS AND VARIABLE DEFINITIONS.*

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

From CHAP

1. run_analysis.R -- Code used to transform the Raw Data and produce the tidy data set in file: humanActivityData.txt
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

Refer to CodeBook.md for information about the data, the variables and the transformation process.


