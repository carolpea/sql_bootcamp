SELECT ord.order_date, CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM (SELECT order_date, person_id AS id
      FROM person_order) AS ord
         NATURAL JOIN person AS p
ORDER BY order_date, person_information;