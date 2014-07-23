# 1, Merges the training and the test sets to create one data set.
train_y <- as.matrix(read.table("./train/y_train.txt"))
test_y <- as.matrix(read.table("./test/y_test.txt"))
train_X <- as.matrix(read.table("./train/X_train.txt"))
test_X <- as.matrix(read.table("./test/X_test.txt"))
X <- rbind(train_X, test_X)
y <- rbind(train_y, test_y)

# 2, Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
X_new <- data.frame(MEAN=1:dim(X)[1],STD=1:dim(X)[1])
X_new$MEAN <- mean(X,2)
X_new$STD <- sd(X,2)

# 3, Uses descriptive activity names to name the activities in the data set
acts <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
rn <- as.character(y)
for (i in 1:6){
    rn[y==i] = acts[i]
}
X_new$activities <- rn

# 4, Appropriately labels the data set with descriptive variable names. 

# 5, Creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject. 
save(X_new, file = "tidydata.RData")
write.table(X_new, "tidydata.txt", sep="\t")
