##### thinking about power
### running simulations for stats with R
## with 30 items in two conditions

rm(list=ls())

#number of items per condition
n=30

#difference in milliseconds between conditions
difference.between.conditions=80

#this number, times a random number between -1<->1, gets added to the average RT
stand.dev.approx=150

#this number, plus noise from StandDev above, becomes the reaction time
average.RT.approx=1100
  
# makes a numeric object of randomly distributed numbers between -1<->1
faster<-rnorm(n)

# make some noise in the data
faster<-faster*stand.dev.approx

# makes the actual values per item
faster<-faster+average.RT.approx

slower<-faster
slower<-slower-difference.between.conditions

mean(faster)
mean(slower)

mean(faster)-mean(slower)
(mean(faster)+mean(slower))/2
    
sd(faster)
sd(slower)

RTs<-c(faster,slower)
IDs<-c(rep("faster",n),rep("slower",n))
     
test<-data.frame(IDs,RTs)
     
model<-lm(RTs~IDs,test)
summary(model)