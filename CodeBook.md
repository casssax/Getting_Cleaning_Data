
CodeBook
---
#####The original files used in creating this tidy dataset included:

* **activity_labels.txt**  
* **features.txt**  
* **subject_test.txt**  
* **X_test.txt**  
* **y_test.txt**  
* **subject_train.txt**  
* **X_train.txt**  
* **y_train.txt**  

The three **test** files (subject, X, Y) were each read in using **read.table()**.  


Data from the three files was then combined using **cbind()**.  
*(These first two steps were repeated for the **train** data)*.  


The combined **test** and **train** datasets were then combined into a dataframe called **UCI** using **rbind()**.  


The first two colums of the **UCI** dataset were renamed to **subject** and **activity** using **names()**.   


The **features.txt** file was read in using **read.table()**.  


The second column of the features table was converted to a vector and then used to rename the remaining columns in the **UCI** data frame *(columns 3:563)*  


At this point only the measurements on the mean and standard deviation for each measurement were kept. 
	This was accomplished by keeping the **subject** and **activity** columns and using **grep()** to find all feature columns that end with **std()** and **mean()**  
        
        
Next, the **activity_lables.txt** file was read in.  


The numeric factors of the **activity** column were converted to descriptive text labels from the **activity_labels.txt** file.  
This was done by:

* converting the numeric values in the **activity** column to factors.  
* The activity lables from the **activity_labels.txt** file were converted to characters.  
* Then the levels of the **activity** column were re-named to the descriptive names using **levels()** and the converted activity labels.

Next, The **subjects** column was converted to factors using **as.factor()**

The order of the variables was then changed so mean() and std() measurements for the same variable were grouped together. (i.e. xxx.mean() and xxx.std() would be next to each other)
        
        
At this point the features column names were cleaned up and made more descriptive.

* **make.names()** was used first to clean up any characters not acceptable for column names.  
* The double dots created by the open and close paranthesis were then coverted to blanks.  
* **BodyBody** was converted to **Body** to fix mistakes made in the original nameing of the features.  
* Feature names starting with **t** were changed to start with **time**  
* Feature names starting with **f** were changed to start with **frequency**  
* **Acc** was changed to **Accelorometer**  
* **Gyro** was changed to **Gyroscope**  
* **Mag** was changed to **Magnitude**  
* **.std.X** was changed to **X.std** (the same was done for **Y**, and **Z** names) so all standard deveation features end in **.std**  
* **.mean.X** was changed to **X.mean** (the same was done for **Y**, and **Z** names) so all mean features end in **.mean**  


A new dataset **meanUCI** was then created from the **UCI** dataset.  

* The UCI dataset was grouped by **subject** and **activity**,  
* summarized (using **summarize_each (dplyr)**) by mean,  
* gathered **(tidyr)** to create one row of data for each **subject**,**activity**,**feature**,**mean**  

The **meanUCI** dataset was then ordered by subject into a new dataframe named **tidyUCI**.


tidyUCI
---
'data.frame': 11880 obs. of  4 variables:  

#####Variables:
The tidyUCI dataset contains four columns:

  1. subject  
  2. activity  
  3. feature  
  4. mean  
  
#####subject
The subject column contains factor variables relating to the subjects that participated in the original study.  
They are denoted by levels from 1 to 30

#####activity
The activity column contains factor variables describing the activity that was being carried out when the measurements were taken.  
There are six levels of activity:  

  WALKING  
  WALKING_UPSTAIRS  
  WALKING_DOWNSTAIRS  
  SITTING  
  STANDING  
  LAYING
  
