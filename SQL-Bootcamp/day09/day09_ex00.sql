CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    type_event CHAR(1) NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK(type_event IN('I', 'U', 'D'))
);

-- step 2 trigger function
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (row_id, name, age, gender, address, created, type_event)
    VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address, now(), 'I');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- step 3 trigger itself
CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- step 4 insert query
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');