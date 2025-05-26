WITH IntersectedData AS (
    SELECT
        order_date AS action_date,
        person_id AS pid
    FROM
        person_order
    INTERSECT
    SELECT
        visit_date AS action_date,
        person_id AS pid
    FROM
        person_visits
)
SELECT
    id.action_date,
    p.name AS person_name
FROM
    IntersectedData id
JOIN
    person p ON id.pid = p.id
ORDER BY
    id.action_date,
    p.name DESC;
