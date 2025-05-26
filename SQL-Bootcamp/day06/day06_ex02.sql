SELECT p.name, m.pizza_name, m.price, ROUND((m.price - (m.price / 100 * pd.discount))) AS discount, pi.name FROM person_order po
LEFT JOIN person p ON po.person_id = p.id
LEFT JOIN menu m ON po.menu_id = m.id
LEFT JOIN pizzeria pi ON pi.id = m.pizzeria_id
LEFT JOIN person_discounts pd ON pd.fk_person_discounts_person_id = p.id AND
fk_person_discounts_pizzeria_id = pi.id
ORDER BY p.name, m.pizza_name;