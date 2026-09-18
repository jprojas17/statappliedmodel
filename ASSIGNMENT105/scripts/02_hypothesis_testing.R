df <- read.csv("data/ecommerce_sales_transactions_34k.csv", stringsAsFactors = FALSE)

df$discount_tier <- cut(
  df$discount,
  breaks = c(-Inf, 0.001, 0.20, Inf),
  labels = c("No Discount (0%)", "Low-Moderate (5-20%)", "High Discount (25-40%)")
)

aggregate(quantity ~ discount_tier, data = df, function(x) c(N = length(x), Mean = mean(x), SD = sd(x)))

# anova y pruebas
bartlett.test(quantity ~ discount_tier, data = df)

anova_model <- aov(quantity ~ discount_tier, data = df)
summary(anova_model)

oneway.test(quantity ~ discount_tier, data = df, var.equal = FALSE)
kruskal.test(quantity ~ discount_tier, data = df)

# tukey
tukey_res <- TukeyHSD(anova_model)
print(tukey_res)
plot(tukey_res, las = 1, col = "darkgreen")

# chi cuadrado
tabla_contingencia <- table(df$category, df$returned)
print(tabla_contingencia)
chisq.test(tabla_contingencia)
