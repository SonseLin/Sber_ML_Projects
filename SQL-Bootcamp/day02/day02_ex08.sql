WITH targetPerson AS (
   SELECT * FROM person WHERE (address = 'Moscow' OR address = 'Samara') AND gender = 'male'
),
peppemush AS (
    SELECT * FROM menu WHERE pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza'
)
SELECT DISTINCT tp.name FROM targetPerson tp
LEFT JOIN person_order po ON po.person_id = tp.id
LEFT JOIN peppemush pm ON po.menu_id = pm.id
ORDER BY tp.name DESC;