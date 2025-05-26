SELECT *
FROM v_tour
WHERE total_cost IN (
        SELECT MIN(total_cost)
        FROM v_tour
        UNION
        SELECT MAX(total_cost)
        FROM v_tour
    )
ORDER BY total_cost,
    tour;
DROP VIEW v_tour;
DROP TABLE nodes;