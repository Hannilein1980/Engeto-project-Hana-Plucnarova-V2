SELECT 
`DATE`, 
food_code,
food_category_name, 
ROUND(AVG(food_value),2) AS Average_food_price,
ROUND(LAG(AVG(food_value)) OVER (PARTITION BY food_code ORDER BY `DATE`),2) AS Previous_average_food_price,
ROUND((AVG(food_value) - LAG(AVG(food_value)) OVER (PARTITION BY food_code ORDER BY `DATE`))/LAG(AVG(food_value)) OVER (PARTITION BY food_code ORDER BY `DATE`) * 100,2) AS Yearly_growth_food_price
FROM t_projekt_sql_hana_final tpshf 
WHERE `DATE`  >= '2006' AND `DATE` <= '2018'
GROUP BY `DATE`, food_code
ORDER BY `DATE` ASC, ROUND((AVG(food_value) - LAG(AVG(food_value)) OVER (PARTITION BY food_code ORDER BY `DATE`))/LAG(AVG(food_value)) OVER (PARTITION BY food_code ORDER BY `DATE`) * 100,2) 
;

