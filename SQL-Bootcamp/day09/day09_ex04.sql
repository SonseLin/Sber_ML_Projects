CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (
    id INTEGER,
    name VARCHAR(100),
    age INTEGER,
    gender VARCHAR(10),
    address VARCHAR(255)
) AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'female';
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (
    id INTEGER,
    name VARCHAR(100),
    age INTEGER,
    gender VARCHAR(10),
    address VARCHAR(255)
) AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'male';
$$ LANGUAGE SQL;