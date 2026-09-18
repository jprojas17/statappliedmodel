df <- read.csv("data/ecommerce_sales_transactions_34k.csv", stringsAsFactors = FALSE)

dim(df)
head(df)
str(df)

# resumen estadistico
num_cols <- c("price", "discount", "quantity", "total_amount", "shipping_cost", "customer_age", "delivery_time_days")
summary(df[num_cols])
sapply(df[num_cols], sd)

# por categoria
aggregate(cbind(quantity, price, total_amount) ~ category, data = df, FUN = mean)
round(prop.table(table(df$category, df$returned), 1) * 100, 2)

# graficos
par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
hist(df$quantity, main = "Units Ordered", xlab = "Quantity", col = "skyblue", breaks = 15)
hist(df$total_amount, main = "Total Amount ($)", xlab = "Total ($)", col = "lightgreen", breaks = 20)
hist(df$discount, main = "Discount Rate", xlab = "Discount", col = "salmon", breaks = 10)
hist(df$customer_age, main = "Customer Age", xlab = "Age", col = "plum", breaks = 15)
par(mfrow = c(1, 1))

boxplot(quantity ~ category, data = df, main = "Units by Category", las = 2, col = "lightblue")
boxplot(total_amount ~ category, data = df, main = "Total by Category", las = 2, col = "lightgreen")

cor_matrix <- cor(df[num_cols])
round(cor_matrix, 2)
