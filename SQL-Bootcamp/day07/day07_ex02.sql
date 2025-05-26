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
SELECT name, count, action_type FROM orders
UNION ALL
SELECT name, count, action_type FROM visits
ORDER BY action_type ASC, count DESC;