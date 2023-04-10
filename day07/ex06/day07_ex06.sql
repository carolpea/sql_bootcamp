SELECT piz.name, count(order_date) AS count_of_orders,
       round(avg(m.price), 2) AS average_price,
       round(max(m.price), 2) AS max_price,
       round(min(m.price), 2) AS min_price
FROM person_order AS ord
JOIN menu AS m ON m.id = ord.menu_id
JOIN pizzeria AS piz ON piz.id = m.pizzeria_id
GROUP BY 1
ORDER BY 1;
