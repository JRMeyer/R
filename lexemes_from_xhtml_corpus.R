###
## load in a dir of files (and possibly dirs) where the files 
## correspond to the text of a corpus with lexeme tags as in the RNC

myPaths <- commandArgs(TRUE)
dir <- myPaths[1]
outFile <- myPaths[2]

m<-list.files(dir, recursive=T,full.names=T)
m<-grep(".xhtml",m,value=T,invert=F)

corpus<-{}
for (file in m){
  rawFile<-scan(file,what='char')
  UTFfile <- iconv(rawFile,'windows-1251','utf8')
  lexemes<-grep("lex", UTFfile, value=T)
  corpus<-c(corpus,lexemes)
}

x<-gsub("lex=\"","",corpus)
y<-gsub("\"","",x)

write(y, file=outFile)

  

