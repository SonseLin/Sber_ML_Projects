SELECT p.address, 
ROUND((CAST(MAX(p.age) AS NUMERIC) - (CAST(MIN(p.age) AS NUMERIC) / CAST(MAX(p.age) AS NUMERIC))),
        2) AS formula, 
ROUND(AVG(p.age), 2) AS average,
'true' AS comparison FROM person p
GROUP BY p.address
ORDER BY p.address;