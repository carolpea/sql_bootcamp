SELECT pizza_name, price, piz.name, viz.visit_date
FROM menu
    JOIN pizzeria AS piz ON menu.pizzeria_id = piz.id
    JOIN person_visits AS viz ON piz.id = viz.pizzeria_id
    JOIN person ON viz.person_id = person.id
WHERE person.name = 'Kate' AND price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;
