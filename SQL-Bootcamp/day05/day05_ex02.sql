CREATE INDEX idx_person_name ON person(UPPER(name));

-- based search
EXPLAIN ANALYZE SELECT * FROM person where name = 'andrey';
-- index proof search
EXPLAIN ANALYZE SELECT * FROM person WHERE UPPER(name) = 'ANDREY';