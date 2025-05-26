INSERT INTO person_discounts (id, fk_person_discounts_person_id, fk_person_discounts_pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER () AS id,
    po.person_id,
    m.pizzeria_id,
    CASE 
        WHEN COUNT(*) = 1 THEN 10.5
        WHEN COUNT(*) = 2 THEN 22
        ELSE 30
    END AS discount_value
FROM 
    person_order po
JOIN 
    menu m ON po.menu_id = m.id
GROUP BY 
    po.person_id, 
    m.pizzeria_id;