CREATE OR replace function fnc_persons_male() returns table
    (id bigint, name varchar, age integer, gender varchar, address varchar) as $male$
SELECT * FROM person WHERE gender = 'male'
    $male$ language sql volatile;

CREATE OR replace function fnc_persons_female() returns table
    (id bigint, name varchar, age integer, gender varchar, address varchar) as $female$
SELECT * FROM person WHERE gender = 'female'
    $female$ language sql volatile;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
