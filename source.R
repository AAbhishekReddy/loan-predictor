#setwd("C:/Users/ghost/Desktop/minor")
train<-read.csv("loans.csv")
test<-read.csv("loans-test.csv")


#turn binary variable Credit_History into factor
train$Credit_History<-factor(train$Credit_History,labels = c("N","Y"))
test$Credit_History<-factor(test$Credit_History,labels = c("N","Y"))

#convert factor variable Dependents into numeric
levels(train$Dependents)[levels(train$Dependents)=="3+"] <- "3"
train$Dependents<-as.integer(as.character(train$Dependents))
levels(test$Dependents)[levels(test$Dependents)=="3+"] <- "3"
test$Dependents<-as.integer(as.character(test$Dependents))

#remove the id column 
train<-train[-1]

#some NA's are coded as empty strings
train$Gender[train$Gender==""] <- NA
train$Married[train$Married==""] <- NA
train$Self_Employed[train$Self_Employed==""] <- NA
test$Gender[test$Gender==""] <- NA
test$Married[test$Married==""] <- NA
test$Self_Employed[test$Self_Employed==""] <- NA

train$Married<-droplevels(train$Married) #test data does not have the empty level as train data does