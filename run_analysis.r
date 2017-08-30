library(data.table)
library(dplyr)

## Read activity labels
activity_labels <- fread("./Week4_Project/UCI HAR Dataset/activity_labels.txt")
activity_col_labels <- c("Activity Id", "Activity Name")

## Read feature labels
feature_labels <- fread("./Week4_Project/UCI HAR Dataset/features.txt")

## Read test data set 
test_subject_data <- fread(file="./Week4_Project/UCI HAR Dataset/test/subject_test.txt")
test_set_X <- fread("./Week4_Project/UCI HAR Dataset/test/X_test.txt")
test_set_act_ids <- fread("./Week4_Project/UCI HAR Dataset/test/y_test.txt")

## Read training data set
train_subject_data <- fread(file="./Week4_Project/UCI HAR Dataset/train/subject_train.txt")
training_set_X <- fread("./Week4_Project/UCI HAR Dataset/train/X_train.txt")
train_set_act_ids <- fread("./Week4_Project/UCI HAR Dataset/train/y_train.txt")

## Merge training and test data sets
merged_data_set <- merge(test_set_X, training_set_X,all = T) 
merge_subject_data <- bind_rows(test_subject_data, train_subject_data)
names(merge_subject_data) <- "Subject"
merge_set_act_ids <- bind_rows(test_set_act_ids, train_set_act_ids)

## Join activity features & labels
merge_set_activities <- left_join(merge_set_act_ids, activity_labels, by="V1")
names(merge_set_activities) <- activity_col_labels
 
## Extract measurements related to mean & standard deviation 
mean_std_measures <- feature_labels[grep("(mean|std)", feature_labels$V2)]
names(merged_data_set) <- feature_labels[[2]]
extract_data_set <- subset(merged_data_set, select = mean_std_measures$V2)

## Data set labelling
extract_data_set <- bind_cols(merge_set_activities, extract_data_set)
extract_data_set <- bind_cols (merge_subject_data, extract_data_set)

## Tidy data set wih the average of each variable for each Activity and subject
result_set <- extract_data_set %>% group_by(`Activity Id`,`Activity Name`, Subject) %>% summarise_all("mean")

## Download Tidy data set  
write.table(x = result_set, file = "./Tidy_UCI_data_set.csv",sep = "/t",row.names = F)