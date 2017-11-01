#library(readxl)

#data = read_excel("OnlineRetail.xlsx")
data = as.data.frame(read.csv("OnlineRetail.csv"))

uk = data[data$Country == "United Kingdom",]
print(sum(uk$Quantity))

customer = data[data$CustomerID == 13744 & grepl("20/02/11",data$InvoiceDate),]
print(sum(customer$UnitPrice*customer$Quantity))

france = data[data$Country == "France",]
ag = aggregate(france$Quantity*france$UnitPrice,by = list(france$Description),FUN="sum")
print(france[which.max(ag$x),]$Description)

t = data[grepl("[0-3][0-9]/0[4-6]/11",data$InvoiceDate),]
ag = aggregate(t$Quantity*t$UnitPrice,by=list(t$Description),FUN="sum")
print(t[order(ag$x,decreasing = T)[1:5],]$Description)