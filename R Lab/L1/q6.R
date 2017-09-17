q6<-function(a,b)
{
  sum=0
  for(i in a:b)
  {
    if(i%%2!=0)
      sum = sum+i
  }
  cat("sum = ",sum)
}