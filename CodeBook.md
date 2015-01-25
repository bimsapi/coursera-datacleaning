CodeBook
--------

The data file contains 81 columns, in a comma-delimited format, with a single header row:

* `subject` - an identifier for the subject, a numeric identifier found in `subject_train.txt` files
* `activity` - named activity describing what was happening when the source measures were taken; the 
  values are defined in `activity_labels.txt`
* The remaining 79 variables are the means of the variables from the source data, filtered to the just standard
  deviations and means recorded in the source data sets.
  * The are all normalized the range [-1, 1], based on the values in the original source, which were normalized
    to the same range.
  * The source values are gravity units taken from the 3 axes (X, Y, Z) of a smartphone accelerometer
  
Each row is the mean of the 79 variables, grouped by each subject and activity in the data set.