Files
=====

* `run_analysis.R` contains a function, `merge.dataset` that reads data from the `UCI HAR Dataset` subdirectory
  and creates the required output for this assignment
* `README.md` - this README file
* `CodeBook.md` - Code book describing variables

All logic for the assignment is contained in the single `.R` file, in the function `merge.dataset`. 
This function creates a file with a user-specified name that defaults to `output.txt`. 
It operates as follows:

Each data set (`train`, `test`) is processed through logic that:

* Loads variables, from `X_[type].txt`, only including those variables whose name contains `mean` or `std`
* Loads activities from `y_[type].txt` converting activity names read from `activity_labels.txt`
* Loads subjects from `subect_train.txt`
* Combined into a new data frame via `cbind`

Then the train and test sets are merged via `rbind()` into a single set, aggregated, and written out.

Notes
=====
The `merged.datasets` function assumes a child directory, `UCI HAR Dataset`with the following structure, 
althought the files in the `Inertial Signals` subdirectories are not used:

    ├── README.txt
    ├── activity_labels.txt
    ├── features.txt
    ├── features_info.txt
    ├── test
    │   ├── Inertial Signals
    │   │   ├── body_acc_x_test.txt
    │   │   ├── body_acc_y_test.txt
    │   │   ├── body_acc_z_test.txt
    │   │   ├── body_gyro_x_test.txt
    │   │   ├── body_gyro_y_test.txt
    │   │   ├── body_gyro_z_test.txt
    │   │   ├── total_acc_x_test.txt
    │   │   ├── total_acc_y_test.txt 
    │   │   └── total_acc_z_test.txt
    │   ├── X_test.txt
    │   ├── subject_test.txt
    │   └── y_test.txt
    └── train
        ├── Inertial Signals
        │   ├── body_acc_x_train.txt
        │   ├── body_acc_y_train.txt
        │   ├── body_acc_z_train.txt
        │   ├── body_gyro_x_train.txt
        │   ├── body_gyro_y_train.txt
        │   ├── body_gyro_z_train.txt
        │   ├── total_acc_x_train.txt
        │   ├── total_acc_y_train.txt
        │   └── total_acc_z_train.txt
        ├── X_train.txt
        ├── subject_train.txt
        └── y_train.txt


