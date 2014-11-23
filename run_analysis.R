setwd("/Users/Philipp/Google\ Drive/82\ data\ science/99\ Lectures/03\ Gettting\ and\ Cleaning\ Data/99\ Quizzes\ and\ Project/Course\ Project")


# 1. Merge the training and the test sets to create one data set.
# 3. Use descriptive activity names to name the activities in the data set.
# 4. Appropriately label the data set with descriptive variable names.
        #Create data frames/vectors for acticity and column names
        activity_labels <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
        activity_labels[[2]] <- tolower(activity_labels[[2]])
        colnames(activity_labels) <- c("activity_no", "activity_label")
         
        features <- read.table("UCI\ HAR\ Dataset/features.txt")
        features <- features[[2]]
        
        
        #create train data frame
        a1 <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
        colnames(a1) <- features
        
        b1 <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
        colnames(b1) <- "activity_no"
        
        c1 <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
        colnames(c1) <- "subject"
        
        table1 <- cbind(c1,b1,a1)
        
        table1 <- (merge(activity_labels, table1, by = 'activity_no'))
        
        rm(a1,b1,c1)
        
        #create test data frame
        a2 <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
        colnames(a2) <- features
        
        b2 <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
        colnames(b2) <- "activity_no"
        
        c2 <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
        colnames(c2) <- "subject"
        
        table2 <- cbind(c2,b2,a2)
        
        table2 <- (merge(activity_labels, table2, by = 'activity_no'))
        
        rm(a2,b2,c2,activity_labels)
        
        #merge data frame
        data <- rbind(table1,table2)
        
        #move subject number to column 1
        reorder <- data[3] 
        data <- data[,-3]
        data <- cbind(reorder,data)
        rm(reorder,table1,table2)        

        #order by subject number and activity
        data <- data[order(data[,1], data[,2]),]

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        data_extract <- data[1:9]

## 5. From the data set in step 4, create
# a second, independent tidy data set with the average of each variable for 
# each activity and each subject.

        averages <- data.frame(
                subject	= numeric(0),
                activity_label = character(0),
                avg_tBodyAcc_mean_X = numeric(0),
                avg_tBodyAcc_mean_Y = numeric(0),
                avg_tBodyAcc_mean_Z = numeric(0),
                avg_tBodyAcc_std_X = numeric(0),
                avg_tBodyAcc_std_Y = numeric(0),
                avg_tBodyAcc_std_Z = numeric(0)
                ) 
        
        for (i in 1:nrow(data_extract)) {
                subject <- data_extract[i,"subject"]
                activity_label <- data_extract[i,"activity_label"]
                sub <- data_extract[data_extract["subject"] == subject &
                                       data_extract["activity_label"] == activity_label,]
                
                avg_tBodyAcc_mean_X <- mean(sub[[4]])
                avg_tBodyAcc_mean_Y <- mean(sub[[5]])
                avg_tBodyAcc_mean_Z <- mean(sub[[6]])
                avg_tBodyAcc_std_X <- mean(sub[[7]])
                avg_tBodyAcc_std_Y <- mean(sub[[8]])
                avg_tBodyAcc_std_Z <- mean(sub[[9]])
        
                row_frame <- data.frame(
                        subject = subject,
                        activity_label = activity_label,
                        avg_tBodyAcc_mean_X = avg_tBodyAcc_mean_X,
                        avg_tBodyAcc_mean_Y = avg_tBodyAcc_mean_Y,
                        avg_tBodyAcc_mean_Z = avg_tBodyAcc_mean_Z,
                        avg_tBodyAcc_std_X = avg_tBodyAcc_std_X,
                        avg_tBodyAcc_std_Y = avg_tBodyAcc_std_Y,
                        avg_tBodyAcc_std_Z = avg_tBodyAcc_std_Z
                        )
                averages <- (rbind(row_frame, averages))
        }
        rm(sub,row_frame)
        averages <- averages[!duplicated(averages),]

        #order by subject number and activity
        averages <- averages[order(averages[,1], averages[,2]),]

#Create the final clean table
write.table(averages,'tidy_data_set.txt', row.name=FALSE)