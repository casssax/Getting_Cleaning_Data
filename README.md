#Tidy Dataset for Coursera Getting and Cleaning Data class.

link to full description of original dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

link to original dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#####The dataset for this project can be downloaded with the following code.  
(Make sure you are in the working directory you want to be in.  This code will un-zip the downloaded file into a sub folder called **UCIdataset** and set that as the working directory.)

```R
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  

download.file(url, destfile="UCIdataset.zip",method = "curl")  

unzip("UCIdataset.zip", exdir = "UCIdataset")  

setwd(paste(getwd(),"/UCIdataset", sep=""))  
```

The text version of this table was created with the command:

```R
write.table(tidyUCI, file = "tidyUCI.txt", row.name=FALSE)
```
and can be read into R using the command:

```R
data <- read.table(file_path, header = TRUE)
data$subject <- as.factor(data$subject)
```
(The 'subject' column is a factor when the tidyUCI is created from the script, but must be converted to a factor when reading in as a text file)

Purpose
---
To create a tidy dataset containing the mean of all variables that contain mean() or std() data.

This is accomplished by:  


* Merging the training and the test sets to create one data set.  
* Extracting only the measurements on the mean and standard deviation for each measurement.  
* Useing descriptive activity names to name the activities in the data set.   
* Appropriately labeling the data set with descriptive variable names.  
* Creating an independent tidy data set with the average of each variable for each activity and each subject.  



Raw Data
---

The original data for this project came from:

***
Human Activity Recognition Using Smartphones Dataset
Version 1.0

***

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit‡ degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

***

#####Orginal project summary:
A group of 30 volunteers within an age bracket of 19-48 years performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.


#####For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


#####The dataset included the following files:

* **features_info.txt**: Shows information about the variables used on the feature vector.
* **features.txt**: List of all features.
* **activity_labels.txt**: Links the class labels with their activity name.
* **train/X_train.txt**: Training set.
* **train/y_train.txt**: Training labels.
* **test/X_test.txt**: Test set.
* **test/y_test.txt**: Test labels.

#####The following files are available for the train and test data. *Their descriptions are equivalent*.  

* **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* **train/Inertial Signals/total_acc_x_train.txt**: The acceleration signal from the smartphone accelerometer X axis in standard gravity units **g**.  
   Every row shows a 128 element vector. The same description applies for the **total_acc_x_train.txt** and **total_acc_z_train.txt** files for the Y and Z axis. 
* **train/Inertial Signals/body_acc_x_train.txt**: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* **train/Inertial Signals/body_gyro_x_train.txt**: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

