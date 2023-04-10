SELECT per.name AS person_name,
       m.pizza_name AS pizza_name,
       p.name AS pizzeria_name
FROM person_order AS ord
    JOIN person AS per ON ord.person_id = per.id
    JOIN menu m on ord.menu_id = m.id
    JOIN pizzeria p on m.pizzeria_id = p.id
ORDER BY person_name, pizza_name, pizzeria_name;