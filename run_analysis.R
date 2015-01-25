library(plyr)

merge.datasets <- function(file.name='output.txt') {
  #load features
  raw.features <- read.table('./UCI HAR Dataset/features.txt', sep=' ', stringsAsFactors = FALSE)[,2]
  #indices of features
  target.features <- grep('mean|std', raw.features)
  #names of features
  target.feature.names <- raw.features[target.features]
  
  #load activities and names
  activities <- read.table('./UCI HAR Dataset/activity_labels.txt', 
                           header=FALSE, 
                           sep=' ', 
                           col.names=c('activity.id', 'activity.name'))
  
  #load training data
  train <- read.table('./UCI HAR Dataset/train/X_train.txt', header=FALSE)
  subject <- readLines('./UCI HAR Dataset/train/subject_train.txt')
  activity <- read.table('./UCI HAR Dataset/train/y_train.txt', col.names=c('activity.id'))
  activity <- join(activity, activities, by='activity.id')[,'activity.name']
  train <- cbind(subject, activity, train[,target.features])
  
  #load test data
  test <- read.table('./UCI HAR Dataset/test/X_test.txt', header=FALSE)
  subject <- readLines('./UCI HAR Dataset/test/subject_test.txt')
  activity <- read.table('./UCI HAR Dataset/test/y_test.txt', col.names=c('activity.id'))
  activity <- join(activity, activities, by='activity.id')[,'activity.name']
  test <- cbind(subject, activity, test[,target.features])
  
  combined <- rbind(train, test)
  names(combined) <- c('subject', 'activity', target.feature.names)
  
  final <- aggregate(combined[,target.feature.names], by=list(combined$subject, combined$activity), FUN=mean)
  names(final) <- names(combined)
  write.table(final, file = file.name, row.names = FALSE, sep=',')
  final
}

merge.datasets()