SELECT name
FROM (SELECT DISTINCT p.name AS name, count(m.pizza_name) AS pizza
      FROM person_order AS ord
               JOIN menu m ON m.id = ord.menu_id
               JOIN person p ON ord.person_id = p.id
      WHERE (pizza_name = 'pepperoni pizza' OR pizza_name = 'cheese pizza')
        AND p.gender = 'female'
      group by name) f
where pizza = 2
order by 1;
