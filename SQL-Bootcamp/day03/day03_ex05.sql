WITH andrey AS (
    SELECT id FROM person WHERE name = 'Andrey'
),
visited AS (
    SELECT pv.pizzeria_id
    FROM person_visits pv
    JOIN andrey a ON pv.person_id = a.id
),
ordered AS (
    SELECT me.pizzeria_id
    FROM person_order po
    JOIN andrey a ON po.person_id = a.id
    LEFT JOIN menu me ON po.menu_id = me.id
),
visitNotOrder AS (
    SELECT * FROM visited
    EXCEPT
    SELECT * FROM ordered
)
SELECT pi.name FROM visitNotOrder vno
LEFT JOIN pizzeria pi ON pi.id = vno.pizzeria_id;
