SELECT 
p.id AS pid, p.name AS pname, age, gender, address, 
pizza.id, pizza.name 
FROM person p 
CROSS JOIN pizzeria pizza 
ORDER BY pid;