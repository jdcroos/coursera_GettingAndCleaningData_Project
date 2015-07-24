### This file describe the working of run_analysis.R

for the script to work it requires the directory 'UCI HAR Dataset' in your working directory.

You will get a 'dat' dataframe and a 'g_dat' dataframe.
'dat' is the tidy data as composed from the available files.
g_dat is a tidy summary of the 'dat' data, grouped by activity and subject.

The script works as follows:
1) first we load all the available raw files. 
2) We create column names (activities,subject, measured_variables)
3) We merge the all data (train+test) into one dataset 
4) we remove the measurements that are not mean & std measurements
5) We change the activity names by descriptive activity names
6) We group the data by activity & subject, and calculate the mean and std for each measured variable.
