SELECT * FROM cars.cars_dataset_2025_cleaned;

-- Cars count by company
SELECT company_names, COUNT(*) AS total_cars
FROM cars_dataset_2025_cleaned
GROUP BY company_names;

-- Top 10 most expensive cars
SELECT cars_names, company_names, cars_prices
FROM cars_dataset_2025_cleaned
ORDER BY cars_prices DESC
LIMIT 10;

-- Top 10 fastest cars 
SELECT cars_names, company_names, total_speed
FROM cars_dataset_2025_cleaned
ORDER BY total_speed DESC
LIMIT 10;

-- Top 10 quickest accelerating cars 
SELECT cars_names, company_names, performance
FROM cars_dataset_2025_cleaned
ORDER BY performance ASC
LIMIT 10;

-- Cars with horsepower above avg
SELECT company_names, AVG(horsepower) AS avg_horsepower
FROM cars_dataset_2025_cleaned
GROUP BY company_names;

-- Average car price by fuel type
SELECT fuel_types, AVG(cars_prices) AS avg_price
FROM cars_dataset_2025_cleaned
GROUP BY fuel_types;

-- Cars with 5 or more seats
SELECT cars_names, company_names, seats
FROM cars_dataset_2025_cleaned
WHERE seats >= 5;

-- Torque vs horsepower relation
SELECT cars_names, company_names, horsepower, torque
FROM cars_dataset_2025_cleaned
ORDER BY horsepower DESC;

