WITH IntersectedData AS (
SELECT
order_date,
person_id
FROM
person_order
)
SELECT
id.order_date,
CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM IntersectedData as id
JOIN
person p ON id.person_id = p.id
ORDER BY
id.order_date,
p.name ASC;