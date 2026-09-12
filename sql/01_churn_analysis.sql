SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(DISTINCT CustomerId) AS unique_customers
FROM customers;

SELECT 
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    AVG(Age) AS avg_age
FROM customers;

-- Overall Churn KPI
SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    COUNT(*) - SUM(Exited) AS retained_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers;

-- Churn Rate by Geography
SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Geography
ORDER BY churn_rate DESC;

-- Churn Rate by Age Group
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '66+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY age_group
ORDER BY churn_rate DESC;

-- Active vs Inactive Customers
SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY IsActiveMember
ORDER BY churn_rate DESC;

-- Churn by Number of Products
SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

-- Churn by Gender
SELECT
    Gender,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Gender
ORDER BY churn_rate DESC;

-- Churn by Credit Card Ownership
SELECT
    CASE
        WHEN HasCrCard = 1 THEN 'Has Credit Card'
        ELSE 'No Credit Card'
    END AS credit_card_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY HasCrCard
ORDER BY churn_rate DESC;

-- Churn by Tenure
SELECT
    Tenure,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2)AS churn_rate
FROM customers
GROUP BY Tenure
ORDER BY Tenure;

