print("Name: SANJAY S | Roll No: 23BAD096")
library(ggplot2)
library(GGally)
library(dplyr)

df <- read.csv("C:\\Users\\Sanjay\\Downloads\\6.retail_business.csv")

colnames(df) <- c(
  "Order_ID", "Region", "Product_Category",
  "Sales", "Profit", "Discount", "Customer_Segment"
)

ggparcoord(
  data = df,
  columns = c(4, 5, 6),  # Sales, Profit, Discount
  groupColumn = "Customer_Segment",
  scale = "uniminmax",
  alphaLines = 0.6
) +
  labs(
    title = "Parallel Coordinates Plot",
    subtitle = "Sales, Profit and Discount by Customer Segment"
  ) +
  theme_minimal()

ggplot(df, aes(x = Sales, y = Profit, size = Discount, color = Region)) +
  geom_point(alpha = 0.9) +
  scale_size(range = c(3, 10)) +
  labs(
    title = "Bubble Chart: Sales vs Profit",
    subtitle = "Bubble Size Represents Discount",
    x = "Sales",
    y = "Profit"
  ) +
  theme_minimal()

ggplot(df, aes(x = Sales, y = Profit, color = Customer_Segment)) +
  geom_point(size = 2) +
  facet_wrap(~ Region) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Trellis Display: Sales vs Profit by Region",
    x = "Sales",
    y = "Profit"
  ) +
  theme_bw()
