CREATE TABLE t_czechia_price_plucnar_hana_one
SELECT
AVG(value),
category_code,
date_format(date_from, '%Y') AS DATE,
cpc.name
FROM czechia_price cp 
JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code
GROUP BY cp.category_code, date_format(date_from, '%Y')
;


SELECT *
FROM t_czechia_price_plucnar_hana_one tcppho 
;


CREATE TABLE t_projekt_SQL_plucnarova
SELECT
cp.value AS value_payroll,
cp.value_type_code,
cp.industry_branch_code,
cp.payroll_year,
cp.calculation_code,
tcpibp.industry_branch_name
FROM czechia_payroll cp 
JOIN czechia_payroll_calculation cpc 
	ON cp.calculation_code = cpc.code
JOIN t_czechia_payroll_value_type_plucnarova tcpvtp 
	ON cp.value_type_code = tcpvtp.payroll_value_type_code
JOIN t_czechia_payroll_industry_branch_plucnarova tcpibp 
	ON cp.industry_branch_code = tcpibp.industry_branch_code
;

SELECT *
FROM t_projekt_sql_plucnarova tpsp 
;


CREATE TABLE t_PROJEKT_SQL_HANA_FINAL
SELECT 
tpsp.value_type_code,
tpsp.value_payroll,
tpsp.industry_branch_code,
tpsp.industry_branch_name,
tpsp.payroll_year,
tcppho.food_value,
tcppho.food_code,
tcppho.food_category_name,
tcppho.`DATE`
FROM t_projekt_sql_plucnarova tpsp 
JOIN t_czechia_price_plucnarova_hana_one tcppho 
ON tpsp.payroll_year = tcppho.`DATE` 
;


SELECT *
FROM t_projekt_sql_hana_final tpshf 
;




