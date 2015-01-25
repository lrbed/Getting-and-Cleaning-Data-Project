
#Load all the interesting files
ActivityLabels <- read.table("./activity_labels.txt", header=FALSE)
Features <- read.table("./features.txt", header=FALSE)
X_train <- read.table("./train/x_train.txt", header=FALSE)
Y_train <- read.table("./train/y_train.txt", header=FALSE)
X_test <- read.table("./test/x_test.txt", header=FALSE)
Y_test <- read.table("./test/y_test.txt", header=FALSE)
Subject_test <- read.table("./test/subject_test.txt", header=FALSE)
Subject_train <- read.table("./train/subject_train.txt", header=FALSE)

# Prepare data to be merged in one table
# 1. Merge Y Tables vertically with rbind (y_train on top of y_test)
# Y_train (7352 X 1)+ Y_test (2947 X 1) = Y_data (10299 X 1) 
Y_data <- rbind(Y_train, Y_test)

# 2. Merge X Tables vertically with rbind (x_train on top of x_test)
# X_train (7352 X 561)+ X_test (2947 X 561) = X_data (10299 X 561)
X_data <- rbind(X_train, X_test)

# 3. Merge Subject Tables vertically with rbind (train on top of test)
# Subject_train (7352 X 1)+ Subject_test (2947 X 1) = Subject_data (10299 X 1) 
Subject_data <- rbind(Subject_train, Subject_test)

# 4. Merge all three tables on one (X + Subject + Y)
# X_data (10299 X 561) + Subject_data (10299 X 1) + Y_data (10299 X 1) = Merged (10299 X 563)
Merged <- cbind(cbind(X_data, Subject_data), Y_data)

# Set the header names from Features files + the two extra files from Y/Subject tables
ColNames <- c(as.character(Features$V2), "Subject", "Activity")
names(Merged) <- ColNames
names(ActivityLabels) <- c("ActivityID", "ActivityName")

# Prepare to subset the data to only the headers that are Mean or STD, plus the Activity and Subject
# the idea is to run a regex against the column names to find the subset (Headers_Fitlered), then 
# filter out the interesting header to a new variable named: (Merged_Desc)
Headers_Filtered <- Merged[grep(".*mean.*|.*std.*|Activity|Subject", names(Merged))]
Merged_Desc <- merge(Headers_Filtered, ActivityLabels, by.x="Activity",by.y="ActivityID")

# Update the columns names 
ColNames <- names(Merged_Desc)

# Clean the headers by replacing the names according to the code-book of the research where
# f = Frequency ; t = Time, Acc = Accelerometer; Gyro = Gyroscope; Jerk = JerkSignal; Mag = Magnitude, and finally clear out any extra non-alphanumeric character
names(Merged_Desc) <- gsub("^f","Freq",names(Merged_Desc))
names(Merged_Desc) <- gsub("^t","Time",names(Merged_Desc))
names(Merged_Desc) <- gsub("Acc","Accelerometer",names(Merged_Desc))
names(Merged_Desc) <- gsub("Gyro","Gyroscope",names(Merged_Desc))
names(Merged_Desc) <- gsub("Jerk","JerkSignal",names(Merged_Desc))
names(Merged_Desc) <- gsub("Mag","Magnitude",names(Merged_Desc))
names(Merged_Desc) <- gsub("[[:punct:]]","-",names(Merged_Desc))

# Calculate the mean based for each subject for each type of activity
# variable used: AGGREGATED
AGGREGATED <- aggregate( . ~ Subject * Activity, data= Merged_Desc, FUN=mean)

# Write result to a text file named (tidy_data.txt) for final submission
write.table(AGGREGATED, "tidy_data.txt")
