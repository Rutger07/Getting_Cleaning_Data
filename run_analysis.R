#assignment getting and cleaning data
#goal prepare a tidy dataset (that can be used for later analysis)

#submit 1 tidy dataset
#submit a link to a github repository
#submit a code book called CodeBook.md
#also include a README.md in the repo

#1. merge test & trainingset

#get names of all features
features <- read.table("UCI HAR Dataset/features.txt")

#get test data in dataframe
  subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")
    #4. appropriate variable names
    names(x_test) <- features[[2]]
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
  
  
  test_data <- cbind(subjects_test, x_test, y_test, "test")
  #4. appropriate variable names
  names(test_data)[ncol(test_data)] <- "test_train"
#get train data in dataframe
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
  names(x_train) <- features[[2]]
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

train_data <- cbind(subjects_train, x_train, y_train, "train")
names(train_data)[ncol(train_data)] <- "test_train"

#merge data from test and train
complete_data <- rbind(test_data, train_data)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#mean
mean <- colMeans(complete_data[,2:562], na.rm = FALSE, dims = 1)

#stdev
numeric_data <- complete_data[,2:562]
numeric_data <- as.matrix(numeric_data)
stdev <- colSds(numeric_data)

#3. descriptive activity names
#load mapping table
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#give names to columns
names(activity_labels) <- c("activity", "description")

#merge
mergedDF <- merge(complete_data, activity_labels, key = activity)

#sub column 1 with newly acquired column 'descriptive'
mergedDF$activity <- mergedDF[,565]
mergedDF[,565] <- NULL

# tidy data set is mergedDF with descriptive column values for activities 
# and all column names for different measurements

#split DF in 2 seperate dataframes to calculate means per subject and measurement (max is 478 measurements - has 561)
DF1 <- mergedDF[,1:300]
DF2 <- mergedDF[,c(1,2,301:563)]
m1 <- aggregate(.~subject + activity, data = DF1, FUN = function(x) mean(x))
#check dimensions
dim(m1)
m2 <- aggregate(.~subject + activity, data = DF2, FUN = function(x) mean(x))
#check dimensions
dim(m2)
#bind the two seperate Df summaries together
tidy_df <- cbind(m1,m2[,3:265])

