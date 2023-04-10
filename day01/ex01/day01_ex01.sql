SELECT *
FROM (SELECT name
      FROM person
      ORDER BY name) AS object_name
union all
select *
from(select menu.pizza_name
     from menu
     order by menu.pizza_name
    ) as object_name;