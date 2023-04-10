CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_seqscan TO off;
EXPLAIN ANALYZE SELECT name
                FROM person
                WHERE upper(name) = 'ELVIRA';