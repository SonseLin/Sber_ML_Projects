WITH selected AS (
    SELECT DISTINCT menu_id FROM person_order
)
SELECT me.id 
FROM menu me 
WHERE me.id NOT IN (SELECT menu_id FROM selected)
ORDER BY me.id;