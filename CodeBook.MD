Code Book
=========

Raw Data in this project
------------------------

There are 2 types of the data files in this project - Test and Train
Also there are 3 files (tables) for each type those are the tables 
     -   X_train.txt: 7352 obs. of 561 features, 21 of 30 volunteers 
     -   X_test.txt: 2947 obs. of 561 features, 9 of 30 volunteers
     -   Y_train.txt: 7352 obs. of Labled number, 21 of 30 volunteers
     -   Y_test.txt: 2947 obs. of Labled number, 9 of 30 volunteers
     -   subject_train.txt: a vector of 7352 integers, the sujbect number
     -   subject_test.txt: a vector of 2947 intergers, the sujbect number

In addition, the list of features and the activity labels are loaded
into the project. 
-   features.txt: names of the 561 features
-   activity_labels.txt: IDs and names of the 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Transformation
--------------

1.  All of the above data files were readed into data frames. Column
    headers were added, and the training and test sets were merged into
    one data set.
2.  The measurements on the mean "mean" and standard deviation "std"
    were extracted. 86 features were selected. Combined with subject
    and activity labels, 88 columns were remained.
3.  The descriptive activity names were used to name the activities in
    the data set.
4.  The original variable names were modified with descriptive
    variable names.
5.  A second, independent tidy data set was created with the average of
    each variable for each activity and each subject.There are 180 obs.
    of 88 variables.
6.  The tidy data set was output to a text file called final.
