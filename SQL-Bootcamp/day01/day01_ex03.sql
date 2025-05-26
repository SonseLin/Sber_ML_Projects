SELECT
    order_date AS object_date,
    person_id AS pid
FROM
    person_order
INTERSECT
SELECT
    visit_date AS object_date,
    person_id AS pid
FROM
    person_visits
ORDER BY
    object_date,
    pid DESC;