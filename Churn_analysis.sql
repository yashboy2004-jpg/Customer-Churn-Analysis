Use Customer;
RENAME TABLE `telco-customer-churn` TO churn_data;
SELECT * FROM Churn_data LIMIT 5;
SELECT COUNT(*) AS total_customers
FROM churn data;
SELECT COUNT(*) AS churned_customers
FROM churn_data
WHERE Churn = 'Yes';
SELECT 
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data;
SELECT 
    Contract,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY Contract
ORDER BY churn_rate DESC;
SELECT 
    PaymentMethod,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned
FROM churn_data
GROUP BY PaymentMethod
ORDER BY churned DESC;
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charges
FROM churn_data
GROUP BY Churn;
SELECT 
    CASE 
        WHEN tenure < 12 THEN '0-1 Year'
        WHEN tenure BETWEEN 12 AND 24 THEN '1-2 Years'
        ELSE '2+ Years'
    END AS tenure_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned
FROM churn_data
GROUP BY tenure_group;
SELECT 
    InternetService,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned
FROM churn_data
GROUP BY InternetService;
SELECT 
    customerID,
    tenure,
    MonthlyCharges,
    Contract
FROM churn_data
WHERE MonthlyCharges > 80
AND tenure < 12
AND Churn='Yes';
SELECT 
    SeniorCitizen,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned
FROM churn_data
GROUP BY SeniorCitizen;
SELECT 
AVG(CAST(TotalCharges AS FLOAT)) AS avg_total
FROM churn_data
WHERE TotalCharges <> '';
