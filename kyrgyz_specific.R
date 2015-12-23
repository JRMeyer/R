#specific to Kyrgyz corpus
wordsCVCC<-grep("^[^аеиоуюяёыэөүь][аеиоуюёяыэөүь][^аеиоуюёяыэөүь][^аеиоуюёяыэөүь]$", y, perl=T, value=T)
wordsCVC<-grep("^[^аеиоуюяёыэөү][аеиоуюяёыэөү][^аеиоуюяёыэөү]$", y, perl=T, value=T)
first3<-regexpr("^...", wordsCVCC)
first3<-regmatches(wordsCVCC,first3)

words<-grep("[пбтдцчгкж][юяё]", sorted.table, perl=T, value=T)

wordsу<-grep("у", sorted.table, perl=T, value=T)
wordsуу<-grep("уу", sorted.table, perl=T, value=T)
wordsа<-grep("а", sorted.table, perl=T, value=T)
wordsаа<-grep("аа", sorted.table, perl=T, value=T)
wordsо<-grep("о", sorted.table, perl=T, value=T)
wordsоо<-grep("оо", sorted.table, perl=T, value=T)
wordsэ<-grep("э", sorted.table, perl=T, value=T)
wordsээ<-grep("ээ", sorted.table, perl=T, value=T)
wordsи<-grep("и", sorted.table, perl=T, value=T)
wordsии<-grep("ии", sorted.table, perl=T, value=T)
wordsө<-grep("ө", sorted.table, perl=T, value=T)
wordsөө<-grep("өө", sorted.table, perl=T, value=T)
wordsү<-grep("ү", sorted.table, perl=T, value=T)
wordsүү<-grep("үү", sorted.table, perl=T, value=T)
wordsы<-grep("ы", sorted.table, perl=T, value=T)
wordsыы<-grep("ыы", sorted.table, perl=T, value=T)



y<-TOTAL_freqlist_Kyrgyz$WORD

CVC<-grep("^[пбтдцчгкж]+[аеиоуюяёыэөү][пбтдцчгкж]+$", y, perl=T, value=T)
CVCV_C<-grep("^[пбтдцчгкж]+[аеиоуюяёыэөү][пбтдцчгкж]+[аеиоуюяёыэөү]+[^аеиоуюяёыэөү]*$", y, perl=T, value=T)
C_VCVC<-grep("^[^аеиоуюяёыэөү]*[аеиоуюяёыэөү][пбтдцчгкж]+[аеиоуюяёыэөү][пбтдцчгкж]+$", y, perl=T, value=T)

CVVC<-grep("^[пбтдцчгкж]+[аеиоуюяёыэөү]{2}[пбтдцчгкж]+$", y, perl=T, value=T)
CVVC<-CVVC[substr(CVVC,2,2)==substr(CVVC,3,3)]

CVVCV_C<-grep("^[пбтдцчгкж]+[аеиоуюяёыэөү]{2}[пбтдцчгкж]+[аеиоуюяёыэөү]+[^аеиоуюяёыэөү]*$", y, perl=T, value=T)
CVVCV_C<-CVVCV_C[substr(CVVCV_C,2,2)==substr(CVVCV_C,3,3)]

C_VCVVC<-grep("^[^аеиоуюяёыэөү]*[аеиоуюяёыэөү][пбтдцчгкж]+[аеиоуюяёыэөү]{2}[пбтдцчгкж]+$", y, perl=T, value=T)
good<-{}
for (i in C_VCVVC){
  len<-nchar(i)
  good<-unique(c(good,C_VCVVC[substr(C_VCVVC,len-2,len-2)==substr(C_VCVVC,len-1,len-1)]))
}
