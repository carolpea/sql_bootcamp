SELECT DISTINCT p.name
FROM person_order AS ord
JOIN person AS p ON p.id = ord.person_id
ORDER BY 1;