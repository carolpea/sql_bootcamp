WITH favorite_orders AS (SELECT pizzeria.name, count(po.order_date), 'order' AS action_type
                         FROM pizzeria
                                  JOIN menu m ON pizzeria.id = m.pizzeria_id
                                  JOIN person_order po ON m.id = po.menu_id
                         GROUP BY 1
                         ORDER BY 2 DESC
                         limit 3),
    favorite_visits AS (SELECT pizzeria.name, count(pv.visit_date), 'visit' AS action_type
                        FROM pizzeria
                        JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
                        GROUP BY 1
                        ORDER BY 2 DESC
                        limit 3)
SELECT *
FROM favorite_orders
UNION ALL
SELECT *
FROM favorite_visits
ORDER BY 3, 2 DESC;