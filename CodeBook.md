Code Book
=============================

Coursera: Human Activity Project (CHAP)



# Input Data:


*File: activity_labels.txt*

Variables:

V1 - Unique integer representing 1 of 6 types of activity performed by the subjects 

V2 - Activity Name (text)

*Full Data Set:*

| V1 | V2                 |
|----|--------------------|
| 1  | WALKING            |
| 2  | WALKING_UPSTAIRS   |
| 3  | WALKING_DOWNSTAIRS |
| 4  | SITTING            |
| 5  | STANDING           |
| 6  | LAYING             |


*File: features.txt*

Variables:

V1 - Unique integer representing the 561 measurements taken with either an accelerometer or a gyroscope

V2 - Each measurement description (text) represents:
+ Device (accelerometer or gyroscope) that took the measurement +
+ Signal being measured ++ Axial direction of the signal if applicable ++ Time domain signal vs frequency domain signal ++ Variables (function) that was estimated from the signal

*Sample Values:*

| V1  | V2                   |
|-----|----------------------|
| 1   | tBodyAcc-mean()-X    |
| 2   | tBodyAcc-mean()-Y    |
| 3   | tBodyAcc-mean()-Z    |
| …   | …                    |
| 137 | tBodyGyro-energy()-X |
| 138 | tBodyGyro-energy()-Y |
| 138 | tBodyGyro-energy()-Z |
|     |                      |
| 504 | fBodyAccMag-std()    |
| …   | …                    |
| 561 | …                    |


The following definition of the measurement units is taken from the ACL documentation file **features_info.txt**.

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>  These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> | signals     |
|-------------------|
| tBodyAcc-XYZ |
| tGravityAcc-XYZ   |
| tBodyAccJerk-XYZ  |
| tBodyGyro-XYZ     |
| tBodyGyroJerk-XYZ |
| tBodyAccMag       |
| tGravityAccMag    |
| tBodyAccJerkMag   |
| tBodyGyroMag      |
| tBodyGyroJerkMag  |
| fBodyAcc-XYZ      |
| fBodyAccJerk-XYZ  |
| fBodyGyro-XYZ     |
| fBodyAccMag       |
| fBodyAccJerkMag   |
| fBodyGyroMag      |
| fBodyGyroJerkMag  |

> The set of variables that were estimated from these signals are: 

>| Var        | Description                                                                   |
|---------------|------------------------------------------------------------------------------|
| mean()        | Mean value                                                                   |
| std()         | Standard deviation                                                           |
| mad()         | Median absolute deviation                                                    |
| max()         | Largest value in array                                                       |
| min()         | Smallest value in array                                                      |
| sma()         | Signal magnitude area                                                        |
| energy()      | Energy measure. Sum of the squares divided by the number of values.          |
| iqr()         | Interquartile range                                                          |
| entropy()     | Signal entropy                                                               |
| arCoeff()     | Autorregresion coefficients with Burg order equal to 4                       |
| correlation() | correlation coefficient between two signals                                  |
| maxInds()     | index of the frequency component with largest magnitude                      |
| meanFreq()    | Weighted average of the frequency components to obtain a mean frequency      |
| skewness()    | skewness of the frequency domain signal                                      |
| kurtosis()    | kurtosis of the frequency domain signal                                      |
| bandsEnergy() | Energy of a frequency interval within the 64 bins of the FFT of each window. |
| angle()       | Angle between to vectors.                                  


> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

>| Addl       |
|-------------------|
| gravityMean       |
| tBodyAccMean      |
| tBodyAccJerkMean  |
| tBodyGyroMean     |
| tBodyGyroJerkMean |



*File: subject_train.txt*

Variables:

V1 - Integer (1 to 30) representing training subject who was being measured. Maps to corresponding measurement row in ./train/X_train.txt

*Raw Data Variables with All Values summarized by Count using R command:data.frame(t(table(read.table("./train/subject_train.txt"))))*| V1 | Freq |
|----|------|
| 1  | 347  |
| 3  | 341  |
| 5  | 302  |
| 6  | 325  |
| 7  | 308  |
| 8  | 281  |
| 11 | 316  |
| 14 | 323  |
| 15 | 328  |
| 16 | 366  |
| 17 | 368  |
| 19 | 360  |
| 21 | 408  |
| 22 | 321  |
| 23 | 372  |
| 25 | 409  |
| 26 | 392  |
| 27 | 376  |
| 28 | 382  |
| 29 | 344  |
| 30 | 383  |


*File: ./train/Y_train.txt*

Variables:

V1 - Integer (1-6) representing the training activity that was being measured. Maps to corresponding measurement row in ./train/X_train.txt

*Raw Data Variables with All Values summarized by Count using R command:data.frame(t(table(read.table("./train/Y_train.txt"))))*

