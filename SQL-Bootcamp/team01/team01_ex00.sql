WITH user_balance AS(
    SELECT
        bal.user_id,
        SUM(bal.money) AS money,
        bal.type, bal.currency_id
    FROM balance bal
    GROUP BY bal.user_id, bal.type, bal.currency_id
),
last_currency AS (
    SELECT
        cur_r.id,
        cur_r.name AS currency_name, 
        cur_r.rate_to_usd AS last_rate_to_usd
    FROM currency cur_r
    JOIN (SELECT cur.id, cur.name, MAX(cur.updated) AS latest_upd FROM currency cur
    GROUP BY cur.id, cur.name) AS last
    ON cur_r.id = last.id
    AND cur_r.name = last.name
    AND cur_r.updated = last.latest_upd
)

SELECT
    COALESCE(usr.name, 'not defined') AS name,
    COALESCE(usr.lastname, 'not defined') AS lastname,
    u_bal.type,
    u_bal.money AS volume,
    COALESCE(l_cur.currency_name, 'not defined') AS currency_name,
    COALESCE(l_cur.last_rate_to_usd, 1) AS last_rate_to_usd,
    CAST(ROUND(u_bal.money * COALESCE(l_cur.last_rate_to_usd, 1), 6) AS real) AS total_volume_in_usd
FROM user_balance u_bal
LEFT JOIN "user" usr ON u_bal.user_id = usr.id
LEFT JOIN last_currency l_cur ON u_bal.currency_id = l_cur.id
ORDER BY name DESC, lastname, type;
