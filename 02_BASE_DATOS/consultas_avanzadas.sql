-- Query 1: Total energy consumption by sector  
SELECT sector, SUM(consumption) AS total_consumption  
FROM energy_data  
GROUP BY sector;

-- Query 2: Renewable vs Non-renewable energy consumption  
SELECT energy_type, SUM(consumption) AS total_consumption  
FROM energy_data  
WHERE energy_type IN ('Renewable', 'Non-Renewable')  
GROUP BY energy_type;

-- Query 3: Monthly energy consumption trends  
SELECT DATE_TRUNC('month', date) AS month, SUM(consumption) AS total_consumption  
FROM energy_data  
GROUP BY month  
ORDER BY month;

-- Query 4: Impact of energy policies on consumption  
SELECT policy_name, SUM(consumption) AS total_consumption  
FROM energy_data  
JOIN policies ON energy_data.policy_id = policies.id  
GROUP BY policy_name;

-- Query 5: Year-over-year consumption growth rates  
SELECT EXTRACT(YEAR FROM date) AS year,  
       SUM(consumption) AS total_consumption,  
       LAG(SUM(consumption)) OVER (ORDER BY EXTRACT(YEAR FROM date)) AS previous_year_consumption,  
       (SUM(consumption) - LAG(SUM(consumption)) OVER (ORDER BY EXTRACT(YEAR FROM date))) / NULLIF(LAG(SUM(consumption)) OVER (ORDER BY EXTRACT(YEAR FROM date)), 0) * 100 AS growth_rate  
FROM energy_data  
GROUP BY year;

-- Query 6: Comparison of energy efficiency across sectors  
SELECT sector, AVG(energy_efficiency) AS avg_efficiency  
FROM sector_data  
GROUP BY sector;

-- Query 7: Forecasting future energy demand based on historical data  
SELECT date, AVG(consumption) AS avg_consumption  
FROM energy_data  
GROUP BY date  
ORDER BY date DESC  
LIMIT 12;

-- Query 8: Geographic distribution of energy consumption  
SELECT region, SUM(consumption) AS total_consumption  
FROM energy_data  
GROUP BY region;

-- Query 9: Analysis of peak consumption hours  
SELECT EXTRACT(HOUR FROM date) AS hour, SUM(consumption) AS total_consumption  
FROM energy_data  
GROUP BY hour  
ORDER BY hour;

-- Query 10: Correlation between temperature and energy consumption  
SELECT temperature, AVG(consumption) AS avg_consumption  
FROM energy_data  
GROUP BY temperature;