AccelerometerDataAnalysis
=========================

This project aims at the analysis of the data produced from accelerometers from the Samsung Galaxy S smartphone.
The full description is at 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project is at

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

DataSet Directory
=================

The Data is extracted at the directory UCI HAR Dataset

Merging Datasets
================

Create testData set from subject_test.txt, X_test.txt, y_test.txt after applying the column names from features.txt
Create trainData set from subject_train.txt, X_train.txt, y_train.txt after applying the column names from features.txt

Now merge both these testData and trainData dat frames  to create a consolidated 'data' data frame

Labelling
========
The values of activities variable is populated from activity_labels.txt

Analysis
===========
Extract the Mean and standard deviation for each measurement, this is done by searching for 'mean()' and 'std()' in the variable names

Calculate the  table of average values for each activities and subjects and store it in tidyDataSet2

a folder name "results" is created after checking for its presence and save it here.

Column Names
============
The column labels were shown as a form of activity and subject with aperiod symbol. Activities are classified into 6 classes (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). For Ex: 1 represents WALKING

