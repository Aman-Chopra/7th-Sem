q1<-function(x,y,z)
{
  d = y*y - 4*x*z;
  if(d>=0)
  {
    r1 = ((-y - sqrt(d))/2*x)
    r2 = ((-y + sqrt(d))/2*x)
    print(r1)
    print(r2)
  }
  else
  {
    print("Complex Roots")
  }
}