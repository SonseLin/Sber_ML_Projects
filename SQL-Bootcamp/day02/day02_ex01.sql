WITH missing_days AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS missing_date
)
SELECT missing_date 
FROM missing_days md
LEFT JOIN person_visits pv ON md.missing_date = pv.visit_date AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY md.missing_date ASC;