#####features
The features column contains the different features for which std() and mean() are recorded.

  timeBodyAccelerometer.X.std  
  timeBodyAccelerometer.Y.std  
  timeBodyAccelerometer.Z.std  
  timeGravityAccelerometer.X.std  
  timeGravityAccelerometer.Y.std  
  timeGravityAccelerometer.Z.std  
  timeBodyAccelerometerJerk.X.std  
  timeBodyAccelerometerJerk.Y.std  
  timeBodyAccelerometerJerk.Z.std  
  timeBodyGyroscope.X.std  
  timeBodyGyroscope.Y.std  
  timeBodyGyroscope.Z.std  
  timeBodyGyroscopeJerk.X.std  
  timeBodyGyroscopeJerk.Y.std  
  timeBodyGyroscopeJerk.Z.std  
  timeBodyAccelerometerMagnitude.std  
  timeGravityAccelerometerMagnitude.std  
  timeBodyAccelerometerJerkMagnitude.std  
  timeBodyGyroscopeMagnitude.std  
  timeBodyGyroscopeJerkMagnitude.std  
  frequencyBodyAccelerometer.X.std  
  frequencyBodyAccelerometer.Y.std  
  frequencyBodyAccelerometer.Z.std  
  frequencyBodyAccelerometerJerk.X.std  
  frequencyBodyAccelerometerJerk.Y.std  
  frequencyBodyAccelerometerJerk.Z.std  
  frequencyBodyGyroscope.X.std  
  frequencyBodyGyroscope.Y.std  
  frequencyBodyGyroscope.Z.std  
  frequencyBodyAccelerometerMagnitude.std  
  frequencyBodyAccelerometerJerkMagnitude.std  
  frequencyBodyGyroscopeMagnitude.std  
  frequencyBodyGyroscopeJerkMagnitude.std  
  timeBodyAccelerometer.X.mean  
  timeBodyAccelerometer.Y.mean  
  timeBodyAccelerometer.Z.mean  
  timeGravityAccelerometer.X.mean  
  timeGravityAccelerometer.Y.mean  
  timeGravityAccelerometer.Z.mean  
  timeBodyAccelerometerJerk.X.mean  
  timeBodyAccelerometerJerk.Y.mean  
  timeBodyAccelerometerJerk.Z.mean  
  timeBodyGyroscope.X.mean  
  timeBodyGyroscope.Y.mean  
  timeBodyGyroscope.Z.mean  
  timeBodyGyroscopeJerk.X.mean  
  timeBodyGyroscopeJerk.Y.mean  
  timeBodyGyroscopeJerk.Z.mean  
  timeBodyAccelerometerMagnitude.mean  
  timeGravityAccelerometerMagnitude.mean  
  timeBodyAccelerometerJerkMagnitude.mean  
  timeBodyGyroscopeMagnitude.mean  
  timeBodyGyroscopeJerkMagnitude.mean  
  frequencyBodyAccelerometer.X.mean  
  frequencyBodyAccelerometer.Y.mean  
  frequencyBodyAccelerometer.Z.mean  
  frequencyBodyAccelerometerJerk.X.mean  
  frequencyBodyAccelerometerJerk.Y.mean  
  frequencyBodyAccelerometerJerk.Z.mean  
  frequencyBodyGyroscope.X.mean  
  frequencyBodyGyroscope.Y.mean  
  frequencyBodyGyroscope.Z.mean  
  frequencyBodyAccelerometerMagnitude.mean  
  frequencyBodyAccelerometerJerkMagnitude.mean  
  frequencyBodyGyroscopeMagnitude.mean  
  frequencyBodyGyroscopeJerkMagnitude.mean  
  
#####mean
The average (mean) of each variable for each subject and activity.  
(all values in the original dataset were normalized so there is no unit description)


The **run_analysis.R** script creates a tidy dataset in the long/narrow form for this data similar to Table 3. and Table 5. in Hadley Wickham's 'Tidy Data' paper in the [Journal of Statistical Software.](http://www.jstatsoft.org/v59/i10/paper)  

I used the **gather** method rather than **melt** to create this **Molten** data, but the results are the same.
The tidy dataset created here combines each combination of subject, activity, and variable into one row.
 















