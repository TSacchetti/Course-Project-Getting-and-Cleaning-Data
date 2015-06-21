# Course-Project-Getting-and-Cleaning-Data
This is the Repo for the Course project in Getting and Cleaning Data

The Final results can be seen in a txt version here: https://github.com/TSacchetti/Course-Project-Getting-and-Cleaning-Data/blob/master/Tidy%20Data%20Coursera%20Project.txt

This README will describe the process in which the data was manipulated in order to arrive at the final tidy dataset.

1) The first step was to download to the zip file. I am using a mac so it was important note the method is "curl"
2) Once the file was downloaded it need to be unzipped
3) From there I read the test data along with the features and volunteer IDs
4) Next I used the cbind command to add all three data sets together placing Volunteer IDs, activity and data in that order
5) I used the features file which was given to us to label the columns appropriately, while adding to the left side with the Volunteer.ID and Activity labels which I added on to the test data using the cbind command.
6) I followed the same steps detailed in steps 3-5 with the training data
7) I then used the rbind command to join both the training and test datasets
8) I then used grep to filter for only the columns containing mean(),std() and the first two columns and subsetted the data set using the vector "v"
9) We then had to take the meand of each activity, The outter "for" loop filters for the correct Volunteer ID and subsets the data appropriately then the inner "for" loop subsets the data accordin to activty then once all those activities are sorted,I take the mean for each of the columns. This can be done because we need the mean of each of the data columns and the previous sort loops have ensured that all of the IDs are the same so their mean will be equal to their value.
10) Then I read the activity labels, because I ran the for loop all of the numbers were sorted in repeating order from 1:6, I used the rep function and just replaced the for the second column.
11) I relabeled my columns according to their original original values as they appeared before taking the mean, because that information was lost in the for loops.
12) I wrote the new table using the write.table function.
