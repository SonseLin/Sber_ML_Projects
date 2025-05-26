CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

-- proof
EXPLAIN ANALYZE SELECT pizzeria_id, pizza_name FROM menu 
WHERE pizza_name = 'cheese pizza' AND pizzeria_id = 2;