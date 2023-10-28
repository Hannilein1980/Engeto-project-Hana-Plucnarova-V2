SELECT 
tpshf.`DATE`,
ROUND(AVG(thppssf.GDP)),
ROUND(AVG(tpshf.value_payroll)) AS Average_payroll,
ROUND(LAG(AVG(tpshf.value_payroll)) OVER (PARTITION BY tpshf.value_type_code ORDER BY payroll_year)) AS Previous_average_payroll,
ROUND((AVG(value_payroll) - LAG(AVG(value_payroll)) OVER (PARTITION BY value_type_code ORDER BY payroll_year))/LAG(AVG(value_payroll)) OVER (PARTITION BY value_type_code ORDER BY payroll_year) * 100,2) AS Yearly_growth_percentage,
ROUND(AVG(tpshf.food_value),2) AS Average_food_price, 
ROUND(LAG(AVG(tpshf.food_value)) OVER (ORDER BY `DATE`),2) AS Previous_average_food_price,
ROUND((AVG(food_value) - LAG(AVG(food_value)) OVER (ORDER BY `DATE`))/LAG(AVG(food_value)) OVER (ORDER BY `DATE`) * 100,2) AS Yearly_growth_food_price,
tpshf.value_type_code,  
tpshf.payroll_year,
thppssf.state,
thppssf.`YEAR` 
FROM t_projekt_sql_hana_final tpshf
JOIN t_hana_plucnarova_project_sql_secondary_final thppssf 
	ON tpshf.payroll_year = thppssf.`YEAR` 
WHERE tpshf.value_type_code = '5958'
AND thppssf.country = 'Czech Republic'
GROUP BY tpshf.payroll_year, thppssf.`YEAR` 
ORDER BY tpshf.payroll_year 
; 