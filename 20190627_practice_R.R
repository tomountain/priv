
bank=read.csv("bank-full.csv", header = TRUE, sep = ";", quote = "\"")

class(bank)
str(bank)
plot(bank$y)
table(bank$y)
pie(table(bank$y))

set.seed(1234)
ind<-sample(2,nrow(bank),replace=T,prob=c(0.7,0.3))
trainData<-bank[ind==1,]
testData<-bank[ind==2,]
bank_ctree<-ctree(y~.,data=trainData, controls=ctree_control(maxdepth = 3))
print(bank_ctree)

testPred<-predict(bank_ctree, newdata=testData)
table(testData$y, testPred)
plot(bank_ctree, type="simple")
confusionMatrix(testPred,testData$y,positive="yes",mode="prec_recall")

library(caret)
install.packages('e1071', dependencies=TRUE)

table(bank$y)
prop.table(table(bank$y))

install.packages("ROSE")
library(ROSE)
trainData.bal<-ovun.sample(y~., data = trainData, p = 0.5, seed = 1, method = "both")$data
str(trainData.bal)
prop.table(table(trainData.bal$y))

bank_ctree_bal<- ctree(y~., data=trainData.bal, controls = ctree_control(maxdepth = 3))
print(bank_ctree_bal)
testPred_bal<-predict(bank_ctree_bal, newdata=testData)
table(testData$y, testPred_bal)
plot(bank_ctree_bal, type="simple")
confusionMatrix(testPred_bal, testData$y, positive = "yes", mode = "prec_recall")



churn_train<-read.csv("churnTrain.csv")
churn_test<-read.csv("churnTest.csv")
index(churn_test)
str(churn_test)
ncol(churn_test)
nrow(churn_test)
head(churn_test)
dim(churn_train)
head(churn_train)
plot(churn_train$churn)
pie(plot(churn_train$churn))

churnData.bal<-ovun.sample(churn~., data=churn_train, p = 0.5, seed = 1, method = "both")$data
str(churnData.bal)
plot(churnData.bal$churn)
churn_ctree_bal<-ctree(churn~., data = churnData.bal, controls = ctree_control(maxdepth = 3))
print(churn_ctree_bal)

testPred_churn_bal <- predict(churn_ctree_bal, newdata = churn_test)
table(churn_test$churn, testPred_churn_bal)
plot(churn_ctree_bal, type = "simple")
confusionMatrix(testPred_churn_bal, churn_test$churn, positive = "yes", mode = "prec_recall")

set.seed(1234)
ind<-sample(2, nrow(iris), replace=T, prob=c(7,3))
trainData=iris[ind==1,]
testData=iris[ind==2,]
install.packages("nnet")
library(nnet)
model.nnet<-nnet(Species~., data=trainData, size = 2, decay = 5e-04)
summary(model.nnet)
testPred<-predict(model.nnet, newdata = testData, type = "class")
table(testData$Species, testPred)

bank=read.csv("bank-full.csv", header = TRUE, sep = ";", quote = "\"")
set.seed(1234)
ind<-sample(2, nrow(bank), replace = TRUE, prob=c(0.7,0.3))
trainData = bank[ind==1,]
testData = bank[ind==2,]
model.nnet<-nnet(y~., data = trainData, size = 4, decay = 5e-04)
testPred<-predict(model.nnet, newdata = testData, type = "class")
table(testData$y, testPred)
confusionMatrix(as.factor(testPred), testData$y, positive = "yes", mode = "prec_recall")

trainData_bal <- ovun.sample(y~., data=trainData, p = 0.5, seed = 1, method = "both")$data
plot(trainData_bal$y)
model.nnet <- nnet(y~., data = trainData_bal, size = 4, decay = 5e-04)
testPred_bal <- predict(model.nnet, newdata = testData, type = "class")
table(testData$y, testPred_bal)
confusionMatrix(as.factor(testPred_bal), testData$y, positive = "yes", mode = "prec_recall")


