library(tidyr)
library(dplyr)
library(reshape2)

# download the files from the original url
# unzip the downloaded files
# set working directory to the newly created folder with the downloaded files. 

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="UCIdataset.zip",method = "curl")
unzip("UCIdataset.zip", exdir = "UCIdataset")
setwd(paste(getwd(),"/UCIdataset", sep=""))

# get test data
test_subpath <- "UCI HAR Dataset/test/subject_test.txt"
test_xpath <- "UCI HAR Dataset/test/X_test.txt"
test_ypath <- "UCI HAR Dataset/test/Y_test.txt"

test_sub <- read.table(test_subpath)
test_x_test <- read.table(test_xpath)
test_y_test <- read.table(test_ypath)

# combine test files
test <- cbind(test_sub,test_y_test,test_x_test)

# get train data
train_subpath <- "UCI HAR Dataset/train/subject_train.txt"
train_xpath <- "UCI HAR Dataset/train/X_train.txt"
train_ypath <- "UCI HAR Dataset/train/Y_train.txt"

train_sub <- read.table(train_subpath)
train_x_train <- read.table(train_xpath)
train_y_train <- read.table(train_ypath)

# combine train files
train <- cbind(train_sub,train_y_train,train_x_train)

# combine test and train data
UCI <- rbind(test,train)

# rename first two columns
names(UCI)[1:2] <- c("subject","activity")

# read features table from file
featpath <- "UCI HAR Dataset/features.txt"
feat <- read.table(featpath)

# assign 'X' vars with feature names
f <- as.vector(feat[['V2']])
names(UCI)[3:563] <- as.vector(feat[['V2']])

# select columns that contain mean() or std() vars
UCI <- UCI[c("subject","activity",grep("std\\(\\)",f,value=T),grep("mean\\(\\)",f,value=T))]

# read activity table from file
actpath <- "UCI HAR Dataset/activity_labels.txt"
acts <- read.table(actpath)

# convert numbers to descriptive factor labels in activity column
UCI$activity <- as.factor(UCI$activity)
actsFactor <- as.character(acts$V2)
levels(UCI$activity) <- actsFactor

# convert subject to factor
UCI$subject <- as.factor(UCI$subject)

#acts$V1 <- as.character(acts$V1)
# arange columns so realated data is grouped together
 UCI <- UCI[c(1,2,3,36,4,37,5,38,6,39,7,40,8,41,9,42,10,43,11,44,12,45,13,46,14,47,
              15,48,16,49,17,50,18,51,19,52,20,53,21,54,22,55,23,56,24,57,25,58,26,
              59,27,60,28,61,29,62,30,63,31,64,32,65,33,66,34,67,35,68)]

# standardize names using make.names and gsub and make names descriptive
names(UCI) <- make.names(names(UCI))
names(UCI) <- gsub("\\.\\.","",names(UCI))
names(UCI) <- gsub("BodyBody","Body",names(UCI))
names(UCI) <- gsub("^t","time",names(UCI))
names(UCI) <- gsub("^f","frequency",names(UCI))
names(UCI) <- gsub("Acc","Accelerometer",names(UCI))
names(UCI) <- gsub("Gyro","Gyroscope",names(UCI))
names(UCI) <- gsub("Mag","Magnitude",names(UCI))
names(UCI) <- gsub("std.X$","X.std",names(UCI))
names(UCI) <- gsub("std.Y$","Y.std",names(UCI))
names(UCI) <- gsub("std.Z$","Z.std",names(UCI))
names(UCI) <- gsub("mean.X$","X.mean",names(UCI))
names(UCI) <- gsub("mean.Y$","Y.mean",names(UCI))
names(UCI) <- gsub("mean.Z$","Z.mean",names(UCI))


# LONG data.frame
# uses library(tidyr)
# take UCI, then group by subject/activity,
# then summarize_each with mean function,
# then gather (melt) all features
meanUCI <- UCI %>% 
        group_by(subject,activity) %>% 
        summarise_each(funs(mean)) %>% 
        gather(feature, mean, -subject, -activity) 

# order data.frame by subject
tidyUCI <- meanUCI[order(meanUCI$subject),]


# write final tidy dataset to text file
write.table(tidyUCI, file = "tidyUCI.txt", row.name=FALSE)










