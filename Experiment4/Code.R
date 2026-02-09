# Sanjay S - 23BAD096
library(ggplot2)
library(dplyr)

accidents <- read.csv("C:\\Users\\student\\Downloads\\4.traffic_accidents.csv")

accidents$Severity_Num <- as.numeric(factor(accidents$Severity,
levels = c("Minor","Major","Fatal")))

ggplot(accidents,
aes(x = Location,
y = Severity_Num,
color = Severity_Num)) +
geom_jitter(size = 3, alpha = 0.8) +
scale_color_gradient(low = "yellow", high = "red") +
labs(title = "Encoding Accident Severity Using Color\nSanjay S (23BAD096)",
x = "Location",
y = "Severity Level",
color = "Severity") +
theme_minimal()

accident_freq <- accidents %>%
count(Location, name = "Frequency")

ggplot(accident_freq,
aes(x = Location,
y = Frequency,
size = Frequency)) +
geom_point(color = "blue", alpha = 0.7) +
scale_size(range = c(3, 10)) +
labs(title = "Accident Frequency Represented Using Size\nSanjay S (23BAD096)",
x = "Location",
y = "Number of Accidents",
size = "Accident Frequency") +
theme_minimal() +
theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(accidents,
aes(x = Location,
y = Severity_Num,
shape = Accident_Type)) +
geom_point(size = 3, color = "black") +
labs(title = "Accident Type Represented Using Shape\nSanjay S (23BAD096)",
x = "Location",
y = "Severity Level",
shape = "Accident Type") +
theme_minimal() +
theme(axis.text.x = element_text(angle = 45, hjust = 1))
