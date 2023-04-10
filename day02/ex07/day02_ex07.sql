SELECT pizzeria.name
FROM pizzeria
         JOIN person_visits AS vis ON pizzeria.id = vis.pizzeria_id
         JOIN person ON vis.person_id = person.id
         JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy'
  AND menu.price < 800
  AND vis.visit_date = '2022-01-08';