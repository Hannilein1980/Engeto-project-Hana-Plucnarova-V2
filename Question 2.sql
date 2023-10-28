SELECT 
value_type_code,
payroll_year,
ROUND(AVG(value_payroll)) AS Average_payroll,
food_code,
food_category_name, 
ROUND(AVG(food_value)) AS Average_food_price, 
ROUND(AVG(value_payroll)/AVG(food_value)) AS Bought_quantity_for_sallary
FROM t_projekt_sql_hana_final tpshf 
WHERE value_type_code = '5958'
and food_code IN ('114201', '111301')
AND payroll_year IN ('2006', '2018')
GROUP BY payroll_year, food_code 
;