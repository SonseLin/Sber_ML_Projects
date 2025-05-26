WITH dominosID AS (
    SELECT id FROM pizzeria WHERE name = 'Dominos'
),
persons AS (
    SELECT id, name FROM person WHERE name IN ('Denis', 'Irina')
),
maxID AS (
    SELECT MAX(id) AS maxid FROM person_visits
)
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT maxID.maxid + ROW_NUMBER() OVER (), persons.id, dominosID.id, '2022-02-24'
FROM persons
CROSS JOIN dominosID
CROSS JOIN maxID;
