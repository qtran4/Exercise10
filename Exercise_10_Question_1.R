# Hayden Gallo
# Exercise 10 Biocomputing

library(ggplot2)


### Question 1
# 1. Analysis of data surrounding sports teams has grown into a major business for the teams 
#themselves and the media. One cool summary plot that media outlets generate to summarize a game, 
#in this case basketball, is a line graph depicting the cumulative score for each team as a function 
#of time in the game (see below).


basketball_game <- read.table('UWvMSU_1-22-13.txt',header = TRUE, sep = '\t')


cumulative_score <- data.frame(matrix(0,nrow = 51,ncol = 4))
colnames(cumulative_score) <- c('UW', 'MSU', 'Half', 'Proportion')

for (i in 1:nrow(basketball_game)){
  
  if (basketball_game[i,2] == 'UW'){
    cumulative_score[i+1,1] <- basketball_game[i,3] + cumulative_score[i,1]
    cumulative_score[i+1,2] <- cumulative_score[i,2]
  }
  else if (basketball_game[i,2] == 'MSU'){
    cumulative_score[i+1,2] <- basketball_game[i,3] + cumulative_score[i,2]
    cumulative_score[i+1,1] <- cumulative_score[i,1]
  }
  if (basketball_game[i,1] < 20){
    cumulative_score[i+1,3] <- 1
  }
  else {cumulative_score[i+1,3] <- 2}

  cumulative_score[1,3] <- 1
}

cumulative_score[c(2:51),4] <- basketball_game$time/20


ggplot() + 
  geom_line(data = cumulative_score, aes(x = Proportion, y = UW, color = 'UW')) +
  geom_line(data = cumulative_score, aes(x = Proportion, y = MSU, color = 'MSU')) +
  xlab('Half') +
  ylab('Score') +
  ggtitle('UW vs MSU 1/22/13') +
  scale_x_discrete(limits = 0:2)

# Question 2

guesses = 1
random_number <- sample(1:100, 1)
number_guess = readline(prompt = "Enter any number : ")



while(random_number != number_guess){
  guesses = guesses + 1
  if (random_number > number_guess){
    print('Higher')
    number_guess = readline(prompt = "Enter a new number : ")
  }
  if(random_number < number_guess){
    print('Lower')
    number_guess = readline(prompt = "Enter a new number : ")
  }
  if (guesses == 10){
    print('Out of guesses')
    stop = TRUE
    break
  }
  if (random_number == number_guess){
    print('Correct')
  }
}




