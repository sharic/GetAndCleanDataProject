# run_analysis.R
# coded by Shari Cartun

# install/load data.table and plyr packages
install.packages("data.table")
install.packages("plyr")
library(data.table)
library(plyr)

# load file that Links the class labels with their activity name and sets the column names
activity <- read.table("activity_labels.txt")
setnames(activity, colnames(activity), c("activity_id","activity"))

# load/transpose file that of features that link to the column names in the data sets
features <- as.matrix(read.table("features.txt"))
rows <- nrow(features )
featuresTrans <- t(data.frame(features[1:rows,2]))

#### LOAD TRAINING DATA SETS ####
# loads the following files:
#  - subject who performed the training activity
#  - training labels of activity being measured (i.e., Standing, Sitting, etc.)
#  - training data
subjectTrain <- read.table("./train/subject_train.txt")
trainLabel <- read.table("./train/Y_train.txt")
trainSet <- read.table("./train/X_train.txt")

# change column names
# add 3 columns to track the following variables: "group", "subject", and "activity"
setnames(trainSet, colnames(trainSet), featuresTrans)
trainSet <- cbind(trainSet, group="Training Data")
trainSet <- cbind(trainSet, subjectTrain)
colnames(trainSet)[563] <- "subject"
trainSet <- cbind(trainSet, trainLabel)
colnames(trainSet)[564] <- "activity_id"


#### LOAD TESTING DATA SETS ####
# loads the following files:
#  - subject who performed the testing activity
#  - testing labels of activity being measured (i.e., Standing, Sitting, etc.)
#  - testing data
subjectTest <- read.table("./test/subject_test.txt")
testLabel <- read.table("./test/Y_test.txt")
testSet <- read.table("./test/X_test.txt")

# change column names
# add 3 columns to track the following variables: "group", "subject", and "activity"
setnames(testSet, colnames(testSet), featuresTrans)
testSet <- cbind(testSet, group="Testing Data")
testSet <- cbind(testSet, subjectTest)
colnames(testSet)[563] <- "subject"
testSet <- cbind(testSet, testLabel)
colnames(testSet)[564] <- "activity_id"

## Combine the training and the test sets to create one data set -- called smartphoneData
smartphoneData <- rbind(trainSet, testSet)
# View(smartphoneData[c(1:3,2000:2004,9000:9004,10000:10005),c(1:4,562:564)])

### Completion of: 1. Merges the training and the test sets to create one data set. ###



#### EXTRACT MEASUREMENTS ON MEAN AND SD ####

# create indexes to track the column locations for containing the strings "mean()" or "std()" 
meanColIndex <- grep("mean()",names(smartphoneData), fixed=TRUE)
stdColIndex <- grep("std()",names(smartphoneData), fixed=TRUE)

# column columns names containing "mean()"
meanColName <- vector(mode="numeric", length=length(meanColIndex))
counter <- 0
for(i in meanColIndex) {
  counter <- counter+1
  meanColName[counter] <- names(smartphoneData[i])
}

# column columns names containing "std()"
stdColName <- vector(mode="numeric", length=length(stdColIndex))
counter <- 0
for(i in stdColIndex) {
  counter <- counter+1
  stdColName[counter] <- names(smartphoneData[i])
}

# combine lists of all column names with either "mean()" or "std()"
orig_signal <- c(meanColName,stdColName)
cols <- length(orig_signal)

# create data set containing only the measurement data for Mean and Std columns
phoneData <- cbind(smartphoneData[, c(orig_signal)], smartphoneData[,562:564])

# reshape phoneData so that mean/std measurements are rows instead of columns
signalData <- reshape(phoneData, 
                      varying = orig_signal,
                      v.names = "value",
                      timevar = "orig_signal", 
                      times = orig_signal,
                      direction = "long")

### Completion of: 2. Extracts only the measurements on the mean and standard deviation for each measurement. ###


#### USE DESCRIPTIVE ACTIVITY NAMES ####

## Get numbers for testing before using "merge" to add "activity" name to signalData
## nrow(signalData)
## [1] 679734
##
## table(signalData$activity_id)
## 
## 1      2      3      4      5      6 
## 113652 101904  92796 117282 125796 128304 

# Merge activity and signalData dataframes
signalData = merge(activity, signalData, by="activity_id", all.y=TRUE)

## Check to confirm the numbers matched those taken before the merge

## nrow(signalData)
## [1] 679734
## 
## table(signalData$activity_id)
## 
## 1      2      3      4      5      6 
## 113652 101904  92796 117282 125796 128304 
## 
## table(signalData$activity, signalData$activity_id)
## 
##                         1     2      3      4      5      6
## LAYING                  0      0      0      0      0 128304
## SITTING                 0      0      0 117282      0      0
## STANDING                0      0      0      0 125796      0
## WALKING            113652      0      0      0      0      0
## WALKING_DOWNSTAIRS      0      0  92796      0      0      0
## WALKING_UPSTAIRS        0 101904      0      0      0      0

