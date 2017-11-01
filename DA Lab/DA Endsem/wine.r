library(corrplot)
library(readxl)

wine_data = read_xlsx("Wine_data.xlsx")
wine_data = as.data.frame(wine_data)

correlation = cor(wine_data)
corrplot(correlation)

total_obs = nrow(wine_data[wine_data$quality == max(wine_data$quality),])
print(total_obs)

sugar = round(wine_data$`residual sugar`)
print(length(unique(sugar)))

print(apply(wine_data,2,mean)["pH"])