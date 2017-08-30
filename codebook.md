---
title: "Code book"
author: "VSD"
date: "August 30, 2017"
output: html_document
---

## Introduction

This document describes the variables, data, and transformations or work that was performed to clean up the data
as part of Getting and Cleaning data course project. Source data provided for the project - <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Data set Information

The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. For more details, refer to project website 
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

### Attribute Information in test & training data sets:

For each record in the test and training dataset

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Steps followed to process the data sets
1. Merged the training and test data sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labelled the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data Variables used in the process

| Variable Name	| Description |
----------------|--------------
| activity_labels |	List of activities as Id, value pair
| activity_col_labels| Column header texts for activity list
| feature_labels | List of all features
| test_subject_data | List of subject users from the tests
| test_set_X| Test set with measurements
| test_set_act_ids|	List of activity ids from the tests
| Train_subject_data| List of subject users from the training
| training_set_X| Training set with measurements
| train_set_act_ids| List of activity ids from the training
| merged_data_set| Merged data set
| merged_subject_data| Merged list of subject users
| merge_set_act_ids| Merged list of activity Ids
| merge_set_activities|	Merged list of activity Ids and labels
| mean_std_measures| Labels that are mean & std relevant
| extract_data_set|	Subset data set with mean & std relevant columns
| result_set| Tidy data set with average of measurements
