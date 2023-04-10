SELECT action_date, person.name AS person_name
FROM (SELECT order_date AS action_date, person_id AS person_name
      FROM person_order
      INTERSECT
      SELECT visit_date, person_id
      FROM person_visits) AS date
         INNER JOIN person
                    ON person.id = date.person_name
ORDER BY action_date, person_name DESC ;