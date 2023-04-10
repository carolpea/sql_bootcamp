WITH piz1 AS (SELECT pizza_name, piz.name AS pizzeria_name_1,
                     price, piz.id
              FROM menu
                JOIN pizzeria AS piz ON piz.id = menu.pizzeria_id)
SELECT DISTINCT piz1.pizza_name as pizza_name, piz1.pizzeria_name_1,
                piz.name as pizzeria_name_2, piz1.price as price
FROM piz1
         JOIN menu ON piz1.price = menu.price
         JOIN pizzeria AS piz ON piz.id = menu.pizzeria_id
where piz1.pizza_name = menu.pizza_name
  and piz1.pizzeria_name_1 != piz.name
  and piz1.id < piz.id
order by 1, 2, 3;
