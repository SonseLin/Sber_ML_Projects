WITH womanPizzas AS (
    SELECT pi.name AS pizzeria_name
    FROM person p
    JOIN person_order po ON p.id = po.person_id
    JOIN menu me ON po.menu_id = me.id
    JOIN pizzeria pi ON me.pizzeria_id = pi.id
    WHERE p.gender = 'female'
),
manPizzas AS (
    SELECT pi.name AS pizzeria_name
    FROM person p
    JOIN person_order po ON p.id = po.person_id
    JOIN menu me ON po.menu_id = me.id
    JOIN pizzeria pi ON me.pizzeria_id = pi.id
    WHERE p.gender = 'male'
),
womanOnlyPizzas AS (
    SELECT pizzeria_name FROM womanPizzas
    EXCEPT
    SELECT pizzeria_name FROM manPizzas
),
manOnlyPizzas AS (
    SELECT pizzeria_name FROM manPizzas
    EXCEPT
    SELECT pizzeria_name FROM womanPizzas
)
SELECT * FROM womanOnlyPizzas
UNION
SELECT * FROM manOnlyPizzas
ORDER BY pizzeria_name;
