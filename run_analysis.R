#The folder you are working on shold be "UCI HAR Dataset" folder

library("dplyr")

for (dataName in c("subject","X","Y")){ #For reading al 6 train and test file, i used 2 loops
  tempTable=data.frame() #empty table will used to combine 2 tables
  for (dataType in c("train","test")){ 
    dataFullName <- paste(dataName,dataType,sep = "_") #creating file name from data name to use for 
    fileLocation <- paste(dataType,dataFullName,sep = "/") %>% paste("txt",sep=".") #creating  file location path
    tempTable<- rbind(read.table(fileLocation, header = FALSE),tempTable) #Reading the file and combining train and test data.
  }
  tableName <- paste(dataName,"table",sep = "_") 
  assign(tableName,tempTable) #Creating 3 combined tables
}


features <- read.table("features.txt", header = FALSE)
colnames(X_table) <- features$V2 #Assigning labels  from features file to column names


X_table <- X_table[,grep("std|mean|Mean|Std",features$V2)] #Extracting only columns with std/mean

activity_labels_table <- read.table("activity_labels.txt", header = FALSE) #Reading the file of activity lables

Y_table <- mutate(Y_table,activity=activity_labels_table[V1,2]) #Assigning labels  from activity table

X_table <- cbind(activity=Y_table$activity,Subject=subject_table$V1,X_table) #Adding 2 columns - Subject and Activity

summary_table <- group_by(X_table,activity,Subject)
final <- summarise_each(summary_table,funs(mean)) #Creating the final table with group by and mean of every measurement

write.table(final, "final.txt", row.names = FALSE, quote = FALSE) #Creating txt file named final