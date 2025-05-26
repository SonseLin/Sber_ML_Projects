SELECT name
FROM (
    SELECT
        p.name,
        ROW_NUMBER() OVER (PARTITION BY p.name ORDER BY p.name ASC) AS row_num
    FROM
        person_order po
    LEFT JOIN
        person p ON p.id = po.person_id
) subquery
WHERE row_num = 1
ORDER BY name;