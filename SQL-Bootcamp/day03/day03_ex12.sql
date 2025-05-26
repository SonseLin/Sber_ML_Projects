WITH greek_pizza AS (
    SELECT id AS pizza_id FROM menu WHERE pizza_name = 'greek pizza'
),
persons AS (
    SELECT id AS person_id FROM person
),
max_id AS (
    SELECT COALESCE(MAX(id), 0) AS max_id FROM person_order
),
new_orders AS (
    SELECT
        max_id.max_id + ROW_NUMBER() OVER () AS id,
        p.person_id,
        gp.pizza_id,
        '2022-02-25'::date AS order_date
    FROM
        persons p
    CROSS JOIN
        greek_pizza gp,
    max_id
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT id, person_id, pizza_id, order_date
FROM new_orders;
