# 🛒 Instacart Customer Behavior Analysis

## 📊 Overview

End-to-end data analytics project analyzing customer purchasing behavior using the Instacart dataset. The project focuses on uncovering product demand patterns, customer ordering trends, and repeat purchase behavior using SQL and Python.

---

## 🎯 Business Objective

To identify key drivers of customer purchasing behavior and provide insights into:

* Product demand trends
* Customer ordering patterns
* Reorder behavior and customer loyalty

---

## 🧰 Tech Stack

* **SQL (PostgreSQL)** — Data querying & analysis
* **Python (Pandas)** — Data cleaning & feature engineering
* **Matplotlib & Seaborn** — Data visualization
* **Jupyter Notebook** — Analysis workflow

---

## ⚙️ Workflow

### 1. Data Preparation

* Loaded raw CSV datasets
* Performed data cleaning (removed irrelevant columns, duplicates)
* Validated dataset structure

### 2. Feature Engineering

* **Basket Size** → Number of items per order
* **Day Type** → Weekday vs Weekend classification

### 3. Database Integration

* Imported cleaned data into PostgreSQL
* Designed relational schema

### 4. SQL Analysis

* Data overview queries
* KPI calculations (basket size, reorder rate, etc.)
* Behavioral analysis

### 5. Visualization

* Product demand analysis
* Department performance
* Order timing trends
* Customer behavior comparison

---

## 📈 Key Insights

* High demand observed in fresh produce and essential grocery items
* Customer activity peaks during daytime hours
* Distinct behavioral patterns between weekdays and weekends
* Certain departments show significantly higher reorder rates, indicating strong customer retention

---

## 📊 Key Visualizations

* Top 10 Most Ordered Products
* Top Departments by Orders
* Orders by Hour of Day
* Weekend vs Weekday Analysis
* Reorder Rate by Department

---

## 📂 Project Structure

```
instacart-customer-analysis/
│
├── instacart_analysis.ipynb   # Full analysis & visualizations
├── instacart_analysis.sql     # SQL queries
├── README.md
```

---

## 🚀 Highlights

* End-to-end data analysis pipeline
* Combination of SQL + Python workflow
* Business-focused insights
* Clean and structured project design

---
