-- Financial Impact of Customer Churn

--  Balance Associated with Churn
SELECT
    ROUND(SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END), 2)
        AS churned_customer_balance,
    ROUND(SUM(CASE WHEN Exited = 0 THEN Balance ELSE 0 END), 2)
        AS retained_customer_balance,
    ROUND(SUM(Balance), 2)
        AS total_customer_balance,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END)* 100.0 / NULLIF(SUM(Balance), 0),2) 
        AS churned_balance_percentage
FROM customers;

-- Average Balance: Churned vs Retained
SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,
    COUNT(*) AS total_customers,
    ROUND(AVG(Balance), 2) AS average_balance,
    ROUND(SUM(Balance), 2) AS total_balance
FROM customers
GROUP BY Exited;

-- Financial Impact of Churn by Geography
SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END),2) AS churned_customer_balance,
    ROUND(SUM(Balance),2) AS total_balance,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END)* 100.0 / NULLIF(SUM(Balance), 0),2) 
        AS churned_balance_percentage
FROM customers
GROUP BY Geography
ORDER BY churned_customer_balance DESC;

-- High-Balance Customers Who Churned
WITH balance_segments AS (
    SELECT
        CustomerId,
        Geography,
        Age,
        Balance,
        Exited,
        NTILE(4) OVER (ORDER BY Balance) AS balance_quartile
    FROM customers
)
SELECT
    CASE
        WHEN balance_quartile = 1 THEN 'Low Balance'
        WHEN balance_quartile = 2 THEN 'Medium Balance'
        WHEN balance_quartile = 3 THEN 'High Balance'
        ELSE 'Very High Balance'
    END AS balance_segment,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) 
    AS churn_rate,
    ROUND(SUM(CASE WHEN Exited = 1 THEN Balance ELSE 0 END),2) 
    AS churned_customer_balance
FROM balance_segments
GROUP BY balance_quartile
ORDER BY balance_quartile;

