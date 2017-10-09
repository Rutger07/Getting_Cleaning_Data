datasets

1. mergedDF (Task #1, #3, #4)

1.1 contains data on 30 subjects (1-30) indicated by column "subjects"
1.2 these "subjects" were performing one out of six activities, indicated by column "activity"
1.3 561 variables are measured for each activity
1.4 each value in each variable column is the mean of multiple measurements during the activity performed 
1.5 is a combination of measurements from both test and train data, indicated by column "test_train"

2. tidy_df (Task #5 'independent tidy dataset')

2.1 contains data on 30 subjects (1-30) indicated by column "subjects"
2.2 these "subjects" were performing one out of six activities, indicated by column "activity"
2.3 561 variables are measured for each activity, indicated body acceleration, angle, gyro bands energy, gyro, skewness and mean, std, min/max, X/Y/Z axis, etc. see "features_info.txt" for detailed explanation
2.4 per subject and activity the mean value of all different data entries is calculated (mean of the mean as described in section 1.4)

3. features

3.1 mapping table of the order of all features (measurements) 
3.2 number in first column corresponds with the measurement value in raw data

4. mean (Task #2 part 1)

4.1 contains the mean value of all the variable columns of the mergedDF (features)
 

5. stdev (Task #2 part 2)

5.1 contains the standard deviation of all the variable columns of the mergedDF (features)

6. features_info

6.1 explains how the experiment is conducted and how the data is obtained