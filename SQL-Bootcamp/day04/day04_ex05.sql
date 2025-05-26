CREATE VIEW v_price_width_discount AS
SELECT p.name, me.pizza_name, me.price, CAST(me.price * 0.9 AS integer) AS discount_price
FROM person p
LEFT JOIN person_order po ON p.id = po.person_id
LEFT JOIN menu me ON me.id = po.menu_id
ORDER BY p.name, me.pizza_name;