WITH peppemush AS (
SELECT * FROM menu WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
)
SELECT pizza_name, pi.name, price
FROM peppemush
LEFT JOIN pizzeria pi ON pi.id = peppemush.pizzeria_id
ORDER BY pizza_name, pi.name;