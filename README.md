###Introduction
This repository contains my course project for Coursera course: Getting and Cleaning Data.  
List of files that you will find in the repository:  
 1. `run_analysis.R` which is the script for performing the extraction and tidying of the data.  
 2. [`CodeBook.md`](https://github.com/Galvontyr/Course-Project/blob/master/CodeBook.md) which contains the description of all the variables and data.  
 3. `README.md` which contains this introduction but mainly focuses on explaining all the scripts used in `run_analysis.R` to achieve its goal.  
<br /><br />

####`run_analysis.R` explained
**Important:** Before we start, this code assumes that the *Samsung data* is available in the working directory in an *unzipped* UCI HAR Dataset folder  
<br />

First of, we need to load the packages that we will use later in the script:
```r
1 library(plyr)
2 library(reshape2)
```

Next, let us read all the relevant files using `read.table`. Again this assumes that the *Samsung data* is available in the working directory in an *unzipped* UCI HAR Dataset folder  

Let us start first with the `UCI HAR Dataset/test` files and read them. 
```r
5 test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
6 test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt")
7 test_subj <- read.table("./UCI HAR Dataset/test/subject_test.txt")
```
Use `View()` to inspect the files. Upon inspection we can see that: 
* `test_x` has 2947 observations with 561 variables which contain the data readings for test  
* `test_y` has 2947 observations with 1 variable. Using `unique()` we can also determine that this file has a value of 1:6 which would mean that these values corresponds to the activity labels indicated in `UCI HAR Dataset/activity_labels.txt`  
* `test_subj` has 2947 observations with 1 variable. Using `unique()` we can also determine that this file has values within the range of 1:30 which conforms to what `UCI HAR Dataset/README.txt` indicated -- these numbers are the IDs of the human subjects.  

Next up, lets read the `UCI HAR Dataset/train` files
```r
8 train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
9 train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt")
10 train_subj <- read.table("./UCI HAR Dataset/train/subject_train.txt")
```
Use `View()` to inspect the files. Upon inspection we can see that: 
* `train_x` has 7352 observations with 561 variables which contain the data readings for train  
* `train_y` has 7352 observations with 1 variable. Using `unique()` we can also determine that this file has a value of 1:6 which would mean that these values corresponds to the activity labels indicated in `UCI HAR Dataset/activity_labels.txt`  
* `train_subj` has 7352 observations with 1 variable. Using `unique()` we can also determine that this file has values within the range of 1:30 which conforms to what `UCI HAR Dataset/README.txt` indicated -- these numbers are the IDs of the human subjects.  

And lastly, read the `UCI HAR Dataset/features.txt` file
```r
11 features <- read.table("./UCI HAR Dataset/features.txt")
```
Use `View()` to inspect the file. Upon inspection we can see that `features` has 561 obeservations with 2 variables which conforms to what `UCI HAR Dataset/README.txt` indicated -- these are the 561 variables.  

We already know that these variables will be used as our column names. So to make it easier for us to bind these later, let us convert the `features` from data frame to a list
```r
12 feature_names <- features[,2]
```
Now that we've determined all our raw files, lets merge them all together. First up, we need to create and empty data frame and then populate it with `test_x`
```r
15 tidy_test <- data.frame()
16 tidy_test <- test_x
```
Next, we use the features list that we converted earlier as our column names
```r
17 colnames(tidy_test) <- feature_names
```
Next, use `cbind` to add `test_y` and `test_subj`
```r
18 tidy_test <- cbind(test_y, test_subj, tidy_test)
```
and change their column names to `Activity` and `Subject`
```r
19 colnames(tidy_test) [c(1,2)] <- c("Activity","Subject")
```
Next step, we do the exact same thing with `train_x`. Create an empty data frame and populate with `train_x`
```r
22 tidy_train <- data.frame()
23 tidy_train <- train_x
```
Next, we use the features list that we converted earlier as our column names
```r
24 colnames(tidy_train) <- feature_names
```
Next, use `cbind` to add `train_y` and `train_subj`
```r
25 tidy_train <- cbind(train_y, train_subj, tidy_train)
```
and change their column names to `Activity` and `Subject`
```r
26 colnames(tidy_train) [c(1,2)] <- c("Activity","Subject")
```
<br />
####Solving Problem #1
> Merges the training and the test sets to create one data set.

To merge both data sets, we use `rbind`
```r
29 theone <- rbind(tidy_test, tidy_train)
```
<br />
####Solving Problem #3
> Uses descriptive activity names to name the activities in the data set

To achieve this, we rename the values in the Activity column to its corresponding more descriptive values as indicated in `UCI HAR Dataset/activity_labels.txt`.

| Integer value | Descriptive value |
| :---: | --- |
| 1 | Walking |
| 2 | Walking Up |
| 3 | Walking Down |
| 4 | Sitting |
| 5 | Standing |
| 6 | Laying |

```r
33 theone$Activity <- mapvalues(theone$Activity, from = c(1, 2, 3, 4, 5, 6), 
34                                 to = c("Walking", "Walking Up", "Walking Down",
35                                        "Sitting", "Standing", "Laying"))
```
To make our data look more organized, we sort the data by "Subject" and then by "Activity"
```r
38 theone <- arrange(theone, Subject, Activity)
```
<br />
####Solving Problem #2
> Extracts only the measurements on the mean and standard deviation for each measurement.

To do this, we subset the data and take only the columns with "mean()" and "std()". 
```r
41 tidy_MS <- theone[, c(1, 2, grep("mean()", names(theone), fixed = T), 
42                      grep("std()", names(theone), fixed = T))]
```
Note1: Argument `fixed =T` is needed in this instance to treat `()` as string
Note2: This will not include the columns with "meanFreq" and will result to subsetting only 66 columns and in a way much "cleaner".

<br />
####Solving Problem #4
> Appropriately labels the data set with descriptive variable names.

Next, we use `gsub` to rename the variable names to omit the `-` and replace it with an acceptable separator `.`. We also removed the `()` and also renamed `BodyBody` to just `Body` to maintain uniformity within our variable names
```r
46 names(tidy_MS) = gsub("-",".",names(tidy_MS))
47 names(tidy_MS) = gsub("()","",names(tidy_MS),fixed = T)

49 names(tidy_MS) = gsub("BodyBody","Body",names(tidy_MS))
```
<br />
####Solving Problem #5
> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For this problem, we create a new independent tidy data set with the average of each variable for each activity and each subject. For this problem we will use `melt` to create a long data without getting the mean and then use `dcast` to create a wide tidy data set with the mean of each variable for each activity and each subkect.
```r
54 MS_melt <- melt(tidy_MS, id=c("Subject", "Activity"))

59 MS_data <- dcast(MS_melt, Activity + Subject ~ variable,mean)
```
To view the resulting tidy data, use
```r
View(MS_data)
```
