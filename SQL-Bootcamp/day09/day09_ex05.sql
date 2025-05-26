DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
    id INTEGER,
    name VARCHAR(100),
    age INTEGER,
    gender VARCHAR(10),
    address VARCHAR(255)
) AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = pgender;
$$ LANGUAGE SQL;