SELECT name
FROM person p
WHERE EXISTS (
    SELECT 1
    FROM person_order pv
    WHERE pv.person_id = p.id
      AND pv.order_date = '2022-01-07'
      AND (pv.menu_id = 13 OR pv.menu_id = 14 OR pv.menu_id = 18)
);