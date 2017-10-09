# Getting_Cleaning_Data
Repo for the Coursera course "Getting and Cleaning Data"

#how does the code 'run_analysis.R' work?

#1
it loads some data
1. features of the measurements (features)
2. test_data (subjects, input (x_test), output (y_test), names)
3. train_data (subjects, input (x_train), output (y_train), names)
- subjects: people in the experiment
- input: all the measured features
- output: the activity (walking, sitting, laying, etc.)
- names: from what dataset it is coming (test/train)
4. mapping table of the activities (1-6)

#2
it merges the test and train data into complete_data

#3
it runs some standard calculations
1. mean (mean)
2. standard deviation (stdev)

#4
it maps the descriptive activities to the data
1. merging mapping table
2. substitute 'numbered activity column' with 'descriptive activity column' 
3. delete obsolete column

#5 
calculations of mean per feature per person
1. split dataframe columns into two dataframes
2. keep 'subject' and 'activity' in each column
3. run calculation 'mean' with aggregate function on both resulting columns DF1, DF2
4. combine summarized dataframes (m1, m2) except for double columns ('subject', 'activity')

#6
write tidy_data to txt file
