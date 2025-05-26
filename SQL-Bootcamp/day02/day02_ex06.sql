WITH pid AS (
SELECT id FROM person WHERE name = 'Denis' OR name = 'Anna'
)
SELECT me.pizza_name, pi.name
FROM pid
LEFT JOIN person_order po ON pid.id = po.person_id
LEFT JOIN menu me ON po.menu_id = me.id
LEFT JOIN pizzeria pi ON me.pizzeria_id = pi.id
ORDER BY me.pizza_name, pi.name;