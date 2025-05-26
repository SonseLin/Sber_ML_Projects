CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice INTEGER DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (
    pizzeria_name VARCHAR,
    pizza_price NUMERIC
)
AS $$
BEGIN
    RETURN QUERY
    SELECT piz.name AS pizzeria_name, m.price AS pizza_price
    FROM person_visits pv
    INNER JOIN pizzeria piz ON pv.pizzeria_id = piz.id
    INNER JOIN menu m ON piz.id = m.pizzeria_id
    WHERE pv.person_id = (SELECT id FROM person WHERE name = pperson)
      AND m.price < pprice
      AND DATE_TRUNC('day', pv.visit_date) = pdate;
END;
$$ LANGUAGE plpgsql;