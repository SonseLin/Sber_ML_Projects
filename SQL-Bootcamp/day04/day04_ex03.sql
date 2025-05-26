SELECT vgd.generated_date
FROM v_generated_dates vgd
LEFT JOIN person_visits pv ON vgd.generated_date = pv.visit_date
WHERE pv.visit_date IS NULL;