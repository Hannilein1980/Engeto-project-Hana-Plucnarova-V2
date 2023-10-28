# Engeto-project-Hana-Plucnarova-V2
Projekt SQL Hana Plucnarová Version 2
Engeto project Hana Plucnarova V2
Zadáním projektu bylo vytvoření finální tabulky, která bude podkladem k zodpovězení výzkumných otázek týkajících se vývoje cen potravin a mezd v České republice, dostupnosti potravin na základě průměrných příjmů a vlivu HDP na vývoj cen potravin a mezd v České republice.
Finální tabulku t_projekt_sql_hana_final tpshf  vytvořila sloučením tabulek t_projekt_sql_plucnarova tpsp a t_czechia_price_plucnarova_hana_one tcppho.
Tabulka t_projekt_sql_plucnarova tpsp vznikla sloučením czechia_payroll cp czechia_payroll_calculation cpc czechia_payroll_industry_branch cpib czechia_payroll_unit cpu czechia_payroll_value_type cpv.
Tabulka t_czechia_price_plucnarova_hana_one tcppho vznikla sloučením czechia_price cp                   a czechia_price_category cpc, ve které jsem si zjednodušila formát datumu yy-mm-dd pouze              na rok/y.
Pro snadnější práci a zodpovězení otázky č. 5 jsem vytvořila druhou finální tabulku t_hana_plucnarova_project_sql_secondary_final, která obsahuje potřebná data z tabulek economies a countries.

Největší problém mi činila otázka č. 4, respektive napojení dvou stejných tabulek s cílem zjistit procentuální změny ve vývoji výše mezd a cen potravin zároveň. Query trvala příliš dlouho. Nedařilo se mi dospět k nějakému výsledku.
Přistoupila jsem k použití funkce LAG, díky které jsem nakonec po týdnech testování dosáhla výsledku.

Otázka č. 1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? Délka query ca. 1m 30s.

Odpověď: Mzdy rostly napříč všemi odvětvími v letech 2008, 2012, 2017 a 2018.
V roce 2015 a v roce 2016 rostly mzdy ve všech odvětvích vyjma jednoho (2015 Výroba a rozvod elektřiny, plynu…, 2016 Těžba a dobývání).
V ostatních V ostatních letech v některých odvětvích mzdy rostly, v jiných však nikoliv.


Otázka č.2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? Délka query ca. 56 s.

Odpověď: Dle dostupných dat a srovnatelného období bylo možné si koupit  ks 1.287 ks chleba           a 1.437 l mléka v roce 2006 a 1.342 ks chleba a 1.642 l mléka v roce 2018.


Otázka č.3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší procentuální meziroční růst)? Délka query ca. 2m 6s.

Odpověď:
2007	117101		Rajská jablka červená	-30.28
2008	117404		Konzumní brambory	-23.54
2009	111303		Pečivo pšeničné bílé	-28.5
2010	111303		Pečivo pšeničné bílé	-13.64
2011	117101		Rajská jablka červená	-28.2
2012	117404		Konzumní brambory	-21.93
2013	114701		Vejce slepičí		-15.14
2014	117401		Konzumní brambory	-20.14
2015	114501		Eidamská cihla		-20.73
2016	111,201	Pšeničná mouka hl. 	-12.41
2017	117,106	Mrkev			-18.97
2018	118,101	Cukr krystalový 		-21.09


Otázka č.4: Existuje rok, ve kterém by meziroční nárůst potravin výrazně vyšší než růst mezd (větší než 10%)? Délka query ca. 1m 22s.

V roce 2017 dosáhl meziroční nárůst potravin 10% (9.98%).	


Otázka č.5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem? Délka query 4m 33s.	
	
Odpověď: Ano, růst HDP se projevuje výraznějším růstem mezd a potravin v následujícím roce. 


	




