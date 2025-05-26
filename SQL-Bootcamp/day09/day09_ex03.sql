-- туда его, ТУДА!!
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

-- парни парни парни это шанс это наш шанс  И ЭТИХ ТОЖЕ !!
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

-- ПАВЕР РЕНДЖЕРС СОБИРАЕМСЯ!!
CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO person_audit (type_event, row_id, name, age, gender, address, created)
        VALUES ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address, now());
    
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO person_audit (type_event, row_id, name, age, gender, address, created)
        VALUES ('U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address, now());
    
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO person_audit (type_event, row_id, name, age, gender, address, created)
        VALUES ('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address, now());
    
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- документируем изменения
CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();