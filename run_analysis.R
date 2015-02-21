library(plyr)
library(reshape)
library(reshape2)

##Read all necessary files
test_x <- read.table("./test/X_test.txt") ##TEST results
test_y <- read.table("./test/Y_test.txt") ##TEST ACTIVITY labels
test_subj <- read.table("./test/subject_test.txt") ##TEST SUBJECT labels

train_x <- read.table("./train/X_train.txt") ##TRAIN results
train_y <- read.table("./train/Y_train.txt") ##TRAIN ACTIVITY labels
train_subj <- read.table("./train/subject_train.txt") ##TRAIN SUBJECT labels

features <- read.table("features.txt") ##VARIABLES to be used as column names
feature_names <- features[,2] ##Convert from data frame to list

##Merging and tidying of all TEST data
tidy_test <- data.frame() ##Create an empty data frame for TEST
tidy_test <- test_x ##Populate with the TEST results
colnames(tidy_test) <- feature_names ##Add the VARIABLES as column names

tidy_test <- cbind(test_y, tidy_test) ##Cbind the TEST ACTIVITY labels
colnames(tidy_test) [1] <- "Activity" ##Rename the newly binded TEST ACTIVITY column

tidy_test <- cbind(test_subj, tidy_test) ##Cbind the TEST SUBJECT lebels
colnames(tidy_test) [1] <- "Subject" ##Rename the newly binded TEST SUBJECT column

##[Answer to Q3] Rename observations in the "Activity" column 
## as indicated in "activity_labels.txt"
tidy_test$Activity <- mapvalues(tidy_test$Activity, from = c(1, 2, 3, 4, 5, 6), 
    to = c("Walking", "Walking Up", "Walking Down",
           "Sitting", "Standing", "Laying"))

##Merging and tidying of all TRAIN data
tidy_train <- data.frame() ##Create an empty data frame for TRAIN
tidy_train <- train_x ##Populate with the TRAIN results
colnames(tidy_train) <- feature_names ##Add the VARIABLES as column names

tidy_train <- cbind(train_y, tidy_train) ##Cbind the TRAIN ACTIVITY labels
colnames(tidy_train) [1] <- "Activity" ##Rename the newly binded TRAIN ACTIVITY column

tidy_train <- cbind(train_subj, tidy_train) ##Cbind the TRAIN SUBJECT lebels
colnames(tidy_train) [1] <- "Subject" ##Rename the newly binded TRAIN SUBJECT column

##[Answer to Q3] Rename observations in the "Activity" column 
## as indicated in "activity_labels.txt"
tidy_train$Activity <- mapvalues(tidy_train$Activity, from = c(1, 2, 3, 4, 5, 6), 
                             to = c("Walking", "Walking Up", "Walking Down",
                                    "Sitting", "Standing", "Laying"))

##[Q1] Merge both tidied data
theone <- rbind(tidy_test, tidy_train)
theone <- arrange(theone, Subject, Activity) ##Sorted data by 
                    ## "Subject" column first then "Activity" column second

##[Q2] Subset of all the column with mean & std
tidy_MS <- theone[, c(1, 2, grep("mean()", names(theone), fixed = T), 
                      grep("std()", names(theone), fixed = T))]
##Used grep function to filter all the columns with mean() and std() (partial match)

##[Q4] Changed column names to a more descriptive ones
names(tidy_MS) = gsub("-",".",names(tidy_MS))
names(tidy_MS) = gsub("()","",names(tidy_MS),fixed = T)
##Used gsub function  to replace all the dashes with "." and remove all the "()"
names(tidy_MS) = gsub("BodyBody","Body",names(tidy_MS))
##Also changed the "BodyBody" feature name to just "Body" 
## which felt wrong when trying analyze what BodyBody means

##[Q5] New table with mean of each variable for each activity and subject
MS_melt <- melt(tidy_MS, id=c("Subject", "Activity"))
##Used melt to reshape the data set to have an ID of "Subject" and "Activity"
## and all other columns are consolidated in "variables" column
## This is a tall and skinny data set and ready to be "recasted"

MS_data <- dcast(MS_melt, Activity + Subject ~ variable,mean)
##Used dcast to recast or re-summarized the data that would take the mean 
## of all the variables per "Subject" per "Activity"
