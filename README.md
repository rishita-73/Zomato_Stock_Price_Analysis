
# 📊 Zomato Stock Price Analysis (2021–2024)

## 🚀 Project Overview

This project presents a comprehensive analysis of Zomato’s stock performance from July 2021 to February 2024. It combines SQL, Python-based exploratory data analysis (EDA), and statistical techniques to uncover trends, volatility patterns, and investment insights.

The goal is to simulate a real-world financial data analysis pipeline — from database design to advanced analytics.

---

## 📁 Dataset Description

* **Total Records:** 631 trading days
* **Time Period:** July 2021 – February 2024
* **Features:**

  * Date
  * Open, High, Low, Close prices
  * Adjusted Close
  * Volume

---

## 🛠️ Tools & Technologies Used

* **SQL (MySQL):**

  * Database design
  * Window functions (LAG, moving averages)
  * Advanced queries (trend signals, volatility)

* **Python:**

  * pandas → data manipulation
  * matplotlib, seaborn → visualization
  * scipy → statistical testing

* **Jupyter Notebook:**

  * End-to-end analysis workflow

---

## 📊 Key Analysis Performed

### 🔹 1. SQL Analysis

* Created normalized database structure
* Calculated:

  * Daily returns
  * Log returns
  * Moving averages (SMA 7, 30, 90)
  * Rolling volatility
* Identified:

  * Highest volume trading day
  * Biggest gain/loss days
  * Monthly performance trends

---

### 🔹 2. Trend Analysis

* Detected:

  * **Golden Cross (Bullish Signal)**
  * **Death Cross (Bearish Signal)**
* Identified major phases:

  * 📉 Bearish phase: 2021–2022
  * 📈 Recovery phase: 2023–2024

---

### 🔹 3. Exploratory Data Analysis (EDA)

* Price trend visualization with moving averages
* Distribution of daily returns
* Boxplot for outlier detection
* Correlation heatmap

---

### 🔹 4. Statistical Analysis

* **Jarque-Bera Test** → returns are NOT normally distributed
* Identified:

  * Fat-tailed distribution
  * Extreme outliers
  * Volatility clustering

---

### 🔹 5. Risk & Volatility Analysis

* Rolling volatility analysis showed:

  * High volatility during 2021–2022
  * Stabilization in 2023–2024

---

## 📈 Key Insights

* 📉 Significant downturn observed in early 2022 (worst month: Jan 2022)
* 📈 Strong recovery starting April 2023
* ⚠️ Returns are non-normal with heavy tails → higher financial risk
* 🔥 Volatility clustering observed (common in financial markets)
* 📊 Volume has weak correlation with price → not a reliable predictor

---

## 📂 Project Structure

```
zomato-stock-analysis/
│
├── data/
│   └── zomato.csv
│
├── notebooks/
│   ├──zomato_stock_price_analysis.ipynb
│  
├── sql/
│   ├── zomato_stock_price_analysis.sql
│   
├── requirements.txt
└── README.md
```

---

## ▶️ How to Run This Project

1. Clone the repository
2. Install dependencies:

   ```
   pip install -r requirements.txt
   ```
3. Set up MySQL database and import data
4. Run Jupyter notebooks step-by-step

---

## 💼 Skills Demonstrated

* SQL (window functions, joins, analytics)
* Data cleaning & transformation
* Exploratory Data Analysis (EDA)
* Statistical hypothesis testing
* Financial data analysis
* Data visualization

---

## 🔮 Future Enhancements

* Build predictive models (LSTM, ARIMA)
* Deploy dashboard using Power BI or Streamlit
* Add real-time stock data integration

---

## 📌 Conclusion

This project demonstrates a complete data analysis pipeline applied to financial data. It highlights how combining SQL, Python, and statistical techniques can uncover meaningful insights about market behavior, risk, and trends.

---

## 👤 Author

**Rishita Mukherjee**

---

⭐ If you found this project useful, consider giving it a star!
