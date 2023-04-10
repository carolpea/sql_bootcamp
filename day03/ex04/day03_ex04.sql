WITH only_male AS (SELECT DISTINCT p.name AS pizzeria_name
                   FROM person_order
                            JOIN menu m ON m.id = person_order.menu_id
                            JOIN pizzeria p ON m.pizzeria_id = p.id
                            JOIN person p2 ON person_order.person_id = p2.id
                   WHERE p2.gender = 'male'),
     only_female AS (SELECT DISTINCT p.name AS pizzeria_name
                     FROM person_order
                              JOIN menu m ON m.id = person_order.menu_id
                              JOIN pizzeria p ON m.pizzeria_id = p.id
                              JOIN person p2 ON person_order.person_id = p2.id
                     WHERE p2.gender = 'female')

    (SELECT *
     FROM only_male
     EXCEPT
     SELECT *
     FROM only_female)
UNION
(SELECT *
 FROM only_female
 EXCEPT
 SELECT *
 FROM only_male)
ORDER BY 1;
