CodeBook
--------

The data file contains 81 columns, in a comma-delimited format, with a single header row:

* `subject` - an identifier for the subject, a numeric identifier found in `subject_train.txt` files
* `activity` - named activity describing what was happening when the source measures were taken; the 
  values are defined in `activity_labels.txt`
* The remaining 79 variables in each are the means of the variables from the source data (`X_train.txt` and `X_text.txt`)
  filtered to the just standard
  deviations and means recorded in the source data sets, and grouped by distinct "subject", "activity" pairs
  * The are all normalized the range [-1, 1], based on the values in the original source, which were normalized
    to the same range.
  * The normalized source values are derived gravity units taken from the 3 axes (X, Y, Z) of a smartphone accelerometer
  
