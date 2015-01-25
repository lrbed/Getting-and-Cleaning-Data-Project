Code Book (Variables Description)
==================================


# Set of variables used to load the raw_data from the files:
----------------------------------------------------------
	* ActivityLabels : variable to load ActivityLabels file
	* Features : variable to load Features file
	* X_train : variable to load X_train file
	* Y_train : variable to load Y_train file
	* X_test : variable to load X_test file
	* Y_test : variable to load Y_test file
	* Subject_test : variable to load Subject_test file
	* Subject_train : variable to load Subject_train file

# Set of variables used to merge all the raw_data in one big consistent file:
---------------------------------------------------------------------------
	* Y_data : variable to merge both Y files *(test & train)* to one variable
	* X_data : variable to merge both X files *(test & train)* to one variable
	* Subject_data : variable to merge both Subject files *(test & train)* to one variable
	* Merged	: to merge above three variables in one 

# Set of variable used to process and manipulate data
----------------------------------------------------------
	* ColNames : list of headers/columns names, updated along the process
	* Headers_Fitlered: subset of main data file filtered based on headers value, whether it contains MEAN/STD/Activity/Subject
	* Merged_Desc: Same version of above *(Headers_Filtered)* with Activity labels added (mapped to Activity ID)
	* AGGREGATED : aggregated version of last version above *(Merged_desc)*, used to calculate mean for each activity for each subject
	* tidy_data.txt : Name of the results to hold the tidy data.
