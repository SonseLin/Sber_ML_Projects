SELECT p.name,
       CONCAT(CASE WHEN p.name = 'Denis' THEN 'True' ELSE 'False' END) AS check_name
FROM person p
WHERE EXISTS (
    SELECT 1
    FROM person_order po
    WHERE po.person_id = p.id
      AND po.order_date = '2022-01-07'
      AND (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18)
);

SELECT p.id, p.name, CONCAT(CASE WHEN p.age >= 10 AND p.age <= 20 THEN "interval #1" ELSE
 p.age > 20 AND p.age < 24 THEN "interval #2" ELSE "interval #3" END) AS interval_info
 FROM person p;