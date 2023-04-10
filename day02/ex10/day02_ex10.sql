SELECT f.name as person_name1, person.name as person_name2, f.address as common_address
FROM (SELECT name, address, id
      FROM person) AS f
         JOIN person ON f.address = person.address
WHERE f.name != person.name AND person.id < f.id
ORDER BY 1, 2, 3;
