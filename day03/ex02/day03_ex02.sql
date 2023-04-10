SELECT menu.pizza_name, menu.price, p.name
FROM menu
         LEFT JOIN person_order on menu.id = menu_id
         JOIN pizzeria p on menu.pizzeria_id = p.id
WHERE menu_id IS NULL
ORDER BY 1, 2;