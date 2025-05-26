WITH female_visits AS (
    SELECT pv.pizzeria_id, COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.gender = 'female'
    GROUP BY pv.pizzeria_id
),
male_visits AS (
    SELECT pv.pizzeria_id, COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.gender = 'male'
    GROUP BY pv.pizzeria_id
)
SELECT pi.name AS pizzeria_name
FROM pizzeria pi
JOIN female_visits fv ON pi.id = fv.pizzeria_id
LEFT JOIN male_visits mv ON pi.id = mv.pizzeria_id
WHERE fv.visit_count > COALESCE(mv.visit_count, 0)
UNION ALL
SELECT pi.name AS pizzeria_name
FROM pizzeria pi
JOIN male_visits mv ON pi.id = mv.pizzeria_id
LEFT JOIN female_visits fv ON pi.id = fv.pizzeria_id
WHERE mv.visit_count > COALESCE(fv.visit_count, 0)
ORDER BY pizzeria_name;