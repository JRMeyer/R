#################################
## SIMULATING A 1x3 Experiment ##
#################################


rm(list=ls())

### Condition 1 ###
n1=30                    #number of items per condition
stand.dev.approx1=150    #this number, times a random number between -1<->1, gets added to the average RT
average.RT.approx1=1200  #this number, plus noise from StandDev above, becomes the reaction time
  
### Condition 2 ###
n2=30                    #number of items per condition
stand.dev.approx2=150    #this number, times a random number between -1<->1, gets added to the average RT
average.RT.approx2=1100  #this number, plus noise from StandDev above, becomes the reaction time

### Condition 2 ###
n3=30                    #number of items per condition
stand.dev.approx3=150    #this number, times a random number between -1<->1, gets added to the average RT
average.RT.approx3=1100  #this number, plus noise from StandDev above, becomes the reaction time


condition1<-rnorm(n1)                     # makes a numeric object of randomly distributed numbers between -1<->1
condition1<-condition1*stand.dev.approx1  # make some noise in the data
condition1<-condition1+average.RT.approx1 # makes the actual values per item

condition2<-rnorm(n2)                     # makes a numeric object of randomly distributed numbers between -1<->1
condition2<-condition2*stand.dev.approx2  # make some noise in the data
condition2<-condition2+average.RT.approx2 # makes the actual values per item

condition3<-rnorm(n3)                     # makes a numeric object of randomly distributed numbers between -1<->1
condition3<-condition3*stand.dev.approx3  # make some noise in the data
condition3<-condition3+average.RT.approx3 # makes the actual values per item


mean(condition1)
mean(condition2)
mean(condition3)

mean(condition1)-mean(condition2)
mean(condition2)-mean(condition3)
mean(condition1)-mean(condition3)

(mean(condition1)+mean(condition2)+mean(condition3))/3
    
sd(condition1)
sd(condition2)
sd(condition3)

RTs<-c(condition1,condition2,condition3)
IDs<-c(rep("condition1",n1),rep("condition2",n2),rep("condition3",n3))
     
test<-data.frame(IDs,RTs)
#test
     
model<-lm(RTs~IDs,test)
summary(model)