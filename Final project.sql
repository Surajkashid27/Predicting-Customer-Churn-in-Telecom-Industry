#Identify the contract types that are most prone to churn
SELECT 
    Contract, 
    COUNT(*) AS churn_count,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_churn WHERE Contract = c.Contract) AS churn_rate_percentage
FROM 
    customer_churn c
WHERE 
    `Customer Status` = 'Churned'
GROUP BY 
    Contract
ORDER BY 
    churn_rate_percentage DESC;
    
#Find the average age of churned customers
SELECT 
    AVG(Age) AS average_age_churned
FROM 
    customer_churn
WHERE 
    `Customer Status` = 'Churned';
    
#Identify the total number of customers and the churn rate
    SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN `Customer Status` = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS churn_rate_percentage
FROM 
    customer_churn;
    
#Identify customers with high total charges who have churned
SELECT 
    `Customer ID`, 
    `Total Charges`
FROM 
    customer_churn
WHERE 
    `Customer Status` = 'Churned'
ORDER BY 
    `Total Charges` DESC
LIMIT 10;

#Calculate the total charges distribution for churned and non-churned customers
SELECT 
    `Customer Status`, 
    SUM(`Total Charges`) AS total_charges
FROM 
    customer_churn
GROUP BY 
    `Customer Status`;


#Determine the most common combinations of services among churned customers
SELECT 
    `Online Security`, 
    `Online Backup`, 
    `Device Protection Plan`, 
    `Premium Tech Support`, 
    `Streaming TV`, 
    `Streaming Movies`,
    `Streaming Music`, 
    COUNT(*) AS count
FROM 
    customer_churn
WHERE 
    `Customer Status` = 'Stayed'
GROUP BY 
    `Online Security`, 
    `Online Backup`, 
    `Device Protection Plan`, 
    `Premium Tech Support`, 
    `Streaming TV`, 
    `Streaming Movies`,
    `Streaming Music`
ORDER BY 
    count DESC;


