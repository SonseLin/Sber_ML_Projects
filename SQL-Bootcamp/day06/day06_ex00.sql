CREATE TABLE person_discounts (
    id bigint PRIMARY KEY,
    fk_person_discounts_person_id bigint,
    FOREIGN KEY (fk_person_discounts_person_id) REFERENCES person(id),
    fk_person_discounts_pizzeria_id bigint,
    FOREIGN KEY (fk_person_discounts_pizzeria_id) REFERENCES pizzeria(id),
    discount NUMERIC
);