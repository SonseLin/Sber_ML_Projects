CREATE SEQUENCE seq_person_discounts
START WITH 1;

DO $$
DECLARE
    row_count INT;
BEGIN
    SELECT COUNT(*) INTO row_count FROM person_discounts;
    EXECUTE 'SELECT setval(''seq_person_discounts'', ' || (row_count + 1) || ');';
END $$;

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');