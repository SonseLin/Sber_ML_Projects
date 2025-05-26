-- planning time 0.184 ms
-- execution time 0.126 ms
SELECT pizza_name, pi.name as pizzeria_name FROM menu m 
LEFT JOIN pizzeria pi ON pi.id = m.pizzeria_id;