#q1a
datas <- read.csv("Online Retail.csv")
online <- data.frame(datas)
attach(online)

#q1b
print("Items purchased by UK customers")
ukcustomers = sum(Quantity[which(Country=="United Kingdom")])
print(ukcustomers)

#q1c
print("total amount spent by customer 13744")
customer13744 = sum((UnitPrice*Quantity)[which(CustomerID==13744 & as.Date(InvoiceDate)=="20-02-11")])
print(customer13744)

#q1d
#infrance = which(Quantity==max(Quantity[which(Country=="France")]))
#print(infrance)
francedata = online[which(Country=="France"),c(1:8)]
francedf = data.frame(francedata)
#aggregate is like 'group by', so StockCode is used for grouping and sum is done of Quantity
newtable = aggregate(francedf$Quantity,by=list(Category=francedf$StockCode), FUN=sum)
index = which.max(newtable[,2])
print("Item having maximum sale in France")
print(newtable[index,])

#q1d - alternative method
df3<-subset(df,Country=="France", select=c(InvoiceNo, StockCode, Quantity))
k<-unique(df3$StockCode)
max<-0
curmax<-0
curstock<-"a"
for(i in 1:length(k)){
  curmax<-sum(df3$Quantity[which(df3$StockCode==k[i])])
  if(curmax>max){
    max=curmax
    curstock<-k[i]
  }
}
print("max is")
curstock

#q1e
library(lubridate)
df$InvoiceDate<-as.POSIXct(df$InvoiceDate)
df4<-subset(df,month(df$InvoiceDate)>3)
df5<-subset(df4,month(df4$InvoiceDate)<=6)

k<-unique(df5$StockCode)
curmax<-c()
for(i in 1:length(k)){
  b<-sum(df5$Quantity[which(df5$StockCode==k[i])])
  curmax[i]<-b
}
curmax<-sort(curmax)
tail(curmax)
