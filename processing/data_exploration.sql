-- DATA EXPLORATION
SELECT COUNT(*) AS total_rows
FROM cars_dataset_2025_cleaned;

SELECT *
FROM cars_dataset_2025_cleaned
LIMIT 10;

-- Check Null Values
SELECT *
FROM cars_dataset_2025_cleaned
WHERE company_names IS NULL
   OR cars_names IS NULL
   OR `engines` IS NULL
   OR battery_capacity IS NULL
   OR horsepower IS NULL
   OR total_speed IS NULL
   OR performance IS NULL
   OR cars_prices IS NULL
   OR fuel_types IS NULL
   OR seats IS NULL
   OR torque IS NULL;
   
-- Distinct companies
SELECT DISTINCT company_names
FROM cars_dataset_2025_cleaned
ORDER BY company_names;

-- Distinct fuel types
SELECT DISTINCT fuel_types
FROM cars_dataset_2025_cleaned
ORDER BY fuel_types;

-- Count cars by company 
SELECT company_names, COUNT(*) AS total_cars
FROM cars_dataset_2025_cleaned
GROUP BY company_names
ORDER BY total_cars DESC;

-- Duplicate car names
SELECT cars_names, COUNT(*) AS num_records
FROM cars_dataset_2025_cleaned
GROUP BY cars_names
HAVING COUNT(*) > 1
ORDER BY num_records DESC;

-- Min & Max Values in num cols
SELECT 
    MIN(battery_capacity) AS min_capacity,
    MAX(battery_capacity) AS max_capacity,
    MIN(horsepower) AS min_hp,
    MAX(horsepower) AS max_hp,
    MIN(total_speed) AS min_speed,
    MAX(total_speed) AS max_speed,
    MIN(performance) AS min_accel,
    MAX(performance) AS max_accel,
    MIN(cars_prices) AS min_price,
    MAX(cars_prices) AS max_price,
    MIN(torque) AS min_torque,
    MAX(torque) AS max_torque
FROM cars_dataset_2025_cleaned;
