# CodeBook
This file is the CodeBook for the SummarizedData.txt data set

Each row of this data contains 81 variables
1) The Subject (1-30)
2) The Activity (From the List Below)
3) 79 Measurements of the Subject Performing That activity

The activities that are performed are:
1)WALKING
2)WALKING_UPSTAIRS
3)WALKING_DOWNSTAIRS
4)SITTING
5)STANDING
6)LAYING

The measurements are averages of averages or standard deviations of measured datasets
These measurements are

The mean and standard deviation of acceleration in each direction
1)"Time Domain Body Accelerometer Mean-XYZ"
2)"Time Domain Body Accelerometer Standard Deviation-XYZ"
The mean and standard deviation of acceleration in each direction in gravity units
3)"Time Domain Gravity Accelerometer Mean-XYZ"
4)"Time Domain Gravity Accelerometer Standard Deviation-XYZ"
The mean and standard deviation of acceleration jerk in each direction
5)"Time Domain Body Accelerometer Jerk Mean-XYZ"
6)"Time Domain Body Accelerometer Jerk Standard Deviation-XYZ"
The mean and standard deviation of the gyroscope in each direction
7)"Time Domain Body Gyroscope Mean-XYZ"
8)"Time Domain Body Gyroscope Standard Deviation-XYZ"
The mean and standard deviation of the gyroscope jerk in each direction
9) "Time Domain Body Gyroscope Jerk Mean-XYZ"
10) "Time Domain Body Gyroscope Jerk Standard Deviation-XYZ"
The mean of standard deviation of of all 3 directions of the acceleration
11) "Time Domain Body Accelerometer Magnitude Mean"
12) "Time Domain Body Accelerometer Magnitude Standard Deviation"
The mean of standard deviation of of all 3 directions of the acceleration in gravity units
13) "Time Domain Gravity Accelerometer Magnitude Mean"
14) "Time Domain Gravity Accelerometer Magnitude Standard Deviation"
The mean of standard deviation of of all 3 directions of the acceleration jerk
15) "Time Domain Body Accelerometer Jerk Magnitude Mean"
16) "Time Domain Body Accelerometer Jerk Magnitude Standard Deviation"
The mean of standard deviation of of all 3 directions of the gyroscope
17) "Time Domain Body Gyroscope Magnitude Mean"
18) "Time Domain Body Gyroscope Magnitude Standard Deviation"
The mean of standard deviation of of all 3 directions of the gyroscope jerk
19) "Time Domain Body Gyroscope Jerk Magnitude Mean"
20) "Time Domain Body Gyroscope Jerk Magnitude Standard Deviation"

Each of these measurements are repeated in the frequency domain and labelled by
replacing the "Time" with "Frequency"

The transformation done to the data are as follows:
1)Merges the training and the test sets to create one data set.
2)Extracts only the measurements on the mean and standard deviation for each measurement.
3)Uses descriptive activity names to name the activities in the data set
4)Appropriately labels the data set with descriptive variable names.
5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
