setwd("/Users/thomassacchetti/github/Course-Project-Getting-And-Cleaning-Data/")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "Data",method = "curl")
unzip("Data")
datax = read.table("./UCI HAR Dataset/test/X_test.txt")
datay = read.table("./UCI HAR Dataset/test/y_test.txt")
Subject.test = read.table("./UCI HAR Dataset/test/subject_test.txt")
Test.data = cbind(Subject.test,datay,datax)

a = read.table("./UCI HAR Dataset/features.txt")
b = as.character(a[,2])
gf = c("Volunteer.ID","Activity.Labels", b)

colnames(Test.data) = gf

trainx = read.table("./UCI HAR Dataset/train/X_train.txt")
trainy = read.table("./UCI HAR Dataset/train/y_train.txt")
Subject.train = read.table("./UCI HAR Dataset/train/subject_train.txt")

Train.data = cbind(Subject.train,trainy,trainx)
colnames(Train.data) = gf
Total.data = rbind(Test.data,Train.data)

q = grep("mean()", gf)
i = grep("std()", gf)
v = c(1,2,q,i)

Total.data = Total.data[,v]
f = colnames(Total.data)
dc = data.frame()
for(j in 1: 30){
  half = Total.data[Total.data[,1] == j,]
  for(i in 1:6){
  done =  colMeans(half[half[,2] == i,])
  dc = rbind(dc,done)
  }}
activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")

vp = activity_labels[,2]
act_label = rep(vp,30)
dc[,2] = act_label
f = gsub("-",".",f)
colnames(dc) = f
Tidy.data = dc

write.table(Tidy.data,"/Users/thomassacchetti/github/Course-Project-Getting-And-Cleaning-Data/Tidy Data Coursera Project.txt",row.names = F)






