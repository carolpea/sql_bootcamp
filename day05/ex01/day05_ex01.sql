SELECT pizza_name, piz.name
FROM menu
JOIN pizzeria AS piz ON piz.id = menu.pizzeria_id;

SET enable_seqscan TO off;
EXPLAIN ANALYZE SELECT pizza_name, piz.name
                FROM menu
                         JOIN pizzeria AS piz ON piz.id = menu.pizzeria_id;