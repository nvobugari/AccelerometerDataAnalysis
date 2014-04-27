##This program creates data frames for train data and test data. Then merges them to create a tidy data set.
##Extracts only the measurements on the mean and standard deviation for each measurement. 
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive activity names. 
##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##Disclaimer: I have taken help/gained knowledge for implementing this program by googling and also
##            the forums.
##The location of this R program is at the root folder(UCI HAR Dataset) of the extracted zip file

##Reads the file features.txt in table format and creates a data frame named features
features <- read.table("./features.txt",sep="")


##Reads the file subject_train.txt in table format to create a data frame subjectTrain
##also reads the file X_train.txt in table fomat and creates a data frame named XTrain
##also reads the file y_train.txt in table fomat and creates a data frame named yTrain


subjectTrain <- read.table("./train/subject_train.txt",sep="",col.names="id")
XTrain <- read.table("./train/X_train.txt",sep="",col.names=features$V2)
yTrain <- read.table("./train/y_train.txt",sep="",col.names="activity")

##creates the trainData using column bind for the data frames subjectTrain,yTrain and XTrain
trainData <- cbind(subjectTrain,yTrain,XTrain)



##Reads the file subject_test.txt in table format to create a data frame subjectTest
##also reads the file X_train.txt in table fomat and creates a data frame named XTest
##also reads the file y_train.txt in table fomat and creates a data frame named yTest

subjectTest <- read.table("./test/subject_test.txt",sep="",col.names="id")
XTest <- read.table("./test/X_test.txt",sep="",col.names=features$V2)
yTest <- read.table("./test/y_test.txt",sep="",col.names="activity")

##creates the testData using column bind for the data frames subjectTest,yTest and XTest
testData <- cbind(subjectTest,yTest,XTest)

##creates a consolidated data frame 'data' from the data frames trainData and testData using the rbind functio
data <- rbind(trainData, testData)

##arranges the consolidate data frame 'data' by "id" field
data <- arrange(data,id)


## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names. < DONE

activityLabels <- read.table("./activity_labels.txt")

data$activity <- factor(data$activity, levels=activityLabels $V1, labels=activityLabels$V2)




## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
dataset1 <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]

# creating a results folder
if(!file.exists("results")){
    dir.create("results")
} 

##saving the tidy data set into the results folder
write.csv(dataset1,"tidyDataSet1")

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataset2 <- ddply(dataset1, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

# Adds "_mean" to colnames
colnames(dataset2)[-c(1:2)] <- paste(colnames(dataset2)[-c(1:2)], "_mean", sep="")

# Save tidy dataset2 into results folder
saveResult(dataset2,"tidyDataSet2")

