WITH targetPerson AS (
    SELECT * FROM person WHERE name = 'Kate'
),
pricePizzas AS (
    SELECT * FROM menu WHERE price >= 800 AND price <= 1000
)

SELECT me.pizza_name, me.price, pi.name, pv.visit_date
FROM targetPerson tp
LEFT JOIN person_visits pv ON pv.person_id = tp.id
LEFT JOIN pizzeria pi ON pi.id = pv.pizzeria_id
LEFT JOIN pricePizzas me ON me.pizzeria_id = pi.id
ORDER BY me.pizza_name, me.price, pi.name;