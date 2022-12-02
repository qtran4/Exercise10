##task 1

#load packages
library('ggplot2')

#load the raw data
data <- read.table("UWvMSU_1-22-13.txt",sep = "\t", header = TRUE)

#change single scores to cumulative scores
uw_cumulative_score <- 0
msu_cumulative_score <- 0

for(i in 1:nrow(data)){
  if(data[i,"team"] == "UW"){
    data[i,"score"] <- data[i,"score"] + uw_cumulative_score
    uw_cumulative_score <- data[i,"score"]
  }else if(data[i,"team"] == "MSU"){
    data[i,"score"] <- data[i,"score"] + msu_cumulative_score
    msu_cumulative_score <- data[i,"score"]
  }
}

#add an extra row in case that a team doesn't score for a long time at the end
uw_end <- data.frame(matrix(nrow = 1, ncol = 3))
colnames(uw_end) <- colnames(uw_score)
uw_end[1,"time"] <- 40
uw_end[1,"score"] <- uw_cumulative_score

msu_end <- data.frame(matrix(nrow = 1, ncol = 3))
colnames(msu_end) <- colnames(msu_score)
msu_end[1,"time"] <- 40
msu_end[1,"score"] <- msu_cumulative_score

uw_score <- rbind(data, uw_end)
msu_score <- rbind(data, msu_end)

#generate the plot
ggplot(data = data, mapping = aes(x = time, y = score, colour = team)) + geom_line()


##task 2
#generate a random number
number <- sample(1:100, 1)
#give player 10 chances to guess
wrong_guess_time <- 0
print("I'm thinking of a number 1-100...")

while(TRUE){
  if(wrong_guess_time >= 10){
    print("Sorry, you didn't guess it correctly within ten times")
    break
  }
  guess <- readline("Guess: ")
  guess <- as.integer(guess)
  if(number == guess){
    print("Correct!")
    break
  }else if(number > guess){
    print("Higher")
    wrong_guess_time <- wrong_guess_time + 1
  }else if(number < guess){
    print("Lower")
    wrong_guess_time <- wrong_guess_time + 1
  }
}
