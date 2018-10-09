set.seed(817)
tune_grid<-expand.grid(mtry=c(1:10), ntree=c(500,1000,1500,2000)) #expand a grid of parameters
mtry<-tune_grid[[1]]
ntree<-tune_grid[[2]] #using vectors instead of dataframe to subset is faster in for loop
OOB<-NULL #use to store calculated OOB error estimate
for(i in 1:nrow(tune_grid)){
  rf<-randomForest(Loan_Status~. ,newtrain, mtry=mtry[i], ntree=ntree[i])
  confusion<-rf$confusion
  temp<-(confusion[2]+confusion[3])/614 #calculate the OOB error estimate
  OOB<-append(OOB,temp)
}
tune_grid$OOB<-OOB
head(tune_grid[order(tune_grid["OOB"]), ], 4) #order the results 

# Random forest
final_rf<-randomForest(Loan_Status~. ,newtrain, mtry=3, ntree=1000)