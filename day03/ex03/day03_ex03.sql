WITH only_male AS (SELECT pizzeria.name AS pizzeria_name
                   FROM pizzeria
                            JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
                            JOIN person ON person_visits.person_id = person.id
                   WHERE gender = 'male'),
     only_female AS (SELECT pizzeria.name as pizzeria_name
                     FROM pizzeria
                              JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
                              JOIN person ON person_visits.person_id = person.id
                     WHERE gender = 'female')

    (SELECT *
     FROM only_male
     EXCEPT ALL
     SELECT *
     FROM only_female)
UNION ALL
(SELECT *
 FROM only_female
 EXCEPT ALL
 SELECT *
 FROM only_male)

ORDER BY 1;

