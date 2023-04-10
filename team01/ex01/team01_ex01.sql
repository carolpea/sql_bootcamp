insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH currency_sort as (
    SELECT b.*
         , row_number() OVER (partition by b.user_id,    b.currency_id , b.money,  b.type, b.updated
        ORDER BY XD.sort1 DESC) sort2
         , XD.*
    FROM balance b
             JOIN (
        SELECT c.*
             , row_number() OVER (partition by c.id
            ORDER BY c.updated) sort1
        FROM currency c
    ) XD ON XD.id = b.currency_id AND (XD.updated <= b.updated OR XD.sort1 = 1)
)
SELECT coalesce(u.name, 'not defined')                    as name
     , coalesce(u.lastname, 'not defined')                as lastname
     , cur.name                                             as currency_name
     , coalesce(cur.rate_to_usd, 1) * coalesce(cur.money, 0)  as currency_in_usd
FROM currency_sort cur
         LEFT JOIN "user" u ON u.id = cur.user_id
WHERE cur.sort2 = 1
ORDER BY name DESC, lastname, currency_name;
