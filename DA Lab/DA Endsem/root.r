a = readline(prompt = "Enter the value of a ");
a = as.integer(a);
b = readline(prompt = "Enter the value of b ");
b = as.integer(b);
c = readline(prompt = "Enter the value of c ");
c = as.integer(c);
d = (b*b) - (4*a*c);
if(d<0){
  print("Complex Roots")
}else{
  r1 = (-b + sqrt(d))/(2*a);
  r2 = (-b - sqrt(d))/(2*a);
  print(r1)
  print(r2)  
}
