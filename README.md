# Customer Churn & Retention Analytics

An end-to-end data analytics project focused on understanding customer churn, identifying high-risk customer segments, and generating actionable retention insights.

The project combines **Python, SQL (MySQL), and Tableau** to analyze customer behavior and present findings through an interactive dashboard.

---

## 📌 Project Overview

Customer churn is an important business problem because losing customers can impact revenue, customer lifetime value, and long-term growth.

This project analyzes customer-level data to answer questions such as:

- What percentage of customers are churning?
- Which age groups have the highest churn?
- Does customer activity relate to churn?
- Which countries have higher churn rates?
- How does churn vary by gender?
- Does the number of products relate to customer churn?
- How does churn vary across balance segments?
- Which customer segments should be prioritized for retention?

The analysis focuses on identifying **patterns and associations**, rather than claiming that any individual factor directly causes churn.

---

## 🛠️ Tools & Technologies

- **Python**
  - Pandas
  - NumPy

- **SQL**
  - MySQL
  - MySQL Workbench

- **Tableau**
  - Data visualization
  - Interactive dashboard

- **Git & GitHub**

---

## 📂 Project Structure

- `data/` — Dataset
- `notebooks/` — Python EDA notebook
- `sql/` — MySQL analysis queries
- `tableau/` — Tableau dashboard
- `images/` — Dashboard screenshots
- `README.md` — Project documentation

### SQL Files

- `01_churn_analysis.sql`
- `02_customer_segmentation.sql`
- `03_financial_impact.sql`

---

## 📊 Dataset

The dataset contains **10,000 customer records** and **14 attributes**.

### Key Features

| Feature | Description |
|---|---|
| `CustomerId` | Unique customer identifier |
| `CreditScore` | Customer credit score |
| `Geography` | Customer's country |
| `Gender` | Customer gender |
| `Age` | Customer age |
| `Tenure` | Years with the bank |
| `Balance` | Customer account balance |
| `NumOfProducts` | Number of bank products used |
| `HasCrCard` | Whether the customer has a credit card |
| `IsActiveMember` | Whether the customer is an active member |
| `EstimatedSalary` | Estimated customer salary |
| `Exited` | Churn indicator |

### Target Variable

`Exited`

- `0` → Customer stayed
- `1` → Customer churned

---

## 🔍 Analysis Workflow

### 1. Data Validation & Cleaning

The dataset was inspected for:

- Missing values
- Duplicate records
- Data types
- Dataset dimensions
- Unique customers
- Numerical distributions
- Categorical values

### Data Quality

- **Rows:** 10,000
- **Columns:** 14
- **Missing values:** None
- **Duplicate rows:** None
- **Unique customers:** 10,000

### 2. Exploratory Data Analysis

Python was used to explore relationships between customer characteristics and churn.

The analysis included:

- Overall churn distribution
- Churn by geography
- Churn by age group
- Churn by gender
- Churn by customer activity
- Churn by credit-card ownership
- Churn by tenure
- Churn by credit-score group
- Churn by balance segment

---

## 📈 Key Findings

### Overall Churn

Out of 10,000 customers:

- **7,963 customers stayed**
- **2,037 customers churned**
- **Overall churn rate: 20.37%**

### Age

Age showed one of the strongest differences in observed churn rates.

| Age Group | Churn Rate |
|---|---:|
| 46–55 | **50.57%** |
| 56–65 | **48.32%** |
| 36–45 | **19.62%** |

Younger customers showed substantially lower observed churn rates.

### Customer Activity

Inactive customers had a considerably higher observed churn rate:

- **Inactive:** 26.85%
- **Active:** 14.27%

This represents a difference of approximately **12.58 percentage points**.

### Geography

Germany had the highest observed churn rate:

- **Germany:** 32.44%
- **Spain:** 16.67%
- **France:** 16.15%

Germany's observed churn rate was approximately twice that of France and Spain.

### Gender

Observed churn also differed by gender:

- **Female:** 25.07%
- **Male:** 16.46%

This represents a difference of approximately **8.62 percentage points**.

### Credit Score

Credit score showed a relatively weak standalone relationship with churn.

Churn rates across credit-score groups remained relatively close.

### Tenure

Tenure did not show a clear increasing or decreasing churn trend.

Observed churn rates fluctuated across different tenure levels.

### Credit Card Ownership

Credit-card ownership showed minimal difference in churn:

- **No credit card:** 20.81%
- **Has credit card:** 20.18%

The difference is approximately **0.63 percentage points**.

---

## 🎯 Customer Segmentation

The project goes beyond single-variable analysis by combining multiple customer characteristics.

Examples include:

- Age + Activity
- Geography + Activity
- Geography + Age + Activity
- Age + Activity + Balance

### High-Risk Segment: Inactive Customers Aged 56–65

- **Customers:** 179
- **Churned:** 168
- **Observed churn rate:** 93.85%

The relatively small segment size should be considered when interpreting this result.

### High-Risk Segment: Inactive Customers Aged 46–55

- **Customers:** 665
- **Churned:** 423
- **Observed churn rate:** 63.61%

These segments demonstrate how combining multiple customer attributes can provide more targeted retention insights than analyzing individual variables alone.

---

## 💰 Financial Impact Analysis

SQL was used to investigate the financial characteristics associated with customer churn.

The analysis includes:

- Balance held by churned customers
- Balance held by retained customers
- Average balance by customer status
- Churn by balance segment
- Financial impact by geography
- High-balance customers who churned

This helps connect customer churn analysis with potential business impact.

---

## 🧮 SQL Analysis

The SQL analysis is organized into five separate files.

### `01_churn_analysis.sql`

Analyzes:

- Overall churn
- Geography
- Age
- Activity
- Number of products
- Gender
- Credit-card ownership
- Tenure

### `02_customer_segmentation.sql`

Identifies high-risk combinations using:

- Age
- Activity
- Geography

### `03_financial_impact.sql`

Analyzes:

- Customer balances
- Balance segments
- Financial impact of churn
- Churned high-balance customers

---

## 📊 Tableau Dashboard

The Tableau dashboard provides a business-focused overview of customer churn and retention.

### KPI Cards

- Total Customers
- Churned Customers
- Churn Rate
- Total Balance

### Visualizations

- Churn Distribution
- Churn Rate by Number of Products
- Churn Rate by Balance Segment
- Customer Churn by Gender
- Churn Risk by Age & Activity
- Churn Rate by Geography

The dashboard is designed with an emphasis on clear visual hierarchy, business interpretation, and actionable insights.

## 👩‍💻 Author

**Garvita Gupta**

B.Tech Student | Data Analytics & AI Enthusiast

---

⭐ If you found this project useful, feel free to explore the analysis, SQL queries, and Tableau dashboard.