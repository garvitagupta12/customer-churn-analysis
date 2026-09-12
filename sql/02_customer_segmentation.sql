-- Identifying High-Risk Customer Segments

-- Age group + Activity
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '66+'
    END AS age_group,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY
    age_group,
    customer_status
ORDER BY churn_rate DESC;

-- Geography + Activity
SELECT
    Geography,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY
    Geography,
    IsActiveMember
ORDER BY
    churn_rate DESC;
    
-- Geography + Activity + Age
SELECT
    Geography,
    CASE
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '66+'
    END AS age_group,
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS customer_status,
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(SUM(Exited) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY
    Geography,
    age_group,
    IsActiveMember
HAVING COUNT(*) >= 30
ORDER BY
    churn_rate DESC;
    
