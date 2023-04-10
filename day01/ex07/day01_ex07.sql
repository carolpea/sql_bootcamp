SELECT order_date, CONCAT (p.name, ' (age:', p.age, ')') AS person_information
FROM person_order
         JOIN person AS p ON p.id = person_order.person_id
ORDER BY order_date, person_information;