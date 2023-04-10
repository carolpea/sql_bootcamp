WITH favorite_orders AS (SELECT pizzeria.name, count(po.order_date)
                         FROM pizzeria
                                  JOIN menu m ON pizzeria.id = m.pizzeria_id
                                  JOIN person_order po ON m.id = po.menu_id
                         GROUP BY 1),
    favorite_visits AS (SELECT pizzeria.name, count(pv.visit_date)
                        FROM pizzeria
                        JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
                        GROUP BY 1)
SELECT name, sum(count) as total_count
from (select *
      from favorite_orders
      union all
      select *
      from favorite_visits) m
group by name
order by 2 desc, 1;
