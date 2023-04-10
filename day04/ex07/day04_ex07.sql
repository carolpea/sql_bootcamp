INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT max(id) + 1 FROM person_visits) AS id,
       (SELECT id FROM person WHERE name = 'Dmitriy') AS person_id,
       5,
       '2022-01-08';

refresh materialized view mv_dmitriy_visits_and_eats;