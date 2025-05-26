COMMENT ON TABLE person_discounts IS 'Table contains discount for every person and pizzeria`s';
COMMENT ON COLUMN person_discounts.id IS 'ID for each row';
COMMENT ON COLUMN person_discounts.fk_person_discounts_person_id IS 'Person id';
COMMENT ON COLUMN person_discounts.fk_person_discounts_pizzeria_id IS 'Pizzeria id in which discount is';
COMMENT ON COLUMN person_discounts.discount IS 'Show discount amount for particular person in each pizzeria';