| V1 | Freq |
|----|------|
| 1  | 1226 |
| 2  | 1073 |
| 3  | 986  |
| 4  | 1286 |
| 5  | 1374 |
| 6  | 1407 |

*File: ./train/X_train.txt*

Variables:

V1 - Measurement corresponding to one of the 561 features + subject + activity for the training set data (see *features.txt* file for information about measurement process and units).  Measurement is a number between -1 and 1 with 8 digits after the decimal

V2 - ...

...

V561 -  ...

*Sample Values:*

| V1        | V2          | … | … | V561        |
|-----------|-------------|---|---|-------------|
| 0.2885845 | -0.02029417 |   |   | -0.05862692 |
| …         | …           | … | … | …           |


*File: subject_test.txt*

Variables:

V1 - Integer (1 to 30) representing testing subject who was being measured. Maps to corresponding measurement row in ./test/X_test.txt

*Raw Data Variables with All Values summarized by Count using R command:data.frame(t(table(read.table("./test/subject_test.txt"))))*

| V1 | Freq |
|----|------|
| 2  | 302  |
| 4  | 317  |
| 9  | 288  |
| 10 | 294  |
| 12 | 320  |
| 13 | 327  |
| 18 | 364  |
| 20 | 354  |
| 24 | 381  |
*Files: ./test/Y_test.txt*  and *./test/X_test.txt* are the same structures and data types as *./train/Y_train.txt* and *./train/X_train.txt*


# Output Data -- Tidy Data Set:

*File: humanActivityData.txt*

Variables:

signal_desc -

function_var -

activity -

subject -

mean -



# Transformation Instructions 
## Raw data > Tidy Data 

Note: for detailed step-by-step code, refer to run_analysis.R 

**1. Merge the training and the test sets to create one data set. **

1. install packages:  data.table and plyr 
2. load the 8 ACL files documented in README.md
3. Add the following columns to the Training Data Set:  "group" with a value of "Training Data", "subject" with the subject id corresponding to the measurements and "activity_id" with the activity number corresponding to the measurements
4. Add the following columns to the Testing Set data:  "group" with a value of "Testing Data", "subject" with the subject id corresponding to the measurements and "activity_id" with the activity number corresponding to the measurements
5. Combine both the Training and Testing Data Sets into 1 data frame called *smartphoneData* which has 564 columns and 10299 rows

**2.  Extract only the measurements on the mean and standard deviation for each measurement. **

1. Extract the column names from smartphoneData that contain the characters mean() and std() and create 1 vector with 66 columns containing all of the mean + std column names
2. Create a subset of smartphoneData called*phoneData* that only contains the mean and std measurements. It will have 69 columns and 10299 rows.
3. Create a data frame called *signalData* by reshaping phoneData from wide to long. It will have 6 columns and 679,734 rows.

**3.  Use descriptive activity names to name the activities in the data set. **

1. Merge the data frame containing the activity labels (i.e., WALKING, STANDING, etc.) with signalData to add a column with the activity description.

**4.  Appropriately labels the data set with descriptive variable names.. **

1. Create a data frame called *mdf* that contains all 66 mean/std features.
2. De-construct the feature name to isolate the values for signal (i.e., BodyGyro JerkMag) + feature_var (Mean vs Standard Deviation) + Axis (X, Y, Z or NA)
3. Create a data frame that maps the existing signal with a more descriptive term (i.e., Body Jerk = Jerk of the Body, etc.)
4.  Merge the data frame containing the descriptive signals with mdf and create a new *tidy* data frame called *signalData* containing only the descriptive variables.

Tidy Data Set Variables:

| VARIABLE     | DESCRIPTION                                                                                                                                            | EXAMPLE                                       |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| orig_signal  | Un-altered “feature” value that contained either “mean()” or “std()” from raw data set                                                                 | i.e., fBodyAcc-mean()-X, tBodyGyro-std()-Y, … |
| function_var | If orig_signal contained “mean()” or “std()”                                                                                                           | Mean or Standard Deviation                    |
| signal_desc  | Descriptive text for the orig_signal and the axis, if applicable. Note that the time/frequency and accelerator/gyroscope indicators have been removed. | i.e., Body on the X-axis, Body on the Y-axis  |
| activity     | Descriptive text for 1 of the 6 activities being performed by subject when measurement was taken                                                       | i.e., SITTING, LAYING, …                      |
| group        | If measurement was part of the Training or Testing Group                                                                                               | Training Data or Testing Data                 |
| subject      | Integer between 1 and 30  indicating which subject was being measured                                                                                  | i.e., 1,2,3,4,…                               |
| value        | Measurement value in units described under *File: features.txt* above. Values range from -1 to 1 with 8 digits after the decimal                       | -0.99338166, 0.350949780, …                   |



