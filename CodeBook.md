#Initial Data
Initial Data was an dataset of interpreted cellphone accelerometer and gyroscope sensor signals from a set of experiments. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The interpreted data included 561 variables. Vectors allocating data entries to activities and test subjects were recorded sperately. Additionally, data was split in a "test" and a "train" set.

Source Data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
For a comprehensive description of the source data see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Final Variables
- subject: 
test subject number

- activity_label:
type of activity the subject is performing

- avg_tBodyAcc_mean_X:
average (across all measurements of same subject performing the same activity) mean movement on the X-Axis registerd by the accelerometer while the subject was performing the activity

- avg_tBodyAcc_mean_Y
average (across all measurements of same subject performing the same activity) mean movement on the Y-Axis registerd by the accelerometer while the subject was performing the activity

- avg_tBodyAcc_mean_Z
average (across all measurements of same subject performing the same activity) mean movement on the Z-Axis registerd by the accelerometer while the subject was performing the activity

- avg_tBodyAcc_std_X
average (across all measurements of same subject performing the same activity) standard deviation of the movement on the X-Axis registerd by the accelerometer while the subject was performing the activity

- avg_tBodyAcc_std_Y
average (across all measurements of same subject performing the same activity) standard deviation of the movement on the Y-Axis registerd by the accelerometer while the subject was performing the activity

- avg_tBodyAcc_std_Z
average (across all measurements of same subject performing the same activity) standard deviation of the movement on the Z-Axis registerd by the accelerometer while the subject was performing the activity

#Transformations to clean up the data
1. Read all label vectors in R
2. Read all train and test data in R
3. Lable train and test data columns
4. Combine subject, activity, and data tables of train and test data to two data frames
5. Match descriptive activity names to the activity columns in the tables
6. Re-order the colums
7. Combine the test and train data frame entries to form one data frame
8. Order the new dataframe by test subject and activity
9. Extract only subject, activity, mean and standard deviation variables from the new data frame table (6 variables, columns 1-9)
10. Create a for-loop that calculates the mean of the 6 remaining variables for each subject-activity combination
11. Clean up duplicates resulting from the way the for-loop was written
12. Order the resulting data.frame by test subject and activity
13. Export final tidy_data_frame to txt file

#License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


