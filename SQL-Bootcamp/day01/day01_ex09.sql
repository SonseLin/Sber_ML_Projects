SELECT p.name 
FROM pizzeria p
WHERE p.id NOT IN (SELECT DISTINCT pizzeria_id FROM person_visits);

SELECT p.name 
FROM pizzeria p
WHERE NOT EXISTS (SELECT 1 FROM person_visits WHERE person_visits.pizzeria_id = p.id);
