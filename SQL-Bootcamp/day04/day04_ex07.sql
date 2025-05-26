WITH id AS (
    SELECT id FROM person WHERE name = 'Dmitriy'
),
maxid AS (
    SELECT MAX(id) + 1 AS new_id FROM person_visits
)
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT new_id FROM maxid), id, 5, '2022-01-08'
FROM id;




REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;