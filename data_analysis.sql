-- DATA ANALYSIS
SELECT * FROM cars.cars_dataset_2025_cleaned;

-- Top 10 most expensive cars
SELECT cars_names, company_names, cars_prices
FROM cars_dataset_2025_cleaned
ORDER BY cars_prices DESC
LIMIT 10;

-- Top 3 most expensive cars per company
SELECT company_names, cars_names, cars_prices
FROM (
    SELECT company_names, cars_names, cars_prices,
           RANK() OVER (PARTITION BY company_names ORDER BY cars_prices DESC) AS rank_num
    FROM cars_dataset_2025_cleaned
) ranked
WHERE rank_num <= 3;

-- Top 10 fastest cars 
SELECT cars_names, company_names, total_speed
FROM cars_dataset_2025_cleaned
ORDER BY total_speed DESC
LIMIT 10;

-- Group cars into speed categories
SELECT cars_names, total_speed,
CASE 
    WHEN total_speed < 200 THEN 'Low Speed'
    WHEN total_speed BETWEEN 200 AND 300 THEN 'Medium Speed'
    ELSE 'High Speed'
END AS speed_category
FROM cars_dataset_2025_cleaned
ORDER BY total_speed DESC;

-- Top 10 quickest accelerating cars 
SELECT cars_names, company_names, performance
FROM cars_dataset_2025_cleaned
ORDER BY performance ASC
LIMIT 10;

-- Avg horsepower by company
SELECT company_names, ROUND(AVG(horsepower),2) AS avg_horsepower
FROM cars_dataset_2025_cleaned
GROUP BY company_names
ORDER BY avg_horsepower DESC;

-- Cars with horsepower above 700 hp
SELECT cars_names, company_names, horsepower
FROM cars_dataset_2025_cleaned
WHERE horsepower > 700
ORDER BY horsepower DESC;

-- Average car price by fuel type
SELECT fuel_types, AVG(cars_prices) AS avg_price
FROM cars_dataset_2025_cleaned
GROUP BY fuel_types
ORDER BY avg_price DESC;

-- Cars with 5 or more seats
SELECT cars_names, company_names, seats
FROM cars_dataset_2025_cleaned
WHERE seats >= 5
ORDER BY seats DESC;

-- Torque vs horsepower relation
SELECT cars_names, company_names, horsepower, torque
FROM cars_dataset_2025_cleaned
ORDER BY horsepower DESC;

