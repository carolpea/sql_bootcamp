SELECT name
FROM person
    JOIN person_order AS ord ON person.id = ord.person_id
    JOIN (SELECT id
          FROM menu
          WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza') AS men
    ON men.id = ord.menu_id
WHERE gender = 'male' AND address = 'Moscow' OR address = 'Samara'
ORDER BY name DESC;

