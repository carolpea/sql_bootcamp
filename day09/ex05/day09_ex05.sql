DROP FUNCTION fnc_persons_male CASCADE;
DROP FUNCTION fnc_persons_female CASCADE;

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar default 'female') returns table
(id bigint, name varchar, age integer, gender varchar, address varchar) AS $persons$
SELECT * FROM person WHERE gender = pgender;
$persons$ language sql volatile;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
