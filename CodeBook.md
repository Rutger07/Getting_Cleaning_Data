Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

added datasets

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
