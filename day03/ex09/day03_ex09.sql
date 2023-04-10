INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (SELECT max(person_visits.id) + 1 FROM person_visits),
       (SELECT person.id FROM person WHERE name = 'Denis'),
       (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
       '2022-02-24'::date
UNION
SELECT (SELECT max(person_visits.id) + 2 FROM person_visits),
       (SELECT person.id FROM person WHERE name = 'Irina'),
       (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name = 'Dominos'),
       '2022-02-24'::date
