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
4. mapping table of the activities (1-6)

#2
it merges the test and train data into complete_dataset

#3
it extracts columns with:
1. mean (mean)
2. standard deviation (stdev)

#4
it maps the descriptive measurements to the data column names
1. freq = Frequency; std = Std.Dev; Mag = Magnitude; t = Time.Domain; f = Frequency.Domain
2. add 'descriptive activity column' [activity_description] by mapping with 'numbered activity column' [activity]
3. delete obsolete column [activity]

#5 
calculations of mean per feature per person
3. run calculation 'mean' with aggregate function on dataset

#6
write tidy_data to txt file
