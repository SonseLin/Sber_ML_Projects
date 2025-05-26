WITH selected AS (
    SELECT DISTINCT menu_id FROM person_order
)
SELECT me.pizza_name, me.price, pi.name
FROM menu me 
LEFT JOIN pizzeria pi ON me.pizzeria_id = pi.id
WHERE me.id NOT IN (SELECT menu_id FROM selected)
ORDER BY me.pizza_name, me.price;