###### Create Frequency list from Text Corpus ######

myPaths <- commandArgs(TRUE)
inFile <- myPaths[1]
outFile <- myPaths[2]

#load the text file corpus
textfile<-scan(file=inFile, what="char", sep="\n", quote="", comment.char="")

#make all words lowercase
textfile<-tolower(textfile)

#split up the file at every occurance of a non-word character, hence the (\\W)
words.list<-strsplit(textfile,"\\W")

#change the list of words into a vector
words.vector<-unlist(words.list)

#generate a frequency list of the vector
freq.list<-table(words.vector)

#sort that frequency list in descending order of frequency
sorted.freq.list<-sort(freq.list, decreasing=T)

#take a peek at what you got!
head(sorted.freq.list)

#paste all words and their frequencies together
sorted.table<-paste(names(sorted.freq.list), sorted.freq.list, sep="\t")

#save the frequency list to a user friendly file using cat
cat("WORD\tFREQ", sorted.table, file=outFile, sep="\n")