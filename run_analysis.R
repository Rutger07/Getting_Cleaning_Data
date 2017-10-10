###############################################################################################
############################ Assignment getting and cleaning data #############################
###############################################################################################
############## Goal: prepare a tidy dataset (that can be used for later analysis) #############
###############################################################################################
############################### submit 1 tidy dataset                 #########################
############################### submit a link to a github repository  #########################
############################### submit a code book called CodeBook.md #########################
############################### also include a README.md in the repo  #########################

#load packages
library(plyr)

#load datafiles, mapping tables, names, tidy features
# get names of all features -> required for giving column names to all measurements in data
features <- read.table("UCI HAR Dataset/features.txt")
# descriptive activity names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("activity", "activity_description")

###############################################################################################
########################## merge test & trainingset (Task #1)##################################
###############################################################################################

############## get test data in dataframe -> processing of test data to merge #################
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject") #subjects 
measurements_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")                #measurements belonging to subjects
names(measurements_test) <- features[[2]]                                                   #column names
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")      #activity belonging to measurements
test_data <- cbind(subjects_test, activity_test, measurements_test)                         #combine test data

############# get train data in dataframe -> processing of train data to merge ################
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
measurements_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
names(measurements_train) <- features[[2]]
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
train_data <- cbind(subjects_train, activity_train, measurements_train)

############################# merge data from test and train #################################
complete_dataset <- rbind(test_data, train_data)

###############################################################################################
###### Extract only measurements on the mean and std dev for each measurement (Task #2) #######
###############################################################################################

dataset_mean_stdev <- complete_dataset[,grepl("mean|std|subject|activity", names(complete_dataset))]

###############################################################################################
########################### Descriptive activity names (Task #3) ##############################
###############################################################################################

descriptive_dataset_mean_stdev <- join(dataset_mean_stdev, activity_labels, by = "activity", match = "first")
descriptive_dataset_mean_stdev$activity <- NULL

###############################################################################################
############################## Use Appropriate Labels (Task #4) ###############################
###############################################################################################

names(descriptive_dataset_mean_stdev) <- sub("^t", "Time.Domain_", names(descriptive_dataset_mean_stdev))
names(descriptive_dataset_mean_stdev) <- sub("Freq", "Frequency", names(descriptive_dataset_mean_stdev))
names(descriptive_dataset_mean_stdev) <- sub("^f", "Frequency.Domain_", names(descriptive_dataset_mean_stdev))
names(descriptive_dataset_mean_stdev) <- sub("Acc", "Acceleration", names(descriptive_dataset_mean_stdev))
names(descriptive_dataset_mean_stdev) <- sub("std", "Std_Dev", names(descriptive_dataset_mean_stdev))
names(descriptive_dataset_mean_stdev) <- sub("Mag", "Magnitude", names(descriptive_dataset_mean_stdev))
names(descriptive_dataset_mean_stdev) <- sub("mean", "Mean", names(descriptive_dataset_mean_stdev))

###############################################################################################
################ Independent Tidy Data Set Mean of Activity & Person (Task #5) ################
###############################################################################################


tidy_dataset_mean <- 
  aggregate(.~subject + activity_description, 
            data = descriptive_dataset_mean_stdev, 
            FUN = function(x) mean(x))


#write to txt file
write.table(tidy_dataset_mean, "Independent_Tidy_Dataset.txt", row.names = FALSE)
