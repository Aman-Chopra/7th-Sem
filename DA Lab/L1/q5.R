q5<-function(a)
{
  max=-9999
  for(i in 1:length(a))
  {
    if(max<a[i])
    {
      max=a[i];
      ind = i;
    }
  }
  cat("max no = ",max,"\n")
  cat("index = ",ind)
}