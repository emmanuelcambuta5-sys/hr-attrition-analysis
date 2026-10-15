-- Validação: confere se o banco recebeu todos os registros do CSV (esperado: 1470)
SELECT COUNT(*)
FROM employees;

-- Funcionários por departamento (esperado: HR 63, R&D 961, Sales 446)
SELECT Department, count(*)
FROM employees
GROUP BY Department;

-- Total e saídas por departamento, sem filtro (esperado: HR 63 e 12, R&D 961 e 133, Sales 446 e 92)
SELECT
    Department, count(*) AS total,
    sum(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS saidas
FROM employees
GROUP BY Department;


-- Taxa de attrition por departamento: total, saídas e taxa em % (esperado: Sales 20,63 | HR 19,05 | R&D 13,84)
SELECT 
    Department, count(*) AS total,
    sum(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS saidas,
    round(100.0 * (sum(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)) / (count(*)),2) AS taxa_pct
FROM employees
GROUP BY Department ;

-- Taxa de attrition por hora extra: total, saídas e taxa em % (esperado: No 10,44 | Yes 30,53)
SELECT 
    OverTime, count(*) AS total,
    sum(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS saidas,
    round(100.0 * (sum(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)) / (count(*)),2) AS taxa_pct
FROM employees
GROUP BY OverTime;

SELECT 
    Attrition, round(avg(MonthlyIncome), 2) AS media_sal, round(avg(JobSatisfaction),2) AS satisfacao
FROM employees
GROUP BY Attrition;