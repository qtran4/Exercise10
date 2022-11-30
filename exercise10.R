# Biocomputing 2022
# Exercise 10, 2022-11-18
# Written by Xiyuan Guan

library(ggplot2)

# task 1: figure time vs. score for teams
setwd("C:/Users/guanx/Documents/N.ND/BIOS 60318 Biocomputing/test/exercise10/Exercise10/")

ball <- read.table("UWvMSU_1-22-13.txt",sep = "\t", header = TRUE)
head(ball)
line1 <- c(0,"UW",0)
line2 <- c(0,"MSU",0)
ball <- rbind(line1,line2,ball)
unique(ball$team) # "UW"  "MSU"
ball$time <- as.numeric(ball$time)
ball$sumscore[ball$team=="UW"] <- cumsum(ball$score[ball$team=="UW"])
ball$sumscore[ball$team=="MSU"] <- cumsum(ball$score[ball$team=="MSU"])


ggplot(ball, aes(x=time, y= sumscore, color=team))+
  geom_line(linewidth=1.5)+
  scale_x_continuous(limits = c(0,40),
                     expand = c(0,0),
                     n.breaks = 5,
                     labels = c("0","1st","2nd","3rd","4th"))+
  scale_y_continuous(limits=c(0,50),
                     expand = c(0,0))+
  xlab(NULL)+
  ylab(NULL)+
  theme(panel.grid.major.x = element_line(colour = "grey"),
        panel.grid.major.y = element_line(colour = "grey"),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank())+
  theme(legend.title=element_blank(),
      panel.background = element_rect(fill = "white"))
# How to put sections in the middle of grids?
ball$intr[ball$time<10 & ball$time>=0] <- 5
ball$intr[ball$time<20 & ball$time>=10] <- 15
ball$intr[ball$time<30 & ball$time>=20] <- 25
ball$intr[ball$time<=40 & ball$time>=30] <- 35
ball$section[ball$time<10 & ball$time>=0] <- "1st"
ball$section[ball$time<20 & ball$time>=10] <- "2nd"
ball$section[ball$time<30 & ball$time>=20] <- "3rd"
ball$section[ball$time<=40 & ball$time>=30] <- "4th"


ggplot(ball, aes(x=time, y= sumscore, color=team))+
  geom_line(linewidth=1.5)+
  labs(x = NULL, y= NULL)+
  scale_x_continuous(breaks = ball$intr,
                   labels = ball$section,
                   expand = c(0,0))+
  scale_y_continuous(limits=c(0,50),
                     expand = c(0,0))+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey"),
        panel.grid.minor.x = element_line(colour = "grey"),
        panel.grid.minor.y = element_blank())+
  geom_vline(xintercept = c(0,40), color = "grey")+ 
  theme(legend.title=element_blank(),
        panel.background = element_rect(fill = "white"))

# task 2: Write a game called “guess my number”.

guess_my_number <- function(){
  answer<- sample(1:100,1) # randomly select a number from 1 to 100
  print("I'm thinking of a number 1-100...")
  for(i in 1:10){
    cat("Guess:", scan(what = "interger", n = 1)->guess) # ask player to input a number
    guess <- as.numeric(guess)
    if(guess==answer){
      print("Correct!")
      break
    }else if(guess>answer && guess<=100){
      print("Lower")
    }else if(guess<answer && guess>=1){
      print("Higher")
    }else{
      print("Wrong input! Out of range (1~100)!") # Increased Robustness
    }
    if(i == 10 & guess!=answer){
      print("Run out of times to try! Rerun the code to start a new game.")
      cat("The correct answer is: ", answer)
    }
  }
}
guess_my_number()
