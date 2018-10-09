ggplot(ToothGrowth, aes(x=train$Loan_Status, y=train$ApplicantIncome)) + 
  geom_boxplot()+
  geom_jitter(position=position_jitter(0.2))