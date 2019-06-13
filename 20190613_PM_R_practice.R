#Drop the variables
rm(list=ls())

# Import Packages
library(quantmod)

# Set working directory
setwd("C:/Users/Affinity/Desktop/00_그룹IT신기술사관학교_실습파일/Pro_3차수_통계분석실습")

# Data import obs - observations
mydat = read.csv("corporate_finance_demo.csv", head = T)
head(mydat)

# MKTCAP 열에서 NA값을 가진 행을 데이터 전체에서 지우는 방법(하나씩 하는방법)
(!is.na(mydat$MKTCAP)) & (!is.na(mydat$TOBINSQ))
mydat2 = mydat[(!is.na(mydat$MKTCAP)) & (!is.na(mydat$TOBINSQ)),]
# 변수들 안에 NA 값을 날리는 것(쉬운 방법)
mydat2 = mydat[complete.cases(mydat),]

str(mydat2)
summary(mydat2)

mydat[mydat2$SALE > 100000 , c("SALE")]
#hist(mydat[mydat2$SALE > 100000, c("SALE")], breaks=10)
plot(density(mydat2$SALE))

#실습 
hist(mydat2$DIVPAY)
hist(mydat2$DIVPAY[mydat2$DIVPAY < 0.5]) # 조건을 어디에 주느냐에 따라 다르다 / 값은 같다
hist(mydat2[mydat2$DIVPAY < 0.5, c("DIVPAY")]) # 조건을 어디에 주느냐에 따라 다르다 / 값은 같다 
mydat2$DIVPAY[mydat2$DIVPAY < 0.5] == mydat2[mydat2$DIVPAY < 0.5, c("DIVPAY")] # 같으므로 둘의 값은 all true
plot(density(mydat[mydat$DIVPAY < 0.5, c("DIVPAY")]))

## X = AT, Y = SALE

df = mydat2[,c("AT", "SALE")]
head(df)
plot(df$AT, df$SALE)


lm(SALE~AT, data=df)
result = lm(SALE~AT, data=df)
summary(result)
plot(df$AT, df$SALE, main ="linear regression", xlab="TOTAL ASSETS", ylab = "SALES")
abline(result, col='Red')

##TAKE LOG OF AT

df = mydat2[,c("AT", "SALE")]
df$logAT= log(df$AT)
head(df)

lm(SALE~logAT, data=df)
result = lm(SALE~logAT, data=df)
summary(result)
plot(df$logAT, df$SALE)
abline(result, col='Red')

## Multiple Regression

head(mydat2)
df = mydat2[,c("AT", "SALE", "TOBINSQ")]
head(df)
lm(SALE~AT+TOBINSQ, data=df) #x변수는 더하기로 연결할 것
result = lm(SALE~AT+TOBINSQ, data=df)
summary(result)
test1 = df[1:10, c("AT", "TOBINSQ")]
predict(result, test1)
## Multiple : Y : ROA, X1 : AT< X2 : TOBINSQ, X3 : SALE

head(mydat2)
df = mydat2[, c("ROA", "AT", "TOBINSQ", "SALE")]
head(df)

lm(ROA~AT+TOBINSQ+SALE, data=df)
result2 = lm(ROA~AT+TOBINSQ+SALE, data=df)
test2 = df[1:10, c("AT", "TOBINSQ", "SALE")]
summary(result2)
predict(result2, test2)
