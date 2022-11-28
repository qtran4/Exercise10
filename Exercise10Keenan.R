#Problem 1: Cumulative score graphing
library(ggplot2)
#Load in data
rawData <- read.table('UWvMSU_1-22-13.txt', header = TRUE)

#create cumulative score variables and dataframes
UWCumScore <- 0
MSUCumScore <- 0
uw <- data.frame(matrix(ncol = 2, nrow = 0))
msu <- data.frame(matrix(ncol = 2, nrow = 0))
first_entry <- data.frame(0,0)
names(first_entry)<-c('time', 'score')
cn <- c("time", "score")
colnames(uw) <- cn
colnames(msu) <- cn
#put in start score of 0-0
uw<-rbind(uw, first_entry)
msu<-rbind(msu, first_entry)

#populate with cumulative score at each time scored.
for (i in 1:nrow(rawData)) {
  if (rawData[i,]$team =="UW"){
    UWCumScore <- UWCumScore + rawData[i,]$score
    addition1 <- data.frame(rawData[i,]$time, UWCumScore)
    addition2 <- data.frame(rawData[i,]$time, MSUCumScore)
    names(addition1)<- c('time', 'score')
    names(addition2)<- c('time', 'score')
    uw<-rbind(uw, addition1)
    msu<-rbind(msu, addition2)
  } 
  else{
    MSUCumScore <- MSUCumScore + rawData[i,]$score
    addition1 <- data.frame(rawData[i,]$time, MSUCumScore)
    addition2 <- data.frame(rawData[i,]$time, UWCumScore)
    names(addition1)<- c('time', 'score')
    names(addition2)<- c('time', 'score')
    msu<-rbind(msu, addition1)
    uw<-rbind(uw, addition2)
  }
}

#add final score entries
final_entry_uw <- data.frame(40,UWCumScore)
final_entry_msu <- data.frame(40, MSUCumScore)
names(final_entry_msu)<- c('time', 'score')
names(final_entry_uw)<- c('time', 'score')
uw<-rbind(uw, final_entry_uw)
msu<-rbind(msu, final_entry_msu)

#plot the cumulative scores
ggplot(data=msu, aes(x=time, y=score), color='green') + 
  geom_line() + 
  geom_line(data=uw, aes(x=time, y=score), color='red')


#Problem 2: Guessing game
#pick random number 1-100
target_num <- sample(1:100, 1)
correct<-FALSE #set correct boolean to false
guesses<-1 #set number of guesses to 1
print("I'm thinking of a number 1-100...")
guess<- readline(prompt="Guess: ") #get first guess
#Play game until guesses>=10 or correct
while (correct==FALSE){
  if (guesses <10){
    if (strtoi(guess)-target_num>0){
      print("Lower")
      guess<-readline(prompt="Guess: ")
      guesses<- guesses +1
    }
    else if (strtoi(guess)-target_num<0){
      print("Higher")
      guess<-readline(prompt="Guess:")
      guesses <- guesses +1
    }
    else{
      print("Correct!")
      correct <- TRUE
    }
  }
  else{
    print("Out of Guesses!")
    break
  }
}



