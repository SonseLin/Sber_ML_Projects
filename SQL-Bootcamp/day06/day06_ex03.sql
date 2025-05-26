CREATE UNIQUE INDEX idx_person_discounts_unique
ON person_discounts(fk_person_discounts_person_id, fk_person_discounts_pizzeria_id);

-- proof
-- Planning time: 0.788 -> 0.599
-- Execution time: 0.586 -> 0.314