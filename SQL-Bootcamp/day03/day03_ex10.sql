WITH persons AS (
    SELECT id, name FROM person WHERE name IN ('Denis', 'Irina')
),
maxID AS (
    SELECT MAX(id) AS maxid FROM person_order
),
sicilianID AS (
    SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT maxID.maxid + ROW_NUMBER() OVER (), persons.id, sicilianID.id, '2022-02-24'
FROM persons
CROSS JOIN maxID
CROSS JOIN sicilianID;