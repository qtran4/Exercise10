setwd("/Users/7907blueyes/Desktop/Biocomputing/R/Exercise10")

# ggplot2 and load
library(ggplot2)

###### PROBLEM 1
# read in data file
scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)

# create empty score for each time 
UW <- numeric(nrow(scores))
MSU <- numeric(nrow(scores))

# create a new data frame
cumulative.score <- data.frame(Time = scores$time, UW, MSU)

# calculate cumulative scores
# separate scores by team 
for(i in 1:nrow(scores)){
  if(scores$team[i] == "UW"){
    cumulative.score$UW[i] <- scores$score[i] 
  }else if(scores$team[i] == "MSU"){
    cumulative.score$MSU[i] <- scores$score[i] 
  }
}
# make scores cumulative
for(i in 2:nrow(cumulative.score)){
  cumulative.score$UW[i] <- cumulative.score$UW[i] + cumulative.score$UW[i -1]
  cumulative.score$MSU[i] <- cumulative.score$MSU[i] + cumulative.score$MSU[i -1]
}

# make a graph
ggplot(data = cumulative.score, aes(x = Time)) + 
  geom_line(aes(y = UW), color = "black") +
  geom_line(aes(y = MSU), color = "blue") +
  ylab("Score")

##########
########## PROBLEM 2
##########

# get user number, random number and max number of guesses
guess <- scan(n=1)
randNum <- sample(1:100, 1)
maxGuesses <- 10

# for loop to see if correct
for(try in 1:maxGuesses){
  if(guess == randNum){
    print("Correct")
    
    # break for loop if guess is made before the tenth try
    if (try < 10) break
    
  }else if(try == maxGuesses){
    print("Game Over :(")
  }else if(guess < randNum){
    print("Higher")
    guess <- scan(n=1)
  }else {
    print("Lower")
    guess <- scan(n=1)
  }
}
