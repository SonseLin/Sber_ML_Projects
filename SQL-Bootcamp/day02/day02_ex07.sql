WITH pid AS (
    SELECT id FROM person WHERE name = 'Dmitriy'
),
dmitriyday AS (
    SELECT * FROM person_visits WHERE visit_date = '2022-01-08'
)
SELECT pi.name
FROM pid
LEFT JOIN dmitriyday pv ON pv.person_id = pid.id
LEFT JOIN pizzeria pi ON pi.id = pv.pizzeria_id;