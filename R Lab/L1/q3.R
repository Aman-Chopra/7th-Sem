q3<-function(file,word)
{
    word=paste("\\b",word,"\\b",sep="")
    #print(b)
    names = scan(file, what=character(), quote=NULL )
    idxs = grep(word, names, ignore.case = TRUE)
    length(idxs)
}