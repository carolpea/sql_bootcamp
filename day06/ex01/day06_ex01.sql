WITH dicsount AS (SELECT row_number() over () as id, person_id, m.pizzeria_id,
                                     CASE
                                         WHEN (count(pizzeria_id) = 1) THEN 10.5
                                         WHEN (count(pizzeria_id) = 2) THEN 22
                                         ELSE 30
                                         END AS discount
                              FROM person_order AS ord
                                JOIN menu m on m.id = ord.menu_id
                             GROUP BY person_id, m.pizzeria_id
                             ORDER BY 2)

insert into person_discounts (id, person_id, pizzeria_id, discount) table dicsount;
