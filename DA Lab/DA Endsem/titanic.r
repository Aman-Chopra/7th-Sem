t = read.csv("Titanic.csv")

avg_age = t[t$PClass == "3rd",]
print(mean(avg_age$Age,na.rm = T))

print(var(t$Age,na.rm = T))

temp = t[is.na(t$Age) & t$PClass == "1st" & t$Sex == "male",]
print(nrow(temp))

temp2 = t[t$Sex == "female" & t$Survived == 1 & t$PClass == "2nd" & t$Age %in% 10:20,]
print(nrow(temp2))
print(temp2$Name)