#create a new feature of the number of Na in an observation
train_NAs<-NULL
test_NAs<-NULL

for(i in 1:nrow(train)) train_NAs[i]<-sum(is.na(train[i, ]))
train$NA_number<-train_NAs

for(i in 1:nrow(test)) test_NAs[i]<-sum(is.na(test[i, ]))
test$NA_number<-test_NAs

#the ratio of missing for each variable
names<-names(train)
missing<-data.frame(variable=names,missing_proportion=sapply(names,function(x) sum(is.na(train[x]))/nrow(train)))
missing #The missing rate does not exceed 10%

#input missing values by package mice, considering that the missing values are not MNAR(missing not at random)
trainimp<-mice(data=train,m=5,maxit = 10,method="pmm",printFlag=FALSE,seed=0817) #estimate fitting values for continuous variables using predictive mean matching of mice
newtrain<-complete(trainimp) #imput the estimated missing values
sum(is.na(newtrain)) #all missing value are imputed

testimp<-mice(data=test[-1],m=5,maxit = 10,method="pmm",printFlag=FALSE,seed=0817) 
newtest<-complete(testimp) #imput the estimated missing values for test dataset as well


#remove unneeded variables
newtrain$term360<-NULL
newtrain$status<-NULL
newtrain$Total_Income<-NULL