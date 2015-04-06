#########################################
## SIMULATING A 2x3 Experiment & ANOVA ##
#########################################

rm(list=ls())

###
##### GENERAL INFO #####
###

n=30 #number of items per level of factor 2 (factor 2 has 3 levels)
stand.dev.approx=150 #this number, multiplied by a random number between -1<->1, gets added to the average dep.variable value of each item



###
##### Factor 1 (2 levels) #####
###

# Factor 1 assumes 2 levels, and they are evenly balanced 
# across all levels of Factor 2. That is, if you have n=30 
# items for level 1 of factor 2, then the first 15 will be 
# labeled "factor_1_level_1" and the second half "factor_1_level_2" 

### Factor 1 Level 1 ###
factor_1_level_1_effectsize<-80

### Factor 1 Level 2 ###
factor_1_level_2_effectsize<-0



###
##### Factor 2 (3 levels) #####
###

# These three levels are where we tweak the values for average 
# dependent variable value. 

### Factor 2 Level 1 ###
average.dep.variable.approx1=1400 #this number, plus some noise, becomes the dependent variable
  
###  Factor 2 Level 2 ###
average.dep.variable.approx2=1100 #this number, plus some noise, becomes the dependent variable

###  Factor 2 Level 3 ###
average.dep.variable.approx3=1100 #this number, plus some noise, becomes the dependent variable



###
##### SIMULATE THE DATA #####
###


factor_2_level_1<-rnorm(n) # makes a numeric object of randomly distributed numbers between -1<->1
factor_2_level_1<-factor_2_level_1*stand.dev.approx # make some noise in the data
factor_2_level_1<-factor_2_level_1+average.dep.variable.approx1 # makes the actual values per item
#
condition_1_1<-factor_2_level_1[1:(n/2)]+factor_1_level_1_effectsize # add effect of factor 1 level 1
condition_2_1<-factor_2_level_1[1:(n/2)]+factor_1_level_2_effectsize # add effect of factor 1 level 2

factor_2_level_2<-rnorm(n) # makes a numeric object of randomly distributed numbers between -1<->1
factor_2_level_2<-factor_2_level_2*stand.dev.approx # make some noise in the data
factor_2_level_2<-factor_2_level_2+average.dep.variable.approx2 # makes the actual values per item
#
condition_1_2<-factor_2_level_2[1:(n/2)]+factor_1_level_1_effectsize # add effect of factor 1 level 1
condition_2_2<-factor_2_level_2[1:(n/2)]+factor_1_level_2_effectsize # add effect of factor 1 level 2

factor_2_level_3<-rnorm(n) # makes a numeric object of randomly distributed numbers between -1<->1
factor_2_level_3<-factor_2_level_3*stand.dev.approx # make some noise in the data
factor_2_level_3<-factor_2_level_3+average.dep.variable.approx3 # makes the actual values per item
#
condition_1_3<-factor_2_level_3[1:(n/2)]+factor_1_level_1_effectsize # add effect of factor 1 level 1
condition_2_3<-factor_2_level_3[1:(n/2)]+factor_1_level_2_effectsize # add effect of factor 1 level 2


dependent_variable<-c(condition_1_1,condition_2_1,condition_1_2,condition_2_2,condition_1_3,condition_2_3)
factor_1<-c(rep("factor_1_level_1",(n/2)),rep("factor_1_level_2",(n/2)),rep("factor_1_level_1",(n/2)),rep("factor_1_level_2",(n/2)),rep("factor_1_level_1",(n/2)),rep("factor_1_level_2",(n/2)))
factor_2<-c(rep("factor_2_level_1",n),rep("factor_2_level_2",n),rep("factor_2_level_3",n))

test<-data.frame(dependent_variable,factor_1,factor_2)

### means for all conditions
tapply(dependent_variable,list(factor_1,factor_2),mean)
### overall mean
mean(dependent_variable)

### standard deviation for all conditions
tapply(dependent_variable,list(factor_1,factor_2),sd)
### overall standard deviation
sd(dependent_variable)

model<-aov(dependent_variable~factor_1+factor_2,test)
summary(model)