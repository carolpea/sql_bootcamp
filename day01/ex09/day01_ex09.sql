SELECT name
FROM pizzeria
WHERE name NOT IN (SELECT name
                   FROM pizzeria
                   JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id);
                   );

SELECT name
FROM pizzeria
WHERE NOT EXISTS(SELECT *
                 FROM person_visits
                 where pizzeria.id = person_visits.pizzeria_id);