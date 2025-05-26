WITH orders AS (
    SELECT
        piz.name AS name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM 
        person_order po
    LEFT JOIN 
        menu m ON po.menu_id = m.id
    LEFT JOIN
        pizzeria piz ON m.pizzeria_id = piz.id
    GROUP BY
        piz.name
    ORDER BY
        count DESC
    LIMIT 3
),  visits AS (
    SELECT
        piz.name AS name,
        COUNT(*) AS count,
        'visit' AS action_type
    FROM 
        person_visits pv
    LEFT JOIN
        pizzeria piz ON pv.pizzeria_id = piz.id
    GROUP BY
        piz.name
    ORDER BY
        count DESC
    LIMIT 3
)
SELECT
    COALESCE(o.name, v.name) AS name,
    COALESCE(o.count, 0) + COALESCE(v.count, 0) AS total_count
FROM
    orders o
FULL JOIN 
    visits v ON o.name = v.name
ORDER BY
    total_count DESC, name ASC;
