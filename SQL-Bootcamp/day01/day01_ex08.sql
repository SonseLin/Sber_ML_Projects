WITH IntersectedData AS (
    SELECT
        order_date,
        person_id AS id
    FROM
        person_order
)
SELECT
    id.order_date,
    CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM
    IntersectedData AS id
NATURAL JOIN
    person p
ORDER BY
    id.order_date,
    p.name ASC;
