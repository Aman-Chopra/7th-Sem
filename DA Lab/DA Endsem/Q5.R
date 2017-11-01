library(readxl)

data <- read_excel("tvprices.xls")

model <- lm(Price ~ Screen + DCR + RspTm + LCDHz + PIP + NatRes + HDMI, data = data)
summary(model)
t = c(40,100,4,120,1,720,4)
names(t) = c("Screen","DCR","RspTm","LCDHz","PIP","NatRes","HDMI")
nd = data.frame(t)
nd = data.frame(t(nd))
y = predict(model,newdata = nd)
print(y)
plot(model)