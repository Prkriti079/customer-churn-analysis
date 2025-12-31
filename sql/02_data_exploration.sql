-- Gender distribution
SELECT 
    Gender,
    COUNT(*) AS TotalCount,
    COUNT(*) * 1.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY Gender;

-- Contract distribution
SELECT 
    Contract,
    COUNT(*) AS TotalCount,
    COUNT(*) * 1.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY Contract;

-- Customer status revenue contribution
SELECT 
    Customer_Status,
    COUNT(*) AS TotalCount,
    SUM(Total_Revenue) AS TotalRevenue,
    SUM(Total_Revenue) * 100.0 / (SELECT SUM(Total_Revenue) FROM stg_Churn) AS RevenuePercentage
FROM stg_Churn
GROUP BY Customer_Status;

-- Top states by churn percentage
SELECT 
    State,
    COUNT(*) AS TotalCount,
    COUNT(*) * 1.0 / (SELECT COUNT(*) FROM stg_Churn) AS Percentage
FROM stg_Churn
GROUP BY State
ORDER BY Percentage DESC;
