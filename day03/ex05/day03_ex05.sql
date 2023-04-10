SELECT piz.name AS pizzeria_name
FROM pizzeria AS piz
         JOIN person_visits ON piz.id = person_visits.pizzeria_id
         JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey'
EXCEPT ALL
SELECT piz.name AS name
FROM pizzeria AS piz
         JOIN menu ON piz.id = menu.pizzeria_id
         JOIN person_order AS ord ON menu.id = ord.menu_id
         JOIN person ON person.id = ord.person_id
WHERE person.name = 'Andrey'
ORDER BY 1;