#rf
predictions<-unname(predict(final_rf,newtest[]))
solution<-data.frame(Loan_ID=test[1],Loan_Status=predictions) #predict the test set
write.csv(solution,"SolutionChecker.csv") #write the predicted result into solution checker file