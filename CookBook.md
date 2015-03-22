### Data source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


###The dataset includes the following files:

1. features_info.txt': Shows information about the variables used on the feature vector.

2. features.txt': List of all features.

3. activity_labels.txt': Links the class labels with their activity name.

4. train/X_train.txt': Training set.

5. train/y_train.txt': Training labels.

6. test/X_test.txt': Test set.

7. test/y_test.txt': Test labels.


The following files are available for the train and test data. Their descriptions are equivalent.

- train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

### Variables

activityLabels: data.frame[6,2] List activity name in accorance to the keys index in trainActivty & testActivity.
features: data.table[561,2]: Lists all the features, used as column names for data in mergedData & meanSDData

trainX: data.table[7352,561] Training Set data of 561 variables
trainActivity: data.table[7352,1] Training Activity data label
trainSubject: data.table[7352,1] List the subject index no. in accordance to the training dataset

testX: data.table[2947,561] Test Set data of 561 variables
testActivity: data.table[2947,1] Test Activity data label
testSubject: data.table[2947,1] List the subject index no. in accordance to the test dataset

mergedData: data.table[10299,563] Bind training and test sets together (total - 10299 observations) in order of "Subject, Activity, Data[1:561]"

meanSDData: data.table[10299,81] A subsetted mergedData that retain only 81 columns that have 'mean' and 'std'

tidy: data.table[180,81] Lists the average of each variable for 6 activities and 30 subjects (6*30=180 observations).