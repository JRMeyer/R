library(vowels)
library(ggplot2)

dataFile = "results.txt"
itemFile = "stims.txt"

results <- read.delim(dataFile)
subdata<-subset(results[c(1,2,12,15,18,21)])
colnames(subdata)<-c("speaker", "item", "F0", "F1", "F2", "F3")
item_list <- read.table(itemFile, header=TRUE, quote="\"")
colnames(item_list)<-c("word", "item", "vowel")
newdata<-merge(subdata,item_list)

newdata<-(subset(newdata, grepl(".....", item)))

newdata$context<-NA
newdata$F1_glide<-NA
newdata$F2_glide<-NA
newdata$F3_glide<-NA

normdata<-(newdata[c(2,8,9,4,5,6,10,11,12)])

normdata<- norm.wattfabricius(normdata)
normdata<-normdata[c(1,2,4,5)]

colnames(normdata)<-c("speaker", "vowel", "F1", "F2")

###
##     density map vowel space
#

ggplot(normdata, aes(x = F2, y = F1, ymin=0.3, ymax=2.15, xmin=0, xmax=2.5, color=factor(vowel))) +
  stat_density2d(geom="density2d", aes(label= factor(vowel)), size=.75, contour=TRUE) + 
  scale_y_reverse() +  scale_x_reverse() +
  theme_bw() + scale_color_hue(name="Vowels", breaks=unique(normdata$vowel), labels=c("o","ø","e" ,"y","a", "u", "i", "I")) +
  labs(title="Kyrgyz Vowel Space") + xlab("F2") + ylab("F1") +
  theme(plot.title = element_text(size=22, face="bold", vjust=1), 
        axis.title= element_text(size=20), 
        axis.text=element_text(size=14), 
        legend.title= element_text(size=20), 
        legend.text=element_text(size=20))

#
##
###

###
##      mean points vowel space
#

avgs<-(normdata[c(2,3,4)])
F1<-aggregate( F1~vowel, avgs, mean )
F2<-aggregate( F2~vowel, avgs, mean )
avgs<-merge(F1,F2)

qplot(x = avgs$F2, y = avgs$F1, ymin=0.5, ymax=2, xmin=0.5, xmax=2, color=factor(avgs$vowel)) +
  scale_y_reverse() +  scale_x_reverse() +
  geom_point(size=5) +
  theme_bw() + scale_color_hue(name="Vowel quality", breaks=unique(avgs$vowel), labels=unique(avgs$vowel))



###
##    bar plot for nonword error Kyrgyz
#     I hard coded the averages in here from the lexical decision data

x<-data.frame(contrast=c("Control", "Round Vowels", "Vowel Length"), error=c(25, 31, 53))
ggplot(x, aes(contrast,error)) + geom_bar(stat = "identity", fill= c("green", "green", "red")) +
  labs(title="Error in Non-word Detection") + xlab("") + ylab("Percent") +
  scale_y_continuous(breaks = round(seq(min(0), max(50), by = 10),10)) +
  theme(plot.title = element_text(size=18, face="bold", vjust=1), 
        axis.title= element_text(size=14, face="bold"),
        axis.text.x =element_text(size=14, face="bold", colour="black"))
##
##
###
