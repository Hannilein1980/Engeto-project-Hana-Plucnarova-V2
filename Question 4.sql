SELECT 
value_type_code,  
payroll_year,
ROUND(AVG(value_payroll)) AS Average_payroll,
ROUND(LAG(AVG(value_payroll)) OVER (PARTITION BY value_type_code ORDER BY payroll_year)) AS Previous_average_payroll,
ROUND((AVG(value_payroll) - LAG(AVG(value_payroll)) OVER (PARTITION BY value_type_code ORDER BY payroll_year))/LAG(AVG(value_payroll)) OVER (PARTITION BY value_type_code ORDER BY payroll_year) * 100,2) AS Yearly_growth_percentage,
`DATE`,  
ROUND(AVG(food_value),2) AS Average_food_price,
ROUND(LAG(AVG(food_value)) OVER (ORDER BY `DATE`),2) AS Previous_average_food_price,
ROUND((AVG(food_value) - LAG(AVG(food_value)) OVER (ORDER BY `DATE`))/LAG(AVG(food_value)) OVER (ORDER BY `DATE`) * 100,2) AS Yearly_growth_food_price
FROM t_projekt_sql_hana_final tpshf 
WHERE value_type_code = '5958'
GROUP BY payroll_year, `DATE` 
ORDER BY payroll_year, `DATE`  
;