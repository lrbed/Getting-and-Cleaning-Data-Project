# Getting-and-Cleaning-Data-Project

# 1. Merge all files of train and test to one big file
* Load all the interesting files to se
* Prepare data to be merged in one table
* Merge Y Tables vertically with rbind (y_train on top of y_test)
* Merge X Tables vertically with rbind (x_train on top of x_test)
* Merge Subject Tables vertically with rbind (train on top of test) 
* Merge all three tables on one (X + Subject + Y)

# Set the headers values
* Set the headers names from Features files 
* the two extra files from Y/Subject tables

# Extract the subset of data based on headers value
* Prepare to subset the data to only the headers that are Mean or STD, plus the Activity and Subject; the idea is to run a regex against the column names to find the subset (Headers_Fitlered), then 
* filter out the interesting header to a new variable named: (Merged_Desc)
* Update the columns names 

# Clean up the headers for easy reading
* replacing the names according to the code-book of the research 
* summary of conditions used  [ f = Frequency ; t = Time, Acc = Accelerometer; Gyro = Gyroscope; Jerk = JerkSignal; Mag = Magnitude, and finally clear out any extra non-alphanumeric character]

# Summarize the data to the mean values of each subject and each activity  
* Calculate the mean based for each subject for each type of activity ( 30 Subject X 6 Activities = 180 different recrods)
* variable used: AGGREGATED

# Output
* Write result to a text file named (tidy_data.txt) for final submission

# Files attached:
* Run_Analysis.R : contins the R code used to generate the results
* ReadMe : briefing the steps followed
* Code Book: summarizing the variables used and their description
* tidy_data: output/result generated from this code.