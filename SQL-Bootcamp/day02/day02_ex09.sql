WITH targetPerson AS (
    SELECT * FROM person WHERE gender = 'female'
),
cheese_orders AS (
    SELECT po.person_id
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    WHERE m.pizza_name = 'cheese pizza'
),
pepperoni_orders AS (
    SELECT po.person_id
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    WHERE m.pizza_name = 'pepperoni pizza'
),
combined_orders AS (
    SELECT co.person_id
    FROM cheese_orders co
    INNER JOIN pepperoni_orders po ON co.person_id = po.person_id
)
SELECT DISTINCT tp.name 
FROM targetPerson tp
INNER JOIN combined_orders co ON tp.id = co.person_id
ORDER BY tp.name;
