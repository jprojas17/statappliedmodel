# Applied Statistical Modelling — E-Commerce Analysis
**Module:** B105 Applied Statistical Modelling  
**Institution:** Gisma University of Applied Sciences  

## Overview
This repository contains the complete statistical analysis for the B105 Individual Project, analyzing e-commerce transactions across 34,500 orders to investigate discount effects, product return drivers, and revenue determinants.

## Project Structure
```
ASSIGNMENT105/
├── ASSIGNMENT105.Rproj                  # RStudio Project File
├── README.md                            # Project overview
├── B105_Statistical_Modelling_Report.md # Full statistical report
├── data/
│   └── ecommerce_sales_transactions_34k.csv
├── scripts/
│   ├── 01_eda_descriptive.R             # Data exploration & summary statistics
│   ├── 02_hypothesis_testing.R          # ANOVA, Welch, Kruskal-Wallis, Tukey HSD, Chi-Square
│   ├── 03_regression_modelling.R        # OLS & Log-Log regression + diagnostics
│   ├── 04_logistic_regression.R         # Logistic regression for product returns
│   └── main_pipeline.R                  # Runner script
├── outputs/
│   ├── figures/                         # Generated plots (Figures 1 to 6)
│   └── tables/                          # Summary tables
└── screenshots/                         # Screenshots of RStudio execution
```

## How to Run
1. Clone or download this repository.
2. Open `ASSIGNMENT105.Rproj` in **RStudio**.
3. Open and run any script in `scripts/` (e.g., `01_eda_descriptive.R`) or run `scripts/main_pipeline.R` to execute all analyses sequentially.

## Requirements
- **R** (>= 4.0.0)
- **RStudio** (recommended)
- Standard base R packages (no extra external library installations required).
