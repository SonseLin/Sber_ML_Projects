SELECT p.name, m.pizza_name, pi.name AS pizzeria_name
FROM person p 
JOIN person_order po ON p.id = po.person_id 
JOIN menu m ON po.menu_id = m.id 
JOIN pizzeria pi ON m.pizzeria_id = pi.id
ORDER BY p.name, m.pizza_name, pi.name ASC;