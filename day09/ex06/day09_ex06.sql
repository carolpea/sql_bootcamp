CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
    pprice numeric default 500, pdate date default '2022-01-08') returns table (name varchar) as $visit_and_eats$
    begin
    return query
    SELECT DISTINCT piz.name FROM pizzeria AS piz
        JOIN person_visits AS vis ON vis.pizzeria_id = piz.id
        JOIN menu AS m ON m.pizzeria_id = piz.id
        JOIN person_order AS ord ON ord.menu_id = m.id
        JOIN person AS p ON p.id = ord.person_id
    WHERE visit_date = order_date AND m.price < pprice AND p.name = pperson
AND ord.order_date = pdate;
end;
    $visit_and_eats$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(pprice := 1300,pdate := '2022-01-09');

