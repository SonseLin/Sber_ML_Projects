WITH missing_days AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS missing_date
),
filtered_visits AS (
    SELECT *
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
)
SELECT 
    md.missing_date 
FROM 
    missing_days md
LEFT JOIN 
    filtered_visits pv ON md.missing_date = pv.visit_date
WHERE 
    pv.visit_date IS NULL
ORDER BY 
    md.missing_date ASC;
