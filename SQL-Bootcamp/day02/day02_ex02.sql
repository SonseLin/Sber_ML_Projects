SELECT
    COALESCE(p.name, '-') AS person_name,
    COALESCE(TO_CHAR(pv.visit_date, 'YYYY-MM-DD'), 'null') AS visit_date,                                                       
    COALESCE(pi.name, '-') AS pizzeria_name
FROM
    person p
FULL OUTER JOIN
    person_visits pv ON p.id = pv.person_id AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
FULL OUTER JOIN
    pizzeria pi ON pv.pizzeria_id = pi.id AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03' OR pv.visit_date IS NULL
ORDER BY                                                 
    person_name, pizzeria_name;