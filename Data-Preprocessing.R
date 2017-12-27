setwd("~/Desktop/R_Srcipts/Data-PreProcessing/")
install.packages("caTools")
library("caTools")


dataset <- read.csv("Data.csv")

dataset$Age <- ifelse(is.na(dataset$Age) , -1 , dataset$Age)
age_matrix <- data.matrix(dataset$Age)
dataset$Age <- ifelse(dataset$Age == -1 , mean(age_matrix[,1]) , dataset$Age)

dataset$Salary <- ifelse(is.na(dataset$Salary) , -1 , dataset$Salary)
salary_matrix <- data.matrix(dataset$Salary)
dataset$Salary <- ifelse(dataset$Salary == -1 , mean(salary_matrix[,1]), dataset$Salary )

dataset$Country <- factor(dataset$Country , levels = c("France" , "Spain" ,"Germany") , labels = c(1,2,3))

dataset$Purchased <- factor(dataset$Purchased , levels = c("Yes" , "No") , labels = c(1,2))


split_data <- sample.split(dataset , SplitRatio = 0.8)

training_data <- subset( dataset  , split_data == TRUE)
testing_data <- subset( dataset  , split_data == FALSE)
