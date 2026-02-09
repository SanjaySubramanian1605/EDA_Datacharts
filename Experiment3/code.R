# Name: Sanjay S
# Roll No: 23BAD096

data <- read.csv("C:\\Users\\student\\Downloads\\3.healthcare_data (1).csv")

numeric_data <- data[,c("Age","BMI","Blood_Pressure","Glucose_Level","Cholesterol")]

pairs(numeric_data,
      main = "Scatter Plot Matrix\nSanjay S (23BAD096)")


data$AgeGroup <- cut(data$Age,
                     breaks = c(20,35,50,65,80),
                     labels = c("Young","Adult","Middle","Senior"))

colors <- as.numeric(data$AgeGroup)

pairs(numeric_data,
      col = colors,
      pch = 19,
      main = "Scatter Plot Matrix with Age Groups\nSanjay S (23BAD096)")

legend("topright",
       legend = levels(data$AgeGroup),
       col = 1:length(levels(data$AgeGroup)),
       pch = 19,
       title = "Age Groups")
