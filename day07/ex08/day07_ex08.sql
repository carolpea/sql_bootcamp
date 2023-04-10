SELECT p.address, piz.name, count(order_date) AS count_of_orders
FROM person_order AS ord
    JOIN person AS p ON p.id = ord.person_id
    JOIN menu AS m ON m.id = ord.menu_id
    JOIN pizzeria AS piz ON piz.id = m.pizzeria_id
GROUP BY 2, 1
ORDER BY 1, 2;
