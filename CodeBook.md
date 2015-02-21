####Summary process of extracting clean data
1. Download the raw files [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Read all neccessary raw files
3. Use `features.txt` as column names
4. Translate activity values using `activity_labels.txt`
5. Create an empty data frame and merge all the raw files
6. Use `gsub` to clean/rename the variable names
7. Subset the data frame using `grep` to extract only the mean & standard deviation columns
8. Lastly, use `melt` and/or `dcast` to create either a long or wide tidy data
NOTE: This is only a summary. For the more detailed explanation, go to the [README.md](https://github.com/Galvontyr/Course-Project/blob/master/README.md) file

<br />
####Data Dictionary - Human Activity Recognition Using Smartphones  
**Activity** - Activities perfomed by the subject  
&emsp;&emsp;1. Walking  
&emsp;&emsp;2. Walking Up  
&emsp;&emsp;3. Walking Down  
&emsp;&emsp;4. Sitting  
&emsp;&emsp;5. Standing  
&emsp;&emsp;6. Laying  
<br />
**Subject** - Human subjects  
&emsp;&emsp;Human subject ID: 1 to 30  
<br />
**tBodyAcc.mean.X** - Body acceleration with respect to time  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**tBodyAcc.mean.Y** - Body acceleration with respect to time  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**tBodyAcc.mean.Z** - Body acceleration with respect to time  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**tGravityAcc.mean.X** - Gravity acceleration with respect to time  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**tGravityAcc.mean.Y** - Gravity acceleration with respect to time  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**tGravityAcc.mean.Z** - Gravity acceleration with respect to time  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**tBodyAccJerk.mean.X** - Body acceleration Jerk signals with respect to time  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**tBodyAccJerk.mean.Y** - Body acceleration Jerk signals with respect to time  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**tBodyAccJerk.mean.Z** - Body acceleration Jerk signals with respect to time  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**tBodyGyro.mean.X** - Angular velocity with respect to time  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**tBodyGyro.mean.Y** - Angular velocity with respect to time  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**tBodyGyro.mean.Z** - Angular velocity with respect to time  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**tBodyGyroJerk.mean.X** - Angular velocity Jerk signals with respect to time  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**tBodyGyroJerk.mean.Y** - Angular velocity Jerk signals with respect to time  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**tBodyGyroJerk.mean.Z** - Angular velocity Jerk signals with respect to time  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**tBodyAccMag.mean** - Body acceleration magnitude with respect to time  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**tGravityAccMag.mean** - Gravity acceleration magnitutde with respect to time  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**tBodyAccJerkMag.mean** - Body acceleration Jerk signal magnitude with respect to time  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**tBodyGyroMag.mean** - Angular velocity magnitude with respect to time  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**tBodyGyroJerkMag.mean** - Angular velocity Jerk signal magnitude with respect to time  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**fBodyAcc.mean.X** - Body acceleration with respect to frequency  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**fBodyAcc.mean.Y** - Body acceleration with respect to frequency  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**fBodyAcc.mean.Z** - Body acceleration with respect to frequency  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**fBodyAccJerk.mean.X** - Body acceleration Jerk signals with respect to frequency  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**fBodyAccJerk.mean.Y** - Body acceleration Jerk signals with respect to frequency  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**fBodyAccJerk.mean.Z** - Body acceleration Jerk signals with respect to frequency  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**fBodyGyro.mean.X** - Angular velocity with respect to frequency  
&emsp;&emsp;Mean value of X per Subject per Activity  
<br />
**fBodyGyro.mean.Y** - Angular velocity with respect to frequency  
&emsp;&emsp;Mean value of Y per Subject per Activity  
<br />
**fBodyGyro.mean.Z** - Angular velocity with respect to frequency  
&emsp;&emsp;Mean value of Z per Subject per Activity  
<br />
**fBodyAccMag.mean** - Body acceleration magnitude with respect to frequency  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**fBodyAccJerkMag.mean*** - Body acceleration Jerk signal magnitude with respect to frequency  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**fBodyGyroMag.mean*** - Angular velocity magnitude with respect to frequency  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**fBodyGyroJerkMag.mean*** - Angular velocity Jerk signal magnitude with respect to frequency  
&emsp;&emsp;Mean value of XYZ per Subject per Activity  
<br />
**tBodyAcc.std.X** - Body acceleration with respect to time  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**tBodyAcc.std.Y** - Body acceleration with respect to time  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**tBodyAcc.std.Z** - Body acceleration with respect to time  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**tGravityAcc.std.X** - Gravity acceleration with respect to time  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**tGravityAcc.std.Y** - Gravity acceleration with respect to time  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**tGravityAcc.std.Z** - Gravity acceleration with respect to time  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**tBodyAccJerk.std.X** - Body acceleration Jerk signals with respect to time  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**tBodyAccJerk.std.Y** - Body acceleration Jerk signals with respect to time  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**tBodyAccJerk.std.Z** - Body acceleration Jerk signals with respect to time  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**tBodyGyro.std.X** - Angular velocity with respect to time  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**tBodyGyro.std.Y** - Angular velocity with respect to time  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**tBodyGyro.std.Z** - Angular velocity with respect to time  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**tBodyGyroJerk.std.X** - Angular velocity Jerk signals with respect to time  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**tBodyGyroJerk.std.Y** - Angular velocity Jerk signals with respect to time  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**tBodyGyroJerk.std.Z** - Angular velocity Jerk signals with respect to time  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**tBodyAccMag.std** - Body acceleration magnitude with respect to time  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**tGravityAccMag.std** - Gravity acceleration magnitutde with respect to time  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**tBodyAccJerkMag.std** - Body acceleration Jerk signal magnitude with respect to time  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**tBodyGyroMag.std** - Angular velocity magnitude with respect to time  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**tBodyGyroJerkMag.std** - Angular velocity Jerk signal magnitude with respect to time  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**fBodyAcc.std.X** - Body acceleration with respect to frequency  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**fBodyAcc.std.Y** - Body acceleration with respect to frequency  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**fBodyAcc.std.Z** - Body acceleration with respect to frequency  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**fBodyAccJerk.std.X** - Body acceleration Jerk signals with respect to frequency  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**fBodyAccJerk.std.Y** - Body acceleration Jerk signals with respect to frequency  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**fBodyAccJerk.std.Z** - Body acceleration Jerk signals with respect to frequency  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**fBodyGyro.std.X** - Angular velocity with respect to frequency  
&emsp;&emsp;Standard deviation value of X per Subject per Activity  
<br />
**fBodyGyro.std.Y** - Angular velocity with respect to frequency  
&emsp;&emsp;Standard deviation value of Y per Subject per Activity  
<br />
**fBodyGyro.std.Z** - Angular velocity with respect to frequency  
&emsp;&emsp;Standard deviation value of Z per Subject per Activity  
<br />
**fBodyAccMag.std** - Body acceleration magnitude with respect to frequency  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**fBodyAccJerkMag.std*** - Body acceleration Jerk signal magnitude with respect to frequency  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**fBodyGyroMag.std*** - Angular velocity magnitude with respect to frequency  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
**fBodyGyroJerkMag.std*** - Angular velocity Jerk signal magnitude with respect to frequency  
&emsp;&emsp;Standard deviation value of XYZ per Subject per Activity  
<br />
<br />
*&emsp;Specific edits (changed from "BodyBody" to just "Body") were made to these variable names for uniformity purposes 
