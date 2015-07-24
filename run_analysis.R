
library(dplyr)
library(tidyr)

### Actions indicated by number,
### as it was not specified that the necessary properties 
### had to be performed in order,
### I didn't do it in the order it was listed

###  Init: Loading Datasets
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("UCI HAR Dataset/train/x_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

### 4:  Appropriately labels the data set with descriptive variable names. 
names(subject_test) <- c('subject')
names(subject_train) <- c('subject')
names(y_test) = c('activity')
names(y_train) = c('activity')
feature_names <- as.vector(as.matrix(features['V2']))
names(x_test) <- feature_names
names(x_train) <- feature_names

### 1: Merges the training and the test sets to create one data set.
test = bind_cols(subject_test,y_test, x_test)
train = bind_cols(subject_train,y_train, x_train)
dat <- bind_rows(test, train)

### 2: Extracts only the measurements on the mean and standard deviation for each measurement.
names_to_delete <- feature_names[-grep("mean\\(\\)|std\\(\\)",feature_names)]
dat <- select(dat, -one_of(names_to_delete))

### 3: Uses descriptive activity names to name the activities in the data set
dat <- mutate(dat, activity = activity_labels$V2[activity])

### 5:  rom the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
g_dat <- group_by(dat, activity, subject )
g_dat <- summarise_each(g_dat, funs(mean))


