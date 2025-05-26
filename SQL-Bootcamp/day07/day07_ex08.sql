SELECT p.address, piz.name, COUNT(*) AS count FROM person_order po
LEFT JOIN person p ON p.id = po.person_id
LEFT JOIN menu m ON m.id = po.menu_id
LEFT JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY piz.name, p.address
ORDER BY p.address, piz.name;