SELECT *
FROM t_projekt_sql_hana_final tpshf 
;


SELECT 
value_type_code,
industry_branch_code, 
industry_branch_name, 
payroll_year,
AVG(value_payroll) AS Average_payroll,
LAG(AVG(value_payroll)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS Previous_average_payroll,
ROUND((AVG(value_payroll) - LAG(AVG(value_payroll)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year))/LAG(AVG(value_payroll)) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) * 100,2) AS Yearly_growth_percentage
FROM t_projekt_sql_hana_final tpshf 
WHERE value_type_code = '5958'
GROUP BY payroll_year, industry_branch_code
ORDER BY payroll_year, industry_branch_code 
;
