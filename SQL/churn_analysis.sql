
-- =========================================
-- 1. TOTAL CUSTOMER CHURN
-- =========================================

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*),2) AS churn_rate
FROM telco_churn;


-- =========================================
-- 2. CHURN RATE BY CONTRACT TYPE
-- =========================================

SELECT 
    Contract,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;


-- =========================================
-- 2. CHURN RATE BY TENURE GROUP
-- =========================================


SELECT 
    CASE 
        WHEN tenure < 12 THEN '0-1 year'
        WHEN tenure < 24 THEN '1-2 years'
        ELSE '2+ years'
    END AS tenure_group,
    COUNT(*) AS total,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- =========================================
-- 4. CHURN BY INTERNET SERVICE AND CONTRACT 
-- =========================================

SELECT 
    InternetService,
    Contract,
    COUNT(*) AS total,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0 / COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY InternetService, Contract
ORDER BY churn_rate DESC; 

