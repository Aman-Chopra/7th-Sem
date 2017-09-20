q4<-function(a,b)
{
  flag=0
  for(i in 1:length(a))
  {
    for(j in 1:length(b))
    {
      if(a[i]==b[j])
      {
        flag=1
        break
      }
    }
    if(flag==1)
      break
  }
  if(flag==1)
    print("Not Disjoint")
  else
    print("Disjoint")
}