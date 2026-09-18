df <- read.csv("data/ecommerce_sales_transactions_34k.csv", stringsAsFactors = FALSE)
df$returned_num <- ifelse(df$returned == "Yes", 1, 0)
df$category <- as.factor(df$category)
df$region <- as.factor(df$region)
df$payment_method <- as.factor(df$payment_method)

logit_model <- glm(
  returned_num ~ delivery_time_days + shipping_cost + discount + customer_age + price + category + region + payment_method,
  data = df,
  family = binomial(link = "logit")
)

summary(logit_model)

# odds ratios
or_results <- exp(cbind(OR = coef(logit_model), confint.default(logit_model)))
round(or_results, 3)

# bondad de ajuste
cat("Null Deviance:", logit_model$null.deviance, "\n")
cat("Residual Deviance:", logit_model$deviance, "\n")
cat("AIC:", AIC(logit_model), "\n")

pseudo_r2 <- 1 - (logit_model$deviance / logit_model$null.deviance)
cat("McFadden Pseudo R2:", round(pseudo_r2, 4), "\n")

# prediccion
predicted_probs <- predict(logit_model, type = "response")
threshold <- mean(df$returned_num)
predicted_class <- ifelse(predicted_probs >= threshold, 1, 0)

conf_matrix <- table(Real = df$returned_num, Predicho = predicted_class)
print(conf_matrix)
