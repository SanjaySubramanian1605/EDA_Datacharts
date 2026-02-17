install.packages("ggplot2")
print("Student Name: Sanjay S")
print("Student Roll no: 23BAD096")
library(ggplot2)

# Load the dataset
data <- read.csv("C:\\Users\\Sanjay\\Downloads\\7.social_media_interactions.csv")

# View first few rows
head(data)

# -------------------------------
# 1. Normal Scatter Plot (Over-plotting)
# -------------------------------
ggplot(data, aes(x = Likes, y = Comments)) +
  geom_point() +
  ggtitle("Normal Scatter Plot Showing Over-plotting")

# -------------------------------
# 2. Alpha Blending Technique
# -------------------------------
ggplot(data, aes(x = Likes, y = Comments)) +
  geom_point(alpha = 0.3) +
  ggtitle("Alpha Blending to Reduce Over-plotting")

# -------------------------------
# 3. Jittering Technique
# -------------------------------
ggplot(data, aes(x = Likes, y = Comments)) +
  geom_jitter(width = 50, height = 20, alpha = 0.5) +
  ggtitle("Jittering Technique to Reduce Over-plotting")

# -------------------------------
# 4. Aggregation Technique (Base R)
# -------------------------------
avg_likes <- aggregate(Likes ~ Platform, data, mean)
avg_comments <- aggregate(Comments ~ Platform, data, mean)

agg_data <- merge(avg_likes, avg_comments, by = "Platform")

ggplot(agg_data, aes(x = Likes, y = Comments, color = Platform)) +
  geom_point(size = 4) +
  ggtitle("Aggregated Engagement by Platform")

# -------------------------------
# 5. Binning Technique (2D Density Plot)
# -------------------------------
ggplot(data, aes(x = Likes, y = Comments)) +
  geom_bin2d() +
  ggtitle("Binning Technique for Over-plotting Reduction")
