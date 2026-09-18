df <- read.csv("data/ecommerce_sales_transactions_34k.csv", stringsAsFactors = FALSE)
df$category <- as.factor(df$category)
df$region <- as.factor(df$region)

# modelos
m1 <- lm(
  total_amount ~ price + discount + quantity + shipping_cost + delivery_time_days + customer_age + category + region,
  data = df
)
summary(m1)
confint(m1)

m2 <- lm(
  log(total_amount) ~ log(price) + discount + log(quantity) + shipping_cost + delivery_time_days + customer_age + category + region,
  data = df
)
summary(m2)

AIC(m1, m2)
BIC(m1, m2)

# supuestos
par(mfrow = c(2, 2), mar = c(3, 3, 2, 1))
plot(m1)
par(mfrow = c(1, 1))

num_vars <- c("price", "discount", "quantity", "shipping_cost", "delivery_time_days", "customer_age")
round(cor(df[num_vars]), 2)

set.seed(42)
residuos_sample <- sample(residuals(m1), 5000)
shapiro.test(residuos_sample)
