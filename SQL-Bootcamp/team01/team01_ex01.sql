insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH closest_rate AS (
    SELECT 
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        b.user_id,
        b.money,
        b.currency_id,
        c.name AS cur_name,
        b.updated AS balance_updated,
        c.rate_to_usd,
        c.updated AS currency_updated,
        ROW_NUMBER() OVER (PARTITION BY b.user_id, b.currency_id, b.updated 
                           ORDER BY ABS(EXTRACT(EPOCH FROM (b.updated - c.updated))) ASC) AS rn
    FROM 
        balance b
    JOIN 
        currency c ON b.currency_id = c.id
    JOIN "user" u ON u.id = b.user_id
)
SELECT 
    cr.name,
    cr.lastname,
    cr.cur_name,
    (cr.money * cr.rate_to_usd) AS currency_in_usd
FROM 
    closest_rate cr
WHERE 
    cr.rn = 1
ORDER BY 
    cr.name DESC, cr.lastname ASC, cr.cur_name ASC;