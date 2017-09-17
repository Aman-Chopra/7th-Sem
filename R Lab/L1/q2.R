q2<-function(k,x)
{
  c<-0
  for(i in 1:k)
  {
    if(i%%x==0)
      {
        print(i)
        c<-c+1
      }
  }
  print("no. of elements:")
  print(c)
}
#integer.readline()