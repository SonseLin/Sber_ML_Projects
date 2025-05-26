WITH dominosID AS (
    SELECT id FROM pizzeria WHERE name = 'Dominos'
),
maxID AS (
    SELECT MAX(id) AS maxid FROM menu
)
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT maxID.maxid + 1, dominosID.id, 'sicilian pizza', 900
FROM maxID, dominosID;