### Completion of: 3. Uses descriptive activity names to name the activities in the data set. ###


#### CREATE DESCRIPTIVE VARIABLE NAMES / CREATE TIDY DATA SET ####

# created data frame with mean/std measurements
mdf <- as.data.frame(orig_signal, stringsAsFactors=FALSE)
# find location of "-" and add it to data frame
dashloc <- regexpr("-",mdf[,1])[1:cols]
mdf <- cbind(mdf, dashloc)

# extract measurement name before the "-" and add it to data frame
signals <- substr(mdf[,1],1,mdf$dashloc-1)
mdf <- cbind(mdf, signals, stringsAsFactors=FALSE)

# create a variable to indicate if measurement is a mean or std calculation
# default value to "Mean"
mdf <- cbind(mdf, function_var="Mean", stringsAsFactors=FALSE)

# determine which measurements are for "Standard Deviation" and update accordingly
isStd <- regexpr("std",mdf[,1])[1:cols]
mdf <- cbind(mdf, isStd, stringsAsFactors=FALSE)
stdFlag <- mdf$isStd > 0
mdf$function_var[stdFlag] <- "Standard Deviation"

# determine which measurements are based on an Axis (X, Y or Z)
# update data frame (if applic) with another variable to hold axis information
isAxial <- regexpr("-[XYZ]",mdf[,1])[1:cols]+1
mdf <- cbind(mdf, isAxial, stringsAsFactors=FALSE)
mdf <- cbind(mdf, axis="NA", stringsAsFactors=FALSE)

for(i in 1:cols) {
  if(mdf$isAxial[i] > 0) {
    mdf$axis[i] <- substr(mdf[i,1], mdf$isAxial[i], mdf$isAxial[i]+1)
  }
}

# remove the "Acc" and "Gyro" in the variable since this is not relevant for assignment
# add to a new column in data frame
removeOrigin <- sub("Acc", "", mdf$signals)
removeOrigin <- sub("Gyro", "", removeOrigin)
mdf <- cbind(mdf, signalsClean = removeOrigin, stringsAsFactors=FALSE)

# confirm unique values for measurements and clean data
table(mdf$signalsClean)

# clean up mis-labeled values with the characters "BodyBody"
mdf$signalsClean[mdf$signalsClean=="fBodyBodyJerkMag"] <- "fBodyJerkMag"
mdf$signalsClean[mdf$signalsClean=="fBodyBodyMag"] <- "fBodyMag"

# confirm successful cleanup
table(mdf$signalsClean)

# remove the prefex of "t" and "f" in the variable since this is not relevant for assignment
mdf$signalsClean <- substring(mdf$signalsClean,2,nchar(mdf$signalsClean))

# create new data frame that map descriptive labels to current labels
signalDesc <- data.frame(orig_signal=c("Body","BodyJerk","BodyJerkMag","BodyMag","Gravity","GravityMag"), 
                         Desc=c("Body","Jerk of the Body","Jerk of the Body Magnitude","Body Magnitude",
                                      "Gravity","Gravity Magnitude"),
                         stringsAsFactors=FALSE)

# create a new column with the final description of the measurement
axisExists <- !mdf$axis=="NA"

mdf <- cbind(mdf, signal_desc="NA", stringsAsFactors=FALSE)

for(i in 1:cols) {
    mdf$signal_desc[i] <- signalDesc$Desc[mdf$signalsClean[i]==signalDesc$orig_signal]
    
    if(axisExists[i]) {
      mdf$signal_desc[i] <- paste(mdf$signal_desc[i]," on the ", mdf$axis[i], "-axis", sep="")      
    }
  }

# update signalData with the descriptive names by merging it with signalDesc
# This completes the creation of the 1st tidy data set!
signalData <-  merge(mdf[,c(1,4,9)], signalData[,2:6], by="orig_signal", all.y=TRUE)

### Completion of: 4. Appropriately labels the data set with descriptive variable names. ###


#### CREATE A 2ND TIDY DATA SET  ####

# calculate the mean of all of the measurements
# and group the calculated mean values by:
#     (1) Signal Description (i.e., Body on the Y-axis ) + 
#     (2) Original Function (Mean vs SD) + 
#     (3) Activity (Standing, etc.) +
#     (4) Subject (#1, #2, etc.)
meanSubActFunSig <- ddply(signalData, .(signal_desc, function_var, activity, subject), summarize, mean=mean(value))

# sort the resulting data frame by Subject,Signal Description, Original Function and Activity
# rename the rows to a numerical index
meanSubActFunSig <-  meanSubActFunSig[with(meanSubActFunSig, order(subject,signal_desc,function_var,activity)),]
rownames(meanSubActFunSig) <- 1:nrow(meanSubActFunSig)

### Completion of: 5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. ###

##