SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
         JOIN menu ON menu.id = person_order.menu_id
         JOIN person ON person.id = person_order.person_id
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY 1, 2;