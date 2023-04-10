INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT (SELECT max(menu.id) + 1 FROM menu) AS id,
       (SELECT id
        FROM pizzeria
        WHERE name = 'Dominos'),
       'sicilian pizza',
       900;