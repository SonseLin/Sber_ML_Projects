ALTER TABLE person_discounts
ALTER COLUMN fk_person_discounts_person_id SET NOT NULL,
ALTER COLUMN fk_person_discounts_pizzeria_id SET NOT NULL,
ALTER COLUMN discount SET NOT NULL,
ALTER COLUMN discount SET DEFAULT 0,
ADD CONSTRAINT ch_range_discount CHECK (discount >= 0 AND discount <= 100);